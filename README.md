Restoran Yönetim ve Rezervasyon Uygulaması
Bu proje, kullanıcıların restoranlar için masa rezervasyonları yapmalarını ve restoran sahiplerinin masa yönetimini kolaylaştırmalarını sağlayan bir Flutter uygulamasıdır. Uygulama, Firebase Firestore kullanarak verileri yönetir ve Firebase Authentication ile kullanıcı kimlik doğrulaması sağlar.

Özellikler
Masa Yönetimi: Restoran sahipleri, restoranlarına ait masaların durumlarını görüntüleyebilir ve güncelleyebilir.
Rezervasyon Yapma: Kullanıcılar, uygun masalar için rezervasyon yapabilir ve mevcut rezervasyonlarını görüntüleyebilir.
Çoklu Restoran Desteği: Birden fazla restoranın yönetimi ve rezervasyonu tek bir uygulama üzerinden gerçekleştirilebilir.
Firebase Entegrasyonu: Uygulama, verilerin bulut tabanlı olarak saklanması ve yönetilmesi için Firebase Firestore'u kullanır. Ayrıca kullanıcıların güvenli bir şekilde giriş yapmaları için Firebase Authentication kullanılır.
Kurulum
Flutter Kurulumu: Uygulamayı çalıştırmak için Flutter SDK'yı kurmanız gerekmektedir. Flutter'ın en son sürümünü Flutter resmi web sitesinden yükleyin.

Firebase Projesi Oluşturma: Firebase Console üzerinden bir Firebase projesi oluşturun ve Firestore Database ile Authentication özelliklerini etkinleştirin. Ardından, Firebase yapılandırma dosyasını Flutter projenize ekleyin.

Proje Bağımlılıklarını Yükleme:

Proje dizininde terminal açın ve aşağıdaki komutu çalıştırarak bağımlılıkları yükleyin:

flutter pub get

Firebase Yapılandırması:

Firebase Firestore'da gerekli koleksiyonları ve belgeleri oluşturmak için uygulama çalıştırıldıktan sonra DataInitializer sınıfını çalıştırın.
Uygulamayı Çalıştırma:

Uygulamayı aşağıdaki komutla başlatabilirsiniz:

flutter run 

Proje Yapısı
lib/: Uygulamanın ana kodlarını içeren dizin.

main.dart: Uygulamanın başlangıç noktası.
restaurant_pages/: Her bir restoranın sayfasını ve ilgili bileşenleri içeren dosyalar.
auth/: Kullanıcı giriş ve kayıt işlemlerini yöneten dosyalar.
services/: Firebase ile etkileşimde bulunan hizmet sınıflarını içeren dosyalar.
assets/: Uygulamada kullanılan resim ve grafik dosyaları.

Kullanım
Giriş Yapma: Uygulamaya giriş yapın veya yeni bir hesap oluşturun.
Restoran Seçimi: Anasayfada mevcut restoranlardan birini seçin.
Masa Durumunu Görüntüleme: Seçilen restoranın mevcut masalarını ve durumlarını görüntüleyin.
Rezervasyon Yapma: Uygun bir masa seçerek rezervasyonunuzu yapın.
