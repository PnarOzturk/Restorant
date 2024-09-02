import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deneme20/services/table_service.dart';

class TableScreen extends StatefulWidget {
  final String restaurantId;

  TableScreen({required this.restaurantId});

  @override
  _TableScreenState createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  final TableService _tableService = TableService();
  String _selectedTableId = '';

  void _updateTableStatus(String status) async {
    if (_selectedTableId.isNotEmpty) {
      await _tableService.updateTableStatus(widget.restaurantId, _selectedTableId, status);
      setState(() {});
    }
  }

  void _reserveTable(String tableId) {
    setState(() {
      _selectedTableId = tableId;
    });

    _updateTableStatus('reserved');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Masa Rezervasyonu'),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance
            .collection('restaurants')
            .doc(widget.restaurantId)
            .collection('tables')
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data?.docs.isEmpty == true) {
            return Center(child: Text('No tables found.'));
          }

          return ListView(
            children: snapshot.data!.docs.map((doc) {
              final tableId = doc.id;
              final status = doc['status'] ?? 'available';

              return ListTile(
                title: Text('Masa: $tableId'),
                subtitle: Text('Durum: $status'),
                leading: status == 'reserved'
                    ? Image.asset('assets/dolu_masa.png')
                    : null,
                trailing: ElevatedButton(
                  onPressed: status == 'available'
                      ? () => _reserveTable(tableId)
                      : null,
                  child: Text('Rezervasyon Yap'),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
