import 'package:flutter/material.dart';
import 'package:garuda_store/widgets/left_drawer.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:garuda_store/screens/menu.dart';

class ProductEntryFormPage extends StatefulWidget {
  const ProductEntryFormPage({super.key});

  @override
  State<ProductEntryFormPage> createState() => _ProductEntryFormPageState();
}

class _ProductEntryFormPageState extends State<ProductEntryFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _price = 0;
  String _description = "";
  String _thumbnail = "";
  String _category = "";
  bool _isFeatured = false;

  // Daftar kategori untuk dropdown
  final List<String> _categories = [
    'Clothes',
    'Jersey',
    'Accessory',
    'Shoes',
    'Merchandise',
    'Others',
  ];

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Tambah Product'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Field: Nama Product
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Nama Product",
                    labelText: "Nama Product",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _name = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Nama tidak boleh kosong!";
                    }
                    if (value.length < 3) {
                      return "Nama harus minimal 3 karakter!";
                    }
                    if (value.length > 100) {
                      return "Nama tidak boleh lebih dari 100 karakter!";
                    }
                    return null;
                  },
                ),
              ),

              // Field: Harga
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Harga",
                    labelText: "Harga",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    prefixText: "Rp ",
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (String? value) {
                    setState(() {
                      _price = int.tryParse(value!) ?? 0;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Harga tidak boleh kosong!";
                    }
                    if (int.tryParse(value) == null) {
                      return "Harga harus berupa angka!";
                    }
                    if (int.parse(value) <= 0) {
                      return "Harga harus lebih dari 0!";
                    }
                    if (int.parse(value) > 1000000000) {
                      return "Harga terlalu besar!";
                    }
                    return null;
                  },
                ),
              ),

              // Field: Deskripsi
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Deskripsi",
                    labelText: "Deskripsi",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    alignLabelWithHint: true,
                  ),
                  maxLines: 3,
                  onChanged: (String? value) {
                    setState(() {
                      _description = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Deskripsi tidak boleh kosong!";
                    }
                    if (value.length < 10) {
                      return "Deskripsi harus minimal 10 karakter!";
                    }
                    if (value.length > 500) {
                      return "Deskripsi tidak boleh lebih dari 500 karakter!";
                    }
                    return null;
                  },
                ),
              ),


              // Field: Thumbnail URL
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "https://example.com/image.jpg",
                    labelText: "URL Thumbnail",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    helperText: "Masukkan URL gambar produk",
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _thumbnail = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "URL Thumbnail tidak boleh kosong!";
                    }
                    // Validasi format URL yang lebih fleksibel
                    if (!value.startsWith('http://') && !value.startsWith('https://')) {
                      return "URL harus dimulai dengan http:// atau https://";
                    }
                    // Validasi apakah ada domain
                    final uri = Uri.tryParse(value);
                    if (uri == null || uri.host.isEmpty) {
                      return "Format URL tidak valid!";
                    }
                    // Cek apakah URL mengarah ke gambar (lebih fleksibel)
                    final lowerValue = value.toLowerCase();
                    if (!lowerValue.contains('.jpg') &&
                        !lowerValue.contains('.jpeg') &&
                        !lowerValue.contains('.png') &&
                        !lowerValue.contains('.gif') &&
                        !lowerValue.contains('.webp') &&
                        !lowerValue.contains('/image/') &&
                        !lowerValue.contains('/img/')) {
                      return "URL harus mengarah ke gambar";
                    }
                    return null;
                  },
                ),
              ),
              // Field: Category (Dropdown)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Kategori",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  initialValue: _category.isEmpty ? null : _category,
                  hint: const Text("Pilih Kategori"),
                  items: _categories.map((String category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _category = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Kategori tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),

              // Field: Is Featured (Checkbox)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 2,
                  child: CheckboxListTile(
                    title: const Text("Produk Unggulan"),
                    subtitle: const Text(
                      "Centang jika produk ini merupakan produk unggulan",
                      style: TextStyle(fontSize: 12),
                    ),
                    value: _isFeatured,
                    onChanged: (bool? value) {
                      setState(() {
                        _isFeatured = value!;
                      });
                    },
                    activeColor: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),

              // Tombol Save
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                          Theme.of(context).colorScheme.primary),
                      padding: WidgetStateProperty.all(
                        const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      ),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // TODO: Replace the URL with your app's URL
                        // To connect Android emulator with Django on localhost, use URL http://10.0.2.2/
                        // If you using chrome,  use URL http://localhost:8000
                        final response = await request.postJson(
                          "http://localhost:8000/create-flutter/",
                          jsonEncode({
                            "name": _name,
                            "price": _price,
                            "description": _description,
                            "thumbnail": _thumbnail,
                            "category": _category.toLowerCase(),  // convert -> sesuai model
                            "is_featured": _isFeatured,
                            "size": "m",   // opsional, bisa kamu buat field nanti
                            "stock": 0,
                          }),
                        );

                        if (context.mounted) {
                          if (response["status"] == "success") {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Product berhasil disimpan!")),
                            );

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => MyHomePage()),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Gagal menyimpan product!")),
                            );
                          }
                        }
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}