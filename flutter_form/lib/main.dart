import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MarketplaceRegistrationApp());
}

class MarketplaceRegistrationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Formulir yahaha ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RegistrationFormPage(),
    );
  }
}

class RegistrationFormPage extends StatefulWidget {
  @override
  _RegistrationFormPageState createState() => _RegistrationFormPageState();
}

class _RegistrationFormPageState extends State<RegistrationFormPage> {
  final _formKey = GlobalKey<FormState>();

  // Controller untuk input
  final _namaLengkapController = TextEditingController();
  final _emailController = TextEditingController();
  final _nomorTeleponController = TextEditingController();
  final _alamatController = TextEditingController();

  // Variabel untuk dropdown6
  String? _jenisKelamin;
  String? _kota;

  // List pilihan kota
  final List<String> _daftarKota = [
    'Jakarta',
    'Bandung',
    'Surabaya',
    'Yogyakarta',
    'Banyuwangi',
    'Semarang',
    'Lainnya'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Isi data diri dulu yuks!'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Nama Lengkap
              TextFormField(
                controller: _namaLengkapController,
                decoration: InputDecoration(
                  labelText: 'Nama Lengkap',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama lengkap harus diisi';
                  }
                  if (value.length < 3) {
                    return 'Nama minimal 3 karakter';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Email
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email harus diisi';
                  }
                  final emailRegex =
                      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                  if (!emailRegex.hasMatch(value)) {
                    return 'Format email tidak valid';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Nomor Telepon
              TextFormField(
                controller: _nomorTeleponController,
                decoration: InputDecoration(
                  labelText: 'Nomor Telepon',
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(13),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nomor telepon harus diisi';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Jenis Kelamin Dropdown
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Jenis Kelamin',
                  prefixIcon: Icon(Icons.people),
                  border: OutlineInputBorder(),
                ),
                value: _jenisKelamin,
                hint: Text('Pilih Jenis Kelamin'),
                items: ['Laki-laki', 'Perempuan']
                    .map((label) => DropdownMenuItem(
                          child: Text(label),
                          value: label,
                        ))
                    .toList(),
                validator: (value) {
                  if (value == null) {
                    return 'Jenis kelamin harus dipilih';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _jenisKelamin = value;
                  });
                },
              ),
              SizedBox(height: 16),

              // Kota Dropdown
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Kota',
                  prefixIcon: Icon(Icons.location_city),
                  border: OutlineInputBorder(),
                ),
                value: _kota,
                hint: Text('Pilih Kota'),
                items: _daftarKota
                    .map((label) => DropdownMenuItem(
                          child: Text(label),
                          value: label,
                        ))
                    .toList(),
                validator: (value) {
                  if (value == null) {
                    return 'Kota harus dipilih';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _kota = value;
                  });
                },
              ),
              SizedBox(height: 16),

              // Alamat
              TextFormField(
                controller: _alamatController,
                decoration: InputDecoration(
                  labelText: 'Alamat Lengkap',
                  prefixIcon: Icon(Icons.home),
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Alamat harus diisi';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),

              // Tombol Daftar
              ElevatedButton(
                onPressed: _submitForm,
                child: Text(
                  'Daftar Sekarang',
                  style: TextStyle(fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Tampilkan dialog konfirmasi
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Konfirmasi Pendaftaran'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Nama: ${_namaLengkapController.text}'),
              Text('Email: ${_emailController.text}'),
              Text('Telepon: ${_nomorTeleponController.text}'),
              Text('Jenis Kelamin: $_jenisKelamin'),
              Text('Kota: $_kota'),
              Text('Alamat: ${_alamatController.text}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
                _prosesRegistrasi(); // Proses registrasi
              },
              child: Text('Ya, Daftar'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Batalkan'),
            ),
          ],
        ),
      );
    }
  }

  void _prosesRegistrasi() {
    // Simulasi proses registrasi
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Registrasi Berhasil!'),
        backgroundColor: Colors.green,
      ),
    );

    // Reset form
    _formKey.currentState!.reset();
    _namaLengkapController.clear();
    _emailController.clear();
    _nomorTeleponController.clear();
    _alamatController.clear();
    setState(() {
      _jenisKelamin = null;
      _kota = null;
    });
  }

  @override
  void dispose() {
    // Membersihkan controller
    _namaLengkapController.dispose();
    _emailController.dispose();
    _nomorTeleponController.dispose();
    _alamatController.dispose();
    super.dispose();
  }
}
