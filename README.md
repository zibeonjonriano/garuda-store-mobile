# garuda_store

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



# Tugas 7: Elemen Dasar Flutter
---
## 1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.

'''Widget Tree adalah representasi logis hierarkis dari seluruh antarmuka pengguna (UI) aplikasi Flutter yang saya buat. Seluruh UI saya tersusun dari widget dalam struktur pohon, di mana setiap widget adalah simpul (node). Hubungan parent-child (induk-anak) bekerja karena widget yang berada di level atas (induk) memiliki kontrol terhadap posisi, ukuran, dan konfigurasi widget di bawahnya (anak). Pohon ini dihitung selama proses layout (pengukuran) dan kemudian digunakan saat rendering (menampilkan ke layar) serta hit testing (interaksi sentuhan). Setiap kali state (keadaan) suatu widget berubah, widget tersebut dan widget anak yang terpengaruh akan dibangun ulang (rebuilt).'''

## 2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.

'''Dalam kode yang saya gunakan untuk aplikasi "Garuda Store", beberapa widget utama adalah: StatelessWidget (sebagai basis untuk MyHomePage, ItemCard, dan InfoCard karena tidak memiliki state yang berubah secara internal), Scaffold (menyediakan kerangka dasar halaman Material Design dengan AppBar dan body), AppBar (bilah atas halaman yang menampilkan judul), Text (menampilkan teks), Icon (menampilkan ikon), Padding (memberikan jarak di sekitar widget anak), Column (menyusun widget secara vertikal), Row (menyusun widget secara horizontal), SizedBox (memberi jarak kosong/spasi), Center (memposisikan widget anak di tengah), Card (kartu dengan bayangan yang membungkus InfoCard), Material (memberi warna latar belakang dan sudut melengkung pada ItemCard), InkWell (menambahkan efek sentuhan dan menangani aksi onTap), dan GridView.count (menyusun ItemCard dalam bentuk grid).'''

## 3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.

'''MaterialApp adalah widget yang menjadi dasar dari aplikasi yang mengikuti pedoman Material Design. Biasanya digunakan sebagai widget root karena ia menyediakan fungsionalitas dan konfigurasi global yang penting untuk seluruh aplikasi, seperti:
1. Sistem Perutean (Routing) untuk navigasi antar layar.
2. Theming untuk menentukan skema warna dan gaya teks global yang dapat diwariskan ke semua widget di bawahnya. Dengan menjadi root, MaterialApp memastikan bahwa semua widget di Widget Tree memiliki akses ke layanan framework dan definisi desain Material Design yang konsisten.'''

## 4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?

'''Perbedaan mendasar antara keduanya adalah pada kemampuan pengelolaan state (keadaan). StatelessWidget adalah widget yang tidak memiliki state internal yang berubah; propertinya bersifat final dan tampilannya hanya bergantung pada input data dari widget induknya. Saya memilih StatelessWidget untuk elemen yang statis, seperti menampilkan teks atau ikon. Sebaliknya, StatefulWidget adalah widget yang dapat berubah secara dinamis selama masa pakainya karena memiliki kelas State pendamping yang mengelola data yang berubah. StatefulWidget dipilih ketika widget tersebut perlu merespons interaksi pengguna atau mengubah tampilannya berdasarkan state internal, seperti tombol counter atau checkbox.'''

## 5.  Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?

'''BuildContext adalah referensi ke lokasi widget di dalam Widget Tree; bisa dibilang ini adalah "alamat" dari widget saya. Ini sangat penting karena memungkinkan widget untuk:
1. Mengakses Data Pewarisan: Saya menggunakannya untuk mencari dan mengakses data atau layanan dari widget leluhur (ancestor) yang ada di atasnya, seperti mengakses tema menggunakan Theme.of(context).
2. Berinteraksi dengan Layanan: Saya menggunakannya untuk layanan framework seperti Navigator untuk navigasi atau ScaffoldMessenger untuk menampilkan SnackBar. Setiap widget mewajibkan adanya BuildContext context sebagai parameter di metode build (Widget build(BuildContext context)) karena ini adalah titik awal bagi widget saya untuk menemukan semua layanan yang dibutuhkan dan menentukan tempat widget tersebut akan disisipkan di UI.'''

## 6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".

'''Hot Reload adalah fitur unggulan Flutter di mana saya dapat melihat hasil perubahan kode secara instan tanpa perlu mengkompilasi ulang seluruh aplikasi. Ketika saya melakukan Hot Reload, perubahan kode hanya dimuat ke dalam Dart VM dan hanya Widget Tree yang dibangun ulang, sehingga state aplikasi tetap dipertahankan; fungsi main() atau initState() tidak dijalankan kembali. Ini ideal untuk penyesuaian UI yang cepat. Sementara itu, Hot Restart memuat perubahan kode ke dalam VM dan kemudian me-restart aplikasi Flutter secara keseluruhan, yang menyebabkan state aplikasi hilang karena fungsi main() dan initState() dijalankan kembali. Hot Restart digunakan ketika ada perubahan kode yang memengaruhi state global atau logika non-UI.'''
---

# Tugas 8: Flutter Navigation, Layouts, Forms, and Input Elements
---

## 1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?

'''Navigator.push() menambahkan halaman baru di atas stack navigasi sehingga pengguna dapat kembali ke halaman sebelumnya dengan tombol back, sedangkan Navigator.pushReplacement() mengganti halaman saat ini dengan halaman baru dan menghapus halaman sebelumnya dari stack sehingga pengguna tidak bisa kembali.
Dalam aplikasi Garuda Store, Navigator.push() sebaiknya digunakan ketika membuka form "Create Product" dari halaman utama karena pengguna mungkin ingin kembali ke halaman utama setelah mengisi atau membatalkan form, sementara Navigator.pushReplacement() cocok digunakan pada navigasi menu drawer (misalnya dari "Tambah Product" ke "Halaman Utama") untuk mencegah penumpukan halaman yang sama di stack dan memberikan pengalaman navigasi yang lebih bersih tanpa back button berulang-ulang.'''

## 2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?

'''Saya memanfaatkan Scaffold sebagai kerangka dasar di setiap halaman karena menyediakan struktur Material Design yang lengkap dengan slot untuk AppBar, Drawer, dan Body, kemudian AppBar digunakan secara konsisten di semua halaman dengan konfigurasi yang sama (warna background dari Theme.of(context).colorScheme.primary dan text berwarna putih) untuk memberikan identitas visual yang kuat, serta LeftDrawer yang sama dipasang di semua halaman untuk menyediakan menu navigasi global yang konsisten. Dengan pendekatan ini, setiap halaman dalam aplikasi Garuda Store memiliki struktur visual yang seragam dan konsisten (AppBar hijau di atas, Drawer menu di kiri, dan konten berbeda di tengah).'''

## 3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.

'''Padding memberikan jarak di sekitar widget untuk meningkatkan keterbacaan dan estetika (seperti Padding(padding: EdgeInsets.all(8.0)) yang saya gunakan di setiap TextFormField agar tidak mepet dengan elemen lain), SingleChildScrollView memungkinkan konten yang panjang dapat di-scroll sehingga mencegah overflow error ketika form memiliki banyak field atau keyboard muncul (saya gunakan sebagai wrapper untuk seluruh form di ProductEntryFormPage agar user bisa scroll dari field nama hingga tombol Save), dan ListView efisien untuk menampilkan daftar item karena menggunakan lazy loading yang hanya me-render item yang terlihat di layar (saya gunakan di LeftDrawer untuk menu items). Kombinasi ketiga widget ini membuat form saya responsif di berbagai ukuran layar, tidak ada elemen yang terpotong atau tidak bisa diakses, dan memberikan spacing yang konsisten antar elemen sehingga user experience menjadi lebih baik dan profesional.'''

## 4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?

'''
Saya mendefinisikan tema warna secara terpusat di main.dart menggunakan ThemeData dengan colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green) untuk menetapkan hijau sebagai warna utama brand Garuda Store karena hijau melambangkan kesegaran, kepercayaan, dan identitas Indonesia, kemudian menggunakan Theme.of(context).colorScheme.primary di seluruh aplikasi (AppBar, Drawer header, tombol Save, checkbox active color) alih-alih hard-code warna di setiap widget. Dengan pendekatan ini, identitas visual hijau Garuda Store konsisten di semua halaman, mudah dimaintain karena perubahan warna cukup dilakukan di satu tempat, dan scalable untuk menambahkan fitur seperti dark mode di masa depan, sementara untuk kontras dan keterbacaan, saya menggunakan text putih di atas background hijau dan menjaga konsistensi elevation pada Card components di seluruh aplikasi.'''

---
# Tugas 9: Integrasi Layanan Web Django dengan Aplikasi Flutter
---

## 1. Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?

Keuntungan menggunakan model dart :
1. Type Safety - Model Dart memiliki tipe data yang eksplisit (String, int, bool, dll) sehingga compiler bisa mendeteksi error saat compile time, bukan runtime.
2. Null Safety - Dengan model, kita bisa menentukan field mana yang nullable (?) dan mana yang required, mencegah null pointer exceptions.
3. Maintainability - Jika struktur data berubah, kita hanya perlu update model di satu tempat, bukan di seluruh aplikasi.
4. Validasi Otomatis - Model bisa memvalidasi data saat parsing dengan factory constructor.

Konsekuensi jika menggunakan Map<String, dynamic> langsung : 
1. Tidak ada type checking -> Typo di nama key tidak akan terdeteksi sampai runtime (product['nmae'] vs product['name'])
2. Runtime errors -> Salah casting tipe data akan crash saat runtime, bukan compile time
3. Sulit di-maintain -> Harus ingat struktur data dan tipe setiap field di setiap file
4. Tidak ada null safety -> Tidak tahu field mana yang bisa null, rawan null pointer exceptions
5. Kode tidak terstruktur -> Sulit untuk refactor dan scale aplikasi

## 2. Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.

Package `http`:
1. Fungsi : Library standart Dart untuk melakukan HTTP Request (GET, POST, PUT, DELETE)
2. Digunakan untuk komuniasi dengan RESY API
3. Tidak menyimpan state -> Setiap request independen, tidak ada session/cookie handling otomatis
4. Cocok untuk: Public API yang tidak butuh autentikasi

Package `pbp_django_auth` (CookieRequest):
1. Fungsi : Library khusus untuk integrasi Flutter dengan Django yang menangani cookies dan session
2. Menyimpan state -> Otomatis menyimpan dan mengirim cookies di setiap request
3. Session persistence -> User tetap login walaupun pindah halaman
4. Cocok untuk: Aplikasi dengan autentikasi Django (login/logout)

## 3. Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

Instance CookieRequest perlu dibagikan ke semua komponen karena beberapa alasan penting seperti berikut:

1. Konsistensi Session State:`CookieRequest` menyimpan session cookie yang membuktikan user sudah login, Jika setiap widget membuat instance baru, masing-masing akan punya state terpisah -> Widget A bisa "tahu" user sudah login, tapi widget B tidak tahu karena beda instance
2. Persistent Authentication: memastikan instance tetap hidup sepanjang lifecycle app
3. Automatic Cookie Management: `CookieRequest` otomatis melampirkan cookie di setiap HTTP request. Tanpa shared instance, kita harus manual pass cookie antar widget
4. State Management yang Efisien: Tidak perlu passing `CookieRequest` sebagai parameter ke setiap widget, karena qidget bisa akses dengan `context.watch<CookieRequest>()` atau `context.read<CookieRequest>()`
5. Sinkronisasi Logout: Ketika logout, cookie dihapus dari shared instance -> Semua widget langsung "tahu" user sudah logout

## 4.  Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?

**1. `10.0.2.2` di ALLOWED_HOSTS**
* Android Emulator tidak bisa akses `localhost` langsung
* `10.0.2.2` = alamat khusus yang mengarah ke `localhost` komputer host
* Tanpa ini: 400 Bad Request

**2. CORS (Cross-Origin Resource Sharing)**
* Flutter dan Django berjalan di port berbeda = beda origin
* Browser blokir request cross-origin secara default (security)
* CORS kasih "izin" agar browser terima response
* Tanpa ini: Request diblokir browser, CORS error

**3. `SameSite='None'` & Secure pada Cookie**
* Browser modern blokir cookie cross-origin (security)
* `SameSite='None'` membolehkan cookie dikirim cross-origin
* Diperlukan agar session cookie (login) tersimpan & terkirim
* Tanpa ini: User login tapi session hilang, dianggap belum login terus

**4. INTERNET Permission di Android**
* Android blokir akses internet secara default (security)
* App harus minta izin di AndroidManifest.xml
* Tanpa ini: Semua network request gagal

## 5. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.

**ALUR CREATE PRODUCT (INPUT -> Database)**

**1. Input Data di Flutter:**
Di productentry_form.dart, user mengisi form:

```
// lib/screens/productentry_form.dart (Line 17-23)
final _formKey = GlobalKey<FormState>();
String _name = "";
int _price = 0;
String _description = "";
String _thumbnail = "";
String _category = "";
bool _isFeatured = false;
```
User mengisi field melalui widget form (TextFormField, DropdownButton, CheckboxListTile).

**2. Flutter Kirim ke Django Backend:** 
User klik tombol "Save", data dikirim sebagai JSON
```
// lib/screens/productentry_form.dart (Line 262-280)
onPressed: () async {
  if (_formKey.currentState!.validate()) {
    final response = await request.postJson(
      "http://localhost:8000/create-flutter/",
      jsonEncode({
        "name": _name,                    // "Manchester United Home Kit"
        "price": _price,                  // 1500000
        "description": _description,      // "Official jersey..."
        "thumbnail": _thumbnail,          // "https://..."
        "category": _category.toLowerCase(), // "jersey"
        "is_featured": _isFeatured,       // true
        "size": "m",
        "stock": 0,
      }),
    );
```

**Request yang dikirim:** 
```
POST /create-flutter/ HTTP/1.1
Host: localhost:8000
Content-Type: application/json
Cookie: sessionid=abc123xyz...

{
  "name": "Manchester United Home Kit",
  "price": 1500000,
  "description": "Official jersey...",
  "thumbnail": "https://example.com/image.jpg",
  "category": "jersey",
  "is_featured": true,
  "size": "m",
  "stock": 0
}
```

**3. Django Terima dan Proses Data**
Django menerima request di endpoint /create-flutter/:
```
# garuda-store/main/views.py (Line 331-363)
@csrf_exempt
def create_product_flutter(request):
    if request.method == 'POST':
        data = json.loads(request.body)  # Parse JSON body

        # Ambil data dari JSON
        name = strip_tags(data.get("name", ""))
        price = data.get("price", 0)
        description = strip_tags(data.get("description", ""))
        thumbnail = data.get("thumbnail", "")
        category = data.get("category", "")
        is_featured = data.get("is_featured", False)

        # Optional fields
        size = data.get("size", "xs")
        stock = data.get("stock", 0)

        user = request.user  # User dari session cookie

        # Buat object Product baru
        new_product = Product(
            name=name,
            price=price,
            description=description,
            thumbnail=thumbnail,
            category=category,
            is_featured=is_featured,
            size=size,
            stock=stock,
            user=user  # Associate dengan user yang login
        )
        
        new_product.save()  # Simpan ke database PostgreSQL/SQLite

        return JsonResponse({"status": "success"}, status=200)
```

data tersimpan dalam database : 
```INSERT INTO main_product (name, price, description, category, user_id, ...) 
VALUES ('Manchester United Home Kit', 1500000, 'Official jersey...', 'jersey', 1, ...);
```

**4. Django Kirim Response**

```# garuda-store/main/views.py (Line 361)
return JsonResponse({"status": "success"}, status=200)
```
respon yang diterima Flutter
```{
  "status": "success"
}
```

**5. Flutter Proses Response**
Flutter menerima response dan menampilkan notifikasi
```
// lib/screens/productentry_form.dart (Line 282-297)
if (context.mounted) {
  if (response["status"] == "success") {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Product berhasil disimpan!"))
    );

    // Redirect ke homepage
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage()),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Gagal menyimpan product!"))
    );
  }
}
```

**FETCH & DISPLAY PRODUCT (Database -> Tampilkan di Flutter)**

**1. Flutter Request Data**

Di `product_entry_list.dart`, Flutter fetch data saat halaman dibuka: 
```
// lib/screens/product_entry_list.dart (Line 24-38)
Future<List<ProductEntry>> fetchProducts(CookieRequest request) async {
  // Pilih endpoint berdasarkan parameter
  final url = widget.showMyProductsOnly 
      ? 'http://localhost:8000/products/json/my/'  // Hanya products user ini
      : 'http://localhost:8000/products/json/';     // Semua products
  
  final response = await request.get(url);  // GET request dengan session cookie
  var data = response;
  
  // Parse JSON ke list of ProductEntry objects
  List<ProductEntry> listProduct = [];
  for (var d in data) {
    if (d != null) {
      listProduct.add(ProductEntry.fromJson(d));
    }
  }
  return listProduct;
}
```

Request yang dikirim: 
```
GET /products/json/ HTTP/1.1
Host: localhost:8000
Cookie: sessionid=abc123xyz...
Accept: application/json
```

**2. Django Query Database dan Return JSON**
Django query semua product dari database:
```
# garuda-store/main/views.py (Line 50-68)
def products_json(request):
    products = Product.objects.all()  # Query semua products dari database
    data = [
        {
            'id': str(product.id),
            'name': product.name,
            'price': product.price,
            'description': product.description,
            'category': product.category,
            'thumbnail': product.thumbnail,
            'product_views': product.product_views,
            'created_at': product.created_at.isoformat() if product.created_at else None,
            'is_featured': product.is_featured,
            'user_id': product.user_id,
        }
        for product in products
    ]

    return JsonResponse(data, safe=False)
```
Atau jika filter "My Products":
```
# garuda-store/main/views.py (products_json_by_user)
@login_required(login_url='/login')
def products_json_by_user(request):
    products = Product.objects.filter(user=request.user)  # Filter by user
    # ... sama seperti di atas
    return JsonResponse(data, safe=False)
```

Respon JSON yang dikirim:
```
[
  {
    "id": "1",
    "name": "Manchester United Home Kit",
    "price": 1500000,
    "description": "Official jersey...",
    "category": "jersey",
    "thumbnail": "https://example.com/image.jpg",
    "product_views": 125,
    "created_at": "2024-11-15T10:30:00",
    "is_featured": true,
    "user_id": 1
  },
  {
    "id": "2",
    "name": "Chelsea Away Kit",
    "price": 1400000,
    ...
  }
]
```

**3. Flutter Parse JSON ke Model**
Flutter menerima JSON dan convert ke object Dart menggunakan model:
dart
```
// lib/models/product_entry.dart (Line 18-31)
class ProductEntry {
    String id;
    String name;
    int price;
    String description;
    String category;
    String thumbnail;
    int productViews;
    DateTime createdAt;
    bool isFeatured;
    int userId;

    factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        category: json["category"],
        thumbnail: json["thumbnail"],
        productViews: json["product_views"],
        createdAt: DateTime.parse(json["created_at"]),
        isFeatured: json["is_featured"],
        userId: json["user_id"],
    );
}
```

**4. Flutter Render UI dengan FutureBuilder**
Data yang sudah di-parse ditampilkan di UI:
```
// lib/screens/product_entry_list.dart (Line 47-81)
@override
Widget build(BuildContext context) {
  final request = context.watch<CookieRequest>();
  return Scaffold(
    appBar: AppBar(
      title: Text(widget.showMyProductsOnly ? 'My Products' : 'All Products'),
    ),
    body: FutureBuilder(
      future: fetchProducts(request),  // Panggil fetch data
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          // Loading state
          return const Center(child: CircularProgressIndicator());
        } else {
          if (!snapshot.hasData || snapshot.data.isEmpty) {
            // Empty state
            return Center(child: Text('No products available.'));
          } else {
            // Tampilkan data dengan ListView
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) => ProductEntryCard(
                product: snapshot.data![index],  // Pass data ke card
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => ProductDetailPage(
                      product: snapshot.data![index],
                    ),
                  ));
                },
              ),
            );
          }
        }
      },
    ),
  );
}
```

**5. Tampilkan Data di ProductEntryCard**
Setiap product ditampilkan dengan widget card:
```
// lib/widgets/product_entry_card.dart
class ProductEntryCard extends StatelessWidget {
  final ProductEntry product;
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          // Thumbnail
          Image.network(product.thumbnail, height: 200, fit: BoxFit.cover),
          
          // Featured badge
          if (product.isFeatured)
          Container(child: Text('⭐ Featured')),
          
          // Category
          Container(child: Text(product.category.toUpperCase())),
          
          // Name
          Text(product.name, style: TextStyle(fontSize: 18, fontWeight: bold)),
          
          // Price
          Text('Rp ${product.price}', style: TextStyle(color: green, fontSize: 20)),
          
          // Description
          Text(product.description, maxLines: 3),
          
          // Views
          Text('${product.productViews} views'),
        ],
      ),
    );
  }
}
```

## 6. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

**A. REGISTER**
1. Flutter - User Input:
```
// register.dart (Line 102-104)
String username = _usernameController.text;
String password1 = _passwordController.text;
String password2 = _confirmPasswordController.text;
```

2. Flutter - Kirim JSON:
```
// register.dart (Line 112-118)
final response = await request.postJson(
  "http://localhost:8000/auth/register/",
  jsonEncode({
    "username": username,
    "password1": password1,
    "password2": password2,
  })
);
```

3. Django - Validasi & Buat User:
```
# authentication/views.py (Line 42-73)
def register(request):
    data = json.loads(request.body)  # Parse JSON
    
    if data['password1'] != data['password2']:
        return JsonResponse({"status": False, "message": "Passwords do not match."})
    
    if User.objects.filter(username=data['username']).exists():
        return JsonResponse({"status": False, "message": "Username already exists."})
    
    user = User.objects.create_user(username=username, password=password1)
    user.save()
    
    return JsonResponse({"status": 'success', "message": "User created successfully!"})
```

4. Flutter - Redirect:
```
// register.dart (Line 120-130)
if (response['status'] == 'success') {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text('Successfully registered!'))
  );
  Navigator.pushReplacement(context,
    MaterialPageRoute(builder: (context) => const LoginPage())
  );
}
```

**B.LOGIN**
1. Flutter - Input Credentials:
```
// login.dart (Line 92-96)
String username = _usernameController.text;
String password = _passwordController.text;

final response = await request.login(
  "http://localhost:8000/auth/login/", {
    'username': username,
    'password': password,
  }
);
```
2. Django - Authenticate & Buat Session:
```
# authentication/views.py (Line 11-33)
def login(request):
    username = request.POST['username']  # Form data (bukan JSON)
    password = request.POST['password']
    
    user = authenticate(username=username, password=password)
    
    if user is not None and user.is_active:
        auth_login(request, user)  # Buat session
        return JsonResponse({
            "username": user.username,
            "status": True,
            "message": "Login successful!"
        })
    else:
        return JsonResponse({
            "status": False,
            "message": "Login failed, please check your username or password."
        })
```

3. Flutter - Navigation:
```
// login.dart (Line 98-109)
if (request.loggedIn) {
  String message = response['message'];
  String uname = response['username'];
  
  Navigator.pushReplacement(context,
    MaterialPageRoute(builder: (context) => MyHomePage())
  );
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text("$message Welcome, $uname."))
  );
}
```

4. Jika gagal:
```
// login.dart (Line 111-128)
else {
  String serverMessage = response['message'] ?? 'Periksa kredensial atau koneksi.';
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Login Failed'),
      content: Text(serverMessage),
      // ... OK button
    ),
  );
}
```

**C.LOGOUT**
1. Flutter - Request:
`final response = await request.logout("http://localhost:8000/auth/logout/");`

2.  Django - Hapus Session:
```
# authentication/views.py (Line 76-87)
def logout(request):
    username = request.user.username
    try:
        auth_logout(request)  # Hapus session
        return JsonResponse({
            "username": username,
            "status": True,
            "message": "Logged out successfully!"
        })
    except:
        return JsonResponse({"status": False, "message": "Logout failed."})
```

3. Flutter - Redirect:
```
if (response['status']) {
  Navigator.pushReplacement(context,
    MaterialPageRoute(builder: (context) => const LoginPage())
  );
}
```

## 7.  Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).

1. Membuat `django-app` bernama `authentication` pada project django yang telah dibuat
2. Menambahkan `authentication` ke `INSTALLED_APPS` pada main project settings.py aplikasi Django 
3. Menjalankan perintah `pip install django-cors-headers` untuk menginstal library yang dibutuhkan.
4. Menambahkan corsheaders ke INSTALLED_APPS pada main project settings.py aplikasi Django 
5. Menambahkan `corsheaders.middleware.CorsMiddleware` ke MIDDLEWARE pada main project `settings.py` aplikasi Django
6. Menambahkan beberapa variabel berikut ini pada main project `settings.py` aplikasi Django kamu.
```
CORS_ALLOW_ALL_ORIGINS = True
CORS_ALLOW_CREDENTIALS = True
CSRF_COOKIE_SECURE = True
SESSION_COOKIE_SECURE = True
CSRF_COOKIE_SAMESITE = 'None'
SESSION_COOKIE_SAMESITE = 'None'
```

7. Untuk keperluan integrasi ke Django dari emulator Android, tambahkan `10.0.2.2` pada `ALLOWED_HOSTS` di berkas `settings.py`.

8. Membuat method view untuk login, register, logout pada `authentication/views.py`
```
from django.shortcuts import render
from django.contrib.auth import authenticate, login as auth_login
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth.models import User
import json
from django.contrib.auth import logout as auth_logout
from django.views.decorators.csrf import csrf_exempt
from django.http import JsonResponse

# Create your views here.
@csrf_exempt
def login(request):
    username = request.POST['username']
    password = request.POST['password']
    user = authenticate(username=username, password=password)
    if user is not None:
        if user.is_active:
            auth_login(request, user)
            # Login status successful.
            return JsonResponse({
                "username": user.username,
                "status": True,
                "message": "Login successful!"
                # Add other data if you want to send data to Flutter.
            }, status=200)
        else:
            return JsonResponse({
                "status": False,
                "message": "Login failed, account is disabled."
            }, status=401)

    else:
        return JsonResponse({
            "status": False,
            "message": "Login failed, please check your username or password."
        }, status=401)
    
@csrf_exempt
def register(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        username = data['username']
        password1 = data['password1']
        password2 = data['password2']

        # Check if the passwords match
        if password1 != password2:
            return JsonResponse({
                "status": False,
                "message": "Passwords do not match."
            }, status=400)
        
        # Check if the username is already taken
        if User.objects.filter(username=username).exists():
            return JsonResponse({
                "status": False,
                "message": "Username already exists."
            }, status=400)
        
        # Create the new user
        user = User.objects.create_user(username=username, password=password1)
        user.save()
        
        return JsonResponse({
            "username": user.username,
            "status": 'success',
            "message": "User created successfully!"
        }, status=200)
    
    else:
        return JsonResponse({
            "status": False,
            "message": "Invalid request method."
        }, status=400)

@csrf_exempt
def logout(request):
    username = request.user.username
    try:
        auth_logout(request)
        return JsonResponse({
            "username": username,
            "status": True,
            "message": "Logged out successfully!"
        }, status=200)
    except:
        return JsonResponse({
            "status": False,
            "message": "Logout failed."
        }, status=401)
```

9. Buat file `urls.py` pada folder `authentication` dan tambahkan URL routing terhadap fungsi yang sudah dibuat dengan endpoint `login/`.`register/`,`logout/`
```
from django.urls import path
from authentication.views import login, register, logout

app_name = 'authentication'

urlpatterns = [
    path('login/', login, name='login'),
    path('register/', register, name='register'),
    path('logout/', logout, name='logout')
]
```

10. Tambahkan `path('auth/', include('authentication.urls')), pada file football_news/urls.py.`

### Melakukan Integrasi Sistem Authentikasi pada Flutter

11. Instal package yang telah disediakan oleh tim asisten dosen dengan menjalankan perintah berikut di Terminal. 
```
flutter pub add provider
flutter pub add pbp_django_auth
```

12. memodifikasi root widget untuk menyediakan CookieRequest library ke semua child widgets dengan menggunakan `Provider`. Dan sekaligus menerapkan design theme pada aplikasi.  

```
import 'package:flutter/material.dart';
import 'package:garuda_store/screens/login.dart';
// import 'package:garuda_store/screens/menu.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'Garuda Store',
        theme: ThemeData(
          // DARK THEME seperti di web
          brightness: Brightness.dark,
          scaffoldBackgroundColor: const Color(0xFF232323),

          // Lime green accent
          colorScheme: ColorScheme.dark(
            primary: const Color(0xFFB3F300), // #b3f300 (lime green)
            secondary: const Color(0xFFBFD596), // #bfd596 (hover)
            surface: const Color(0xFF010101), // #010101 (card bg)
            background: const Color(0xFF232323), // #232323 (main bg)
          ),

          // AppBar theme
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF010101), // Dark
            foregroundColor: Color(0xFFB3F300), // Lime green text
            elevation: 0,
          ),

          // Card theme
          cardTheme: CardThemeData(
            color: const Color(0xFF010101),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: Color(0xFFB3F300), width: 1),
            ),
          ),

          // Card Theme
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFB3F300),
              foregroundColor: Colors.black,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),

          // Text theme
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.white),
            bodyMedium: TextStyle(color: Colors.white),
            titleLarge: TextStyle(color: Color(0xFFB3F300)),
          ),

          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          useMaterial3: true,
        ),
        home: const LoginPage(),
      ),
    );
  }
}
```

13. Membuat berkas baru pada didalam folder `screens` dengan nama `login.dart.` dan `register.dart`

14. Mengisi berkas `login.dart` dengan kode berikut.

```
import 'package:garuda_store/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:garuda_store/screens/register.dart';

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: Theme.of(context), // ambil theme dari main.dart
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
        appBar: AppBar(
            title: const Text('Login'),
        ),
        body: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      hintText: 'Enter your username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: () async {
                      String username = _usernameController.text;
                      String password = _passwordController.text;

                      // Check credentials
                      // TODO: Change the URL and don't forget to add trailing slash (/) at the end of URL!
                      // To connect Android emulator with Django on localhost, use URL http://10.0.2.2/
                      // If you using chrome,  use URL http://localhost:8000
                      final response = await request
                          .login("http://localhost:8000/auth/login/", {
                        'username': username,
                        'password': password,
                      });

                      if (request.loggedIn) {
                        String message = response['message'];
                        String uname = response['username'];
                        if (context.mounted) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()),
                          );
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                              SnackBar(
                                  content:
                                      Text("$message Welcome, $uname.")),
                            );
                        }
                      } else {
                        String serverMessage = response['message'] ?? 'Periksa kredensial atau koneksi.';
                        if (context.mounted) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Login Failed'),
                              content: Text(serverMessage),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    child: const Text('Login'),
                  ),
                  const SizedBox(height: 36.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterPage(),
                        ),
                      );
                    },
                    child: Text(
                      'Don\'t have an account? Register',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```

15. Mengisi berkas `register.dart` dengan kode berikut.
```
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:garuda_store/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      hintText: 'Enter your username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12.0),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12.0),
                  TextFormField(
                    controller: _confirmPasswordController,
                    decoration: const InputDecoration(
                      labelText: 'Confirm Password',
                      hintText: 'Confirm your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: () async {
                      String username = _usernameController.text;
                      String password1 = _passwordController.text;
                      String password2 = _confirmPasswordController.text;

                      // Check credentials
                      // TODO: Change the URL and don't forget to add trailing slash (/) at the end of URL!
                      // To connect Android emulator with Django on localhost, use URL http://10.0.2.2/
                      // If you using chrome,  use URL http://localhost:8000       
                      final response = await request.postJson(
                          "http://localhost:8000/auth/register/",
                          jsonEncode({
                            "username": username,
                            "password1": password1,
                            "password2": password2,
                          }));
                      if (context.mounted) {
                        if (response['status'] == 'success') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Successfully registered!'),
                            ),
                          );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Failed to register!'),
                            ),
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    child: const Text('Register'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```
### Pembuatan Model Kustom

1. Copy JSON dari `/products/json/`

2. Paste ke Quicktype

3. Generate Dart model

4. Save ke `lib/models/product_entry.dart`
```
// To parse this JSON data, do
//
//     final productEntry = productEntryFromJson(jsonString);

import 'dart:convert';

List<ProductEntry> productEntryFromJson(String str) => List<ProductEntry>.from(json.decode(str).map((x) => ProductEntry.fromJson(x)));

String productEntryToJson(List<ProductEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
    String id;
    String name;
    int price;
    String description;
    String category;
    String thumbnail;
    int productViews;
    DateTime createdAt;
    bool isFeatured;
    int userId;

    ProductEntry({
        required this.id,
        required this.name,
        required this.price,
        required this.description,
        required this.category,
        required this.thumbnail,
        required this.productViews,
        required this.createdAt,
        required this.isFeatured,
        required this.userId,
    });

    factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        category: json["category"],
        thumbnail: json["thumbnail"],
        productViews: json["product_views"],
        createdAt: DateTime.parse(json["created_at"]),
        isFeatured: json["is_featured"],
        userId: json["user_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "category": category,
        "thumbnail": thumbnail,
        "product_views": productViews,
        "created_at": createdAt.toIso8601String(),
        "is_featured": isFeatured,
        "user_id": userId,
    };
}

```


5. Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django. `screens/product_entry_list.dart` yang menampilkan name, price, description, thumbnail, category, dan is_featured dari masing-masing product.

6. Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item (menampilkan seluruh field atribut yang ada) pada `screens/product_entry_list.dart`. Filter My Product juga dilakukan pada halaman ini.
```
import 'package:flutter/material.dart';
import 'package:garuda_store/models/product_entry.dart';
import 'package:garuda_store/widgets/left_drawer.dart';
import 'package:garuda_store/screens/product_detail.dart';
import 'package:garuda_store/widgets/product_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class ProductEntryListPage extends StatefulWidget {
  final bool showMyProductsOnly;
  
  const ProductEntryListPage({
    super.key, 
    this.showMyProductsOnly = false,
  });

  @override
  State<ProductEntryListPage> createState() => _ProductEntryListPageState();
}

class _ProductEntryListPageState extends State<ProductEntryListPage> {
  Future<List<ProductEntry>> fetchProducts(CookieRequest request) async {
    // Pilih endpoint berdasarkan parameter
    final url = widget.showMyProductsOnly 
        ? 'http://localhost:8000/products/json/my/'
        : 'http://localhost:8000/products/json/';
    
    final response = await request.get(url);
    var data = response;
    
    List<ProductEntry> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(ProductEntry.fromJson(d));
      }
    }
    return listProduct;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.showMyProductsOnly ? 'My Products' : 'All Products'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProducts(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData || snapshot.data.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.shopping_bag_outlined, size: 80, color: Colors.grey),
                    const SizedBox(height: 16),
                    Text(
                      widget.showMyProductsOnly 
                          ? 'You have no products yet.' 
                          : 'No products available.',
                      style: const TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => ProductEntryCard(
                  product: snapshot.data![index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailPage(
                          product: snapshot.data![index],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          }
        },
      ),
    );
  }
}
```

7. Membuat fungsi views django pada `main/views.py` yang dapat meng-filter product sendiri "My Products"
```
@login_required(login_url='auth/login')
def products_json_by_user(request):
    """Return JSON products owned by logged-in user"""
    products = Product.objects.filter(user=request.user)
    data = [
        {
            'id': str(product.id),
            'name': product.name,
            'price': product.price,
            'description': product.description,
            'category': product.category,
            'thumbnail': product.thumbnail,
            'product_views': product.product_views,
            'created_at': product.created_at.isoformat() if product.created_at else None,
            'is_featured': product.is_featured,
            'user_id': product.user_id,
        }
        for product in products
    ]
    return JsonResponse(data, safe=False)
```

8. Membuat fungsi views django untuk create product pada `main/views.py` 
```
@csrf_exempt
def create_product_flutter(request):
    if request.method == 'POST':
        data = json.loads(request.body)

        name = strip_tags(data.get("name", ""))
        price = data.get("price", 0)
        description = strip_tags(data.get("description", ""))
        thumbnail = data.get("thumbnail", "")
        category = data.get("category", "")
        is_featured = data.get("is_featured", False)

        # Optional fields
        size = data.get("size", "xs")
        stock = data.get("stock", 0)

        user = request.user  # Anda sudah punya user dari session/login

        new_product = Product(
            name=name,
            price=price,
            description=description,
            thumbnail=thumbnail,
            category=category,
            is_featured=is_featured,
            size=size,
            stock=stock,
            user=user
        )
        
        new_product.save()

        return JsonResponse({"status": "success"}, status=200)

    return JsonResponse({"status": "error"}, status=401)
```

9.  Menambahkan endpoint proxy untuk mengatasi masalah CORS pada gambar.Tambahkan `import request` pada bagian atas file `main/views.py`. Dan tambahkan fungsi berikut.
```
  def proxy_image(request):
    image_url = request.GET.get('url')
    if not image_url:
        return HttpResponse('No URL provided', status=400)
    
    try:
        # Fetch image from external source
        response = requests.get(image_url, timeout=10)
        response.raise_for_status()
        
        # Return the image with proper content type
        return HttpResponse(
            response.content,
            content_type=response.headers.get('Content-Type', 'image/jpeg')
        )
    except requests.RequestException as e:
        return HttpResponse(f'Error fetching image: {str(e)}', status=500)
```


10. Membuat berkas baru pada direktori `lib/widgets` dengan nama `product_entry_card.dart`
```
import 'package:flutter/material.dart';
import 'package:garuda_store/models/product_entry.dart';

class ProductEntryCard extends StatelessWidget {
  final ProductEntry product;
  final VoidCallback? onTap;

  const ProductEntryCard({
    super.key,
    required this.product,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // THUMBNAIL
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: product.thumbnail.isNotEmpty
                  ? Image.network(
                      'http://localhost:8000/proxy-image/?url=${Uri.encodeComponent(product.thumbnail)}',
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 200,
                        color: Colors.grey[300],
                        child: const Center(
                          child: Icon(Icons.broken_image, size: 50),
                        ),
                      ),
                    )
                  : Container(
                      height: 200,
                      color: Colors.grey[300],
                      child: const Center(
                        child: Icon(Icons.image_not_supported, size: 50),
                      ),
                    ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //  IS_FEATURED Badge
                  if (product.isFeatured)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 4.0,
                      ),
                      margin: const EdgeInsets.only(bottom: 12.0),
                      decoration: BoxDecoration(
                        color: Colors.amber.shade100,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: const Text(
                        '⭐ Featured Product',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          color: Color.fromARGB(255, 140, 79, 0),
                        ),
                      ),
                    ),
                  
                  //  CATEGORY Badge
                  Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 2.0,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Text(
                          product.category.toUpperCase(),
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.green.shade900,
                          ),
                        ),
                      ),
                  
                  const SizedBox(height: 8),
                  
                  //  NAME (Product Title)
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  
                  const SizedBox(height: 8),
                  
                  //  PRICE
                  Text(
                    'Rp ${product.price.toString().replaceAllMapped(
                      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                      (Match m) => '${m[1]}.',
                    )}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary, // ckarena gapake const makanya bisa pake context theme
                    ),
                  ),
                  
                  const SizedBox(height: 8),
                  
                  //  DESCRIPTION
                  Text(
                    product.description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                      height: 1.4,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  
                  const SizedBox(height: 12),
                  
                  // Footer info
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.visibility, size: 16, color: Colors.grey[600]),
                          const SizedBox(width: 4),
                          Text(
                            '${product.productViews} views',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.indigo,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

11. Membuat berkas baru pada direktori `lib/screens` dengan nama `product_detail.dart`.
```
import 'package:flutter/material.dart';
import 'package:garuda_store/models/product_entry.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductEntry product;

  const ProductDetailPage({super.key, required this.product});

  String _formatDate(DateTime date) {
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${date.day} ${months[date.month - 1]} ${date.year}, ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }

  String _formatPrice(int price) {
    return price.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]}.',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // THUMBNAIL
            if (product.thumbnail.isNotEmpty)
              Image.network(
                'http://localhost:8000/proxy-image/?url=${Uri.encodeComponent(product.thumbnail)}',
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 250,
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(Icons.broken_image, size: 50),
                  ),
                ),
              ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // IS_FEATURED Badge
                  if (product.isFeatured)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 6.0,
                      ),
                      margin: const EdgeInsets.only(bottom: 12.0),
                      decoration: BoxDecoration(
                        color: Colors.amber.shade100,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: const Text(
                        '⭐ Featured Product',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Color.fromARGB(255, 140, 79, 0),
                        ),
                      ),
                    ),

                  // NAME (Product Title)
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Price
                  Text(
                    'Rp ${_formatPrice(product.price)}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(
                        context,
                      ).colorScheme.primary, // Lime green
                    ),
                  ),
                  const SizedBox(height: 12),

                  // CATEGORY and Date
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 4.0,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Text(
                          product.category.toUpperCase(),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.green.shade900,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        _formatDate(product.createdAt),
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Views count
                  Row(
                    children: [
                      Icon(Icons.visibility, size: 16, color: Colors.grey[600]),
                      const SizedBox(width: 4),
                      Text(
                        '${product.productViews} views',
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                    ],
                  ),

                  const Divider(height: 32),

                  // DESCRIPTION (Full Content)
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.description,
                    style: const TextStyle(fontSize: 16.0, height: 1.6),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 24),

                  // Tombol Back (Optional - sudah ada di AppBar)
                  // Tombol Back dan Buy Now Bersebelahan
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly, // atau .spaceBetween
                    children: [
                      // Button Back
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: ElevatedButton.icon(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(Icons.arrow_back),
                            label: const Text('Back'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(
                                context,
                              ).colorScheme.primary,
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              minimumSize: const Size(0, 50),
                            ),
                          ),
                        ),
                      ),

                      // Button Buy Now
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: ElevatedButton.icon(
                            onPressed: () {
                              // Implement buy now functionality
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Buy Now feature coming soon!'),
                                ),
                              );
                            },
                            icon: const Icon(Icons.shopping_cart),
                            label: const Text('Buy Now'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Theme.of(
                                context,
                              ).colorScheme.background,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              minimumSize: const Size(0, 50),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```
