import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deneme20/services/table_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MasaDuzeniSayfasi extends StatefulWidget {
  final String restaurantId;

  MasaDuzeniSayfasi({required this.restaurantId});

  @override
  _MasaDuzeniSayfasiState createState() => _MasaDuzeniSayfasiState();
}

class _MasaDuzeniSayfasiState extends State<MasaDuzeniSayfasi> {
  final List<String> masaResimleri = List.generate(
    16,
        (index) => 'assets/bos_masa.png',
  );

  int? selectedIndex;
  int? selectedCapacity;
  bool isCapacitySelected = false;
  final TableService _tableService = TableService();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<Map<String, dynamic>> selectedTables = [];

  @override
  void initState() {
    super.initState();
    _loadTableStatuses();
  }

  Future<void> _loadTableStatuses() async {
    for (int i = 0; i < masaResimleri.length; i++) {
      try {
        final tableDoc = await _firestore
            .collection('restaurants')
            .doc(widget.restaurantId)
            .collection('tables')
            .doc('table$i')
            .get();

        if (tableDoc.exists && tableDoc['status'] == 'occupied') {
          masaResimleri[i] = 'assets/dolu_masa.png';
        } else {
          masaResimleri[i] = 'assets/bos_masa.png';
        }
      } catch (e) {
        print('Error loading table status: $e');
      }
    }
    setState(() {});
  }

  Future<void> _reserveTable() async {
    if (!isCapacitySelected) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Lütfen masa tipi seçiniz')),
      );
      return;
    }

    if (selectedIndex == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Lütfen bir masa seçiniz')),
      );
      return;
    }

    try {
      final tableDoc = await _firestore
          .collection('restaurants')
          .doc(widget.restaurantId)
          .collection('tables')
          .doc('table$selectedIndex')
          .get();

      if (tableDoc.exists && tableDoc['status'] == 'occupied') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Bu masa dolu')),
        );
        return;
      }


      selectedTables.add({
        'restaurantId': widget.restaurantId,
        'tableId': 'table$selectedIndex',
        'capacity': selectedCapacity,
      });


      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final reservationRef = _firestore
            .collection('users')
            .doc(user.uid)
            .collection('reservations')
            .doc('currentReservation');

        final reservationData = await reservationRef.get();

        if (reservationData.exists) {
          List<dynamic> existingTables = reservationData['tables'] ?? [];
          existingTables.addAll(selectedTables);
          await reservationRef.update({'tables': existingTables});
        } else {
          await reservationRef.set({'tables': selectedTables});
        }
      }


      await _firestore
          .collection('restaurants')
          .doc(widget.restaurantId)
          .collection('tables')
          .doc('table$selectedIndex')
          .update({'status': 'occupied'});


      setState(() {
        masaResimleri[selectedIndex!] = 'assets/dolu_masa.png';
        selectedIndex = null;
        isCapacitySelected = false;
        selectedCapacity = null;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Masa rezerve edildi')),
      );

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Rezervasyon sırasında bir hata oluştu: $e')),
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Masa Düzeni - ${widget.restaurantId}'),
        backgroundColor: Colors.red[900],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.42mjrUD9by0aAc4aQoH8sQHaNK%26pid%3DApi&f=1&ipt=1b9eb1ae6b3bffe9cf44b767df3db70c2f745d27ed3e1ca1f690669e948ff94e&ipo=images',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                color: Colors.red[50]?.withOpacity(0.8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Lütfen kaç kişilik masa seçmek istediğinizi belirtin:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    SizedBox(height: 8),
                    DropdownButton<int>(
                      value: selectedCapacity,
                      hint: Text('Masa seçiniz', style: TextStyle(color: Colors.black)),
                      items: [1, 2, 3, 4].map((capacity) {
                        return DropdownMenuItem<int>(
                          value: capacity,
                          child: Text('$capacity kişilik masa'),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedCapacity = value;
                          isCapacitySelected = true;
                        });
                      },
                      dropdownColor: Colors.red[50]?.withOpacity(0.8),
                      style: TextStyle(color: Colors.black),
                      iconEnabledColor: Colors.black,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                  ),
                  itemCount: masaResimleri.length,
                  itemBuilder: (context, index) {
                    final isSelectedCapacity = ((index ~/ 4) + 1) == selectedCapacity;
                    final isOccupied = masaResimleri[index] == 'assets/dolu_masa.png';
                    final isSelectable = isCapacitySelected && isSelectedCapacity;

                    return Visibility(
                      visible: isCapacitySelected ? isSelectedCapacity : true,
                      child: GestureDetector(
                        onTap: isOccupied || !isSelectable ? null : () async {
                          setState(() {
                            if (selectedIndex != null) {
                              masaResimleri[selectedIndex!] = 'assets/bos_masa.png';
                            }
                            selectedIndex = index;
                            masaResimleri[index] = 'assets/secili_masa.png';
                          });

                          final tableDoc = await FirebaseFirestore.instance
                              .collection('restaurants')
                              .doc(widget.restaurantId)
                              .collection('tables')
                              .doc('table$index')
                              .get();

                          if (tableDoc.exists && tableDoc['status'] == 'occupied') {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Bu masa dolu')),
                            );
                          } else {
                            setState(() {
                              masaResimleri[index] = 'assets/secili_masa.png';
                            });
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            image: DecorationImage(
                              image: AssetImage(masaResimleri[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: _reserveTable,
                  child: Text('Devam Et'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
