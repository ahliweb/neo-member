import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:jaspr/jaspr.dart';
import 'package:universal_html/html.dart' as html;
import 'package:membership_app_client/membership_app_client.dart' as mem;

class FormulirForm extends StatefulComponent {
  final List<mem.Sales> salesList; // Daftar sales untuk dropdown
   final void Function(mem.Member, int?) onSubmit;
  final VoidCallback onCancel;
  final void Function(String, bool) showNotification;

  const FormulirForm({
    required this.salesList,
    required this.onSubmit,
    required this.onCancel,
    required this.showNotification,
    super.key,
  });

  @override
  State<FormulirForm> createState() => _FormulirFormState();
}

class _FormulirFormState extends State<FormulirForm> {
  // // Data untuk new Member
  // mem.Member newMember = mem.Member(
  //   namaPelanggan: '',
  //   nik: 0,
  //   noWhatsapp: '',
  //   status: 'Belum Valid',
  //   alamatKtp: '',
  //   alamatDomisili: '',
  //   kelurahan: '',
  //   kecamatan: '',
  //   kabupaten: '',
  //   provinsi: '',
  //   kelurahanDomisili: '',
  //   kecamatanDomisili: '',
  //   kabupatenDomisili: '',
  //   provinsiDomisili: '',
  //   tanggalDibuat: DateTime.now()
  // );

  // KTP
  // String? filePreviewUrl;
  // html.File? newKtpFile;
  // bool isUploading = false;

  // Data wilayah KTP
  List<Map<String, String>> provinces = [];
  List<Map<String, String>> regencies = [];
  List<Map<String, String>> districts = [];
  List<Map<String, String>> villages = [];

  String? selectedProvinceId;
  String? selectedRegencyId;
  String? selectedDistrictId;
  String? selectedVillageId;

  // Data wilayah Domisili
  List<Map<String, String>> domisiliRegencies = [];
  List<Map<String, String>> domisiliDistricts = [];
  List<Map<String, String>> domisiliVillages = [];

  String? selectedDomisiliProvinceId;
  String? selectedDomisiliRegencyId;
  String? selectedDomisiliDistrictId;
  String? selectedDomisiliVillageId;

  late mem.Member newMember;
  int? selectedSalesId; // Menyimpan ID sales yang dipilih

  @override
  void initState() {
    super.initState();
    newMember = mem.Member(
      namaPelanggan: '',
      nik: 0,
      noWhatsapp: '',
      status: 'Belum Valid',
      alamatKtp: '',
      alamatDomisili: '',
      kelurahan: '',
      kecamatan: '',
      kabupaten: '',
      provinsi: '',
      kelurahanDomisili: '',
      kecamatanDomisili: '',
      kabupatenDomisili: '',
      provinsiDomisili: '',
      tanggalDibuat: DateTime.now()
    );

    // Memuat data provinsi
    fetchProvinces();
  }

  // ================== FETCHING WILAYAH ================
  Future<void> fetchProvinces() async {
    try {
      final response = await http.get(Uri.parse(
        'https://api.corsproxy.io/?url=https://emsifa.github.io/api-wilayah-indonesia/api/provinces.json',
      ));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        setState(() {
          provinces = data.map((item) {
            return {
              'id': item['id'].toString(),
              'name': item['name'].toString(),
            };
          }).toList();
        });
      } else {
        print('Failed to fetch provinces: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching provinces: $e');
    }
  }

  Future<void> fetchRegencies(String provinceId, {bool isDomisili = false}) async {
    try {
      final response = await http.get(Uri.parse(
        'https://api.corsproxy.io/?url=https://emsifa.github.io/api-wilayah-indonesia/api/regencies/$provinceId.json',
      ));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        setState(() {
          final mapped = data.map((item) {
            return {
              'id': item['id'].toString(),
              'name': item['name'].toString(),
            };
          }).toList();
          if (!isDomisili) {
            regencies = mapped;
            districts = [];
            villages = [];
            selectedRegencyId = null;
            selectedDistrictId = null;
          } else {
            domisiliRegencies = mapped;
            domisiliDistricts = [];
            domisiliVillages = [];
            selectedDomisiliRegencyId = null;
            selectedDomisiliDistrictId = null;
          }
        });
      } else {
        print('Failed to fetch regencies: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching regencies: $e');
    }
  }

  Future<void> fetchDistricts(String regencyId, {bool isDomisili = false}) async {
    try {
      final response = await http.get(Uri.parse(
        'https://api.corsproxy.io/?url=https://emsifa.github.io/api-wilayah-indonesia/api/districts/$regencyId.json',
      ));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        setState(() {
          final mapped = data.map((item) {
            return {
              'id': item['id'].toString(),
              'name': item['name'].toString(),
            };
          }).toList();
          if (!isDomisili) {
            districts = mapped;
            villages = [];
            selectedDistrictId = null;
          } else {
            domisiliDistricts = mapped;
            domisiliVillages = [];
            selectedDomisiliDistrictId = null;
          }
        });
      } else {
        print('Failed to fetch districts: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching districts: $e');
    }
  }

  Future<void> fetchVillages(String districtId, {bool isDomisili = false}) async {
    try {
      final response = await http.get(Uri.parse(
        'https://api.corsproxy.io/?url=https://emsifa.github.io/api-wilayah-indonesia/api/villages/$districtId.json',
      ));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        setState(() {
          final mapped = data.map((item) {
            return {
              'id': item['id'].toString(),
              'name': item['name'].toString(),
            };
          }).toList();
          if (!isDomisili) {
            villages = mapped;
          } else {
            domisiliVillages = mapped;
          }
        });
      } else {
        print('Failed to fetch villages: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching villages: $e');
    }
  }

  // ================== UPLOAD KTP ================
  // Future<String?> uploadFileToObjectStorage(html.File file, String fileName) async {
  //   const endpoint = 'https://s3.nevaobjects.id';
  //   const bucketName = 'app-membership-01';

  //   try {
  //     final reader = html.FileReader();
  //     reader.readAsArrayBuffer(file);
  //     await reader.onLoadEnd.first;

  //     final fileBytes = reader.result as Uint8List;
  //     final headers = {
  //       'Content-Type': file.type,
  //       'x-amz-acl': 'public-read',
  //     };

  //     final uploadUrl = Uri.parse('$endpoint/$bucketName/$fileName');
  //     final response = await http.put(uploadUrl, body: fileBytes, headers: headers);
  //     if (response.statusCode == 200) {
  //       return '$endpoint/$bucketName/$fileName';
  //     } else {
  //       print('Error uploading file: ${response.body}');
  //       return null;
  //     }
  //   } catch (e) {
  //     print('Error: $e');
  //     return null;
  //   }
  // }

  // void promptUploadKTP() async {
  //   final input = html.FileUploadInputElement()..accept = 'image/*'..click();
  //   input.onChange.listen((event) async {
  //     if (input.files != null && input.files!.isNotEmpty) {
  //       final file = input.files!.first;
  //       if (file.size > 5 * 1024 * 1024) {
  //         component.showNotification('Ukuran file terlalu besar (maks 5MB)', false);
  //         return;
  //       }
  //       final reader = html.FileReader();
  //       reader.readAsDataUrl(file);
  //       await reader.onLoad.first;
  //       setState(() {
  //         filePreviewUrl = reader.result as String;
  //         newKtpFile = file;
  //       });
  //     }
  //   });
  // }

  // ================== SUBMIT FORM ================
  void submitForm() async {
    // Validasi minimal
    if (newMember.namaPelanggan.isEmpty || newMember.nik == 0) {
      component.showNotification('Nama & NIK harus diisi', false);
      return;
    }

    // setState(() => isUploading = true);

    // Jika ada file KTP baru, upload dulu
    // if (newKtpFile != null) {
    //   final fileName = 'ktp-${DateTime.now().millisecondsSinceEpoch}.${newKtpFile!.name.split('.').last}';
    //   final uploadedUrl = await uploadFileToObjectStorage(newKtpFile!, fileName);
    //   if (uploadedUrl != null) {
    //     newMember = newMember.copyWith(ktp: uploadedUrl);
    //   } else {
    //     component.showNotification('Gagal mengunggah KTP', false);
    //     setState(() => isUploading = false);
    //     return;
    //   }
    // }

    if (selectedSalesId == null) {
      component.showNotification('Pilih Sales terlebih dahulu.', false);
      return;
    }
    print('Selected Sales ID: $selectedSalesId');

    // Lanjut panggil onSubmit
    component.onSubmit(newMember, selectedSalesId);
    // setState(() => isUploading = false);
  }

  // ================== BUILD ================
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'verification-container', [
      h3([text('Tambah Formulir')]),
      // div(classes: 'verification-ktp', [
      //   if (filePreviewUrl != null)
      //     img(
      //       src: filePreviewUrl!,
      //       alt: 'Preview KTP',
      //       classes: 'ktp-image',
      //       attributes: {
      //         'style': 'cursor: pointer;',
      //         'title': 'Klik untuk mengganti KTP',
      //       },
      //       events: {
      //         'click': (event) => promptUploadKTP(),
      //       },
      //     )
      //   else if (newMember.ktp != null && newMember.ktp!.isNotEmpty)
      //     img(
      //       src: newMember.ktp!,
      //       alt: 'KTP Image',
      //       classes: 'ktp-image',
      //       attributes: {
      //         'style': 'cursor: pointer;',
      //         'title': 'Klik untuk mengganti KTP',
      //       },
      //       events: {
      //         'click': (event) => promptUploadKTP(),
      //       },
      //     )
      //   else
      //     div(
      //       classes: 'ktp-not-found',
      //       attributes: {
      //         'style': 'cursor: pointer;',
      //         'title': 'Klik untuk mengunggah KTP',
      //       },
      //       events: {
      //         'click': (event) => promptUploadKTP(),
      //       },
      //       [text('KTP Tidak Ditemukan')],
      //     ),
      // ]),

      div(classes: 'verification-form', [
        div(classes: 'form-field', [
          label([text('Sales')]),
          select(
            [
              for (final sales in component.salesList)
                option(
                  value: sales.id.toString(),
                  selected: selectedSalesId == sales.id,
                  [text(sales.namaSales)],
                ),
            ],
            onChange: (val) => setState(() {
              selectedSalesId = int.tryParse(val.first);
            }),
          ),
        ]),
        // Nama Pelanggan
        div(classes: 'form-field', [
          label([text('Nama Pelanggan')]),
          input(
            [],
            value: newMember.namaPelanggan,
            onInput: (val) => setState(() {
              newMember = newMember.copyWith(namaPelanggan: val as String);
            }),
          ),
        ]),

        // NIK
        div(classes: 'form-field', [
          label([text('NIK')]),
          input(
            [],
            value: newMember.nik.toString(),
            onInput: (val) => setState(() {
              newMember = newMember.copyWith(nik: int.tryParse(val as String) ?? 0);
            }),
          ),
        ]),

        // No Whatsapp
        div(classes: 'form-field', [
          label([text('No. WhatsApp')]),
          input(
            [],
            value: newMember.noWhatsapp,
            onInput: (val) => setState(() {
              newMember = newMember.copyWith(noWhatsapp: val as String);
            }),
          ),
        ]),

        // Alamat KTP
        div(classes: 'form-field', [
          label([text('Alamat KTP')]),
          input(
            [],
            value: newMember.alamatKtp,
            onInput: (val) => setState(() {
              newMember = newMember.copyWith(alamatKtp: val as String);
            }),
          ),
        ]),

        
        // Dropdown Wilayah KTP
        div(classes: 'form-field', [
          label([text('Provinsi')]),
          select(
            [
              for (final province in provinces)
                option(
                  value: province['id'],
                  selected: selectedProvinceId == province['id'],
                  [text(province['name']!)],
                ),
            ],
            onChange: (value) {
              setState(() {
                selectedProvinceId = value.first;
                fetchRegencies(selectedProvinceId!);
                newMember = newMember.copyWith(provinsi: provinces.firstWhere((p) => p['id'] == selectedProvinceId)['name']!);
              });
            },
          ),
        ]),

        div(classes: 'form-field', [
          label([text('Kabupaten/Kota')]),
          select(
            [
              for (final regency in regencies)
                option(
                  value: regency['id'],
                  selected: selectedRegencyId == regency['id'],
                  [text(regency['name']!)],
                ),
            ],
            disabled: selectedProvinceId == null,
            onChange: (value) {
              setState(() {
                selectedRegencyId = value.first;
                fetchDistricts(selectedRegencyId!);
                newMember = newMember.copyWith(kabupaten: regencies.firstWhere((r) => r['id'] == selectedRegencyId)['name']!);
              });
            },
          ),
        ]),

        div(classes: 'form-field', [
          label([text('Kecamatan')]),
          select(
            [
              for (final district in districts)
                option(
                  value: district['id'],
                  selected: selectedDistrictId == district['id'],
                  [text(district['name']!)],
                ),
            ],
            disabled: selectedRegencyId == null,
            onChange: (value) {
              setState(() {
                selectedDistrictId = value.first;
                fetchVillages(selectedDistrictId!);
                newMember = newMember.copyWith(kecamatan: districts.firstWhere((d) => d['id'] == selectedDistrictId)['name']!);
              });
            },
          ),
        ]),

        div(classes: 'form-field', [
          label([text('Kelurahan')]),
          select(
            [
              for (final village in villages)
                option(
                  value: village['id'],
                  selected: selectedVillageId == village['id'],
                  [text(village['name']!)],
                ),
            ],
            disabled: selectedDistrictId == null,
            onChange: (value) {
              setState(() {
                selectedVillageId = value.first;
                newMember = newMember.copyWith(kelurahan: villages.firstWhere((v) => v['id'] == selectedVillageId)['name']!);
              });
            },
          ),
        ]),

        // Alamat Domisili
        div(classes: 'form-field', [
          label([text('Alamat Domisili')]),
          input(
            [],
            value: newMember.alamatDomisili ?? '',
            onInput: (val) => setState(() {
              newMember = newMember.copyWith(alamatDomisili: val as String);
            }),
          ),
        ]),

        // Dropdown Wilayah Domisili
        div(classes: 'form-field', [
          label([text('Provinsi Domisili')]),
          select(
            [
              for (final province in provinces)
                option(
                  value: province['id'],
                  selected: selectedDomisiliProvinceId == province['id'],
                  [text(province['name']!)],
                ),
            ],
            onChange: (value) {
              setState(() {
                selectedDomisiliProvinceId = value.first;
                fetchRegencies(selectedDomisiliProvinceId!, isDomisili: true);
                newMember = newMember.copyWith(provinsiDomisili: provinces.firstWhere((p) => p['id'] == selectedDomisiliProvinceId)['name']!);
              });
            },
          ),
        ]),

        div(classes: 'form-field', [
          label([text('Kabupaten/Kota Domisili')]),
          select(
            [
              for (final regency in domisiliRegencies)
                option(
                  value: regency['id'],
                  selected: selectedDomisiliRegencyId == regency['id'],
                  [text(regency['name']!)],
                ),
            ],
            disabled: selectedDomisiliProvinceId == null,
            onChange: (value) {
              setState(() {
                selectedDomisiliRegencyId = value.first;
                fetchDistricts(selectedDomisiliRegencyId!, isDomisili: true);
                newMember = newMember.copyWith(kabupatenDomisili: domisiliRegencies.firstWhere((r) => r['id'] == selectedDomisiliRegencyId)['name']!);
              });
            },
          ),
        ]),

        div(classes: 'form-field', [
          label([text('Kecamatan Domisili')]),
          select(
            [
              for (final district in domisiliDistricts)
                option(
                  value: district['id'],
                  selected: selectedDomisiliDistrictId == district['id'],
                  [text(district['name']!)],
                ),
            ],
            disabled: selectedDomisiliRegencyId == null,
            onChange: (value) {
              setState(() {
                selectedDomisiliDistrictId = value.first;
                fetchVillages(selectedDomisiliDistrictId!, isDomisili: true);
                newMember = newMember.copyWith(kecamatanDomisili: domisiliDistricts.firstWhere((d) => d['id'] == selectedDomisiliDistrictId)['name']!);
              });
            },
          ),
        ]),

        div(classes: 'form-field', [
          label([text('Kelurahan Domisili')]),
          select(
            [
              for (final village in domisiliVillages)
                option(
                  value: village['id'],
                  selected: selectedDomisiliVillageId == village['id'],
                  [text(village['name']!)],
                ),
            ],
            disabled: selectedDomisiliDistrictId == null,
            onChange: (value) {
              setState(() {
                selectedDomisiliVillageId = value.first;
                newMember = newMember.copyWith(kelurahanDomisili: domisiliVillages.firstWhere((v) => v['id'] == selectedDomisiliVillageId)['name']!);
              });
            },
          ),
        ]),

        // Tombol
        button(
          classes: 'verification-button verify',
          onClick: submitForm,
          [text('SIMPAN')],
        ),
        button(
          classes: 'cancel-button',
          onClick: component.onCancel,
          [text('BATAL')],
        ),
      ]),
    ]);

    // if (isUploading) {
    //   yield div(classes: 'loading-overlay', [
    //     div([],classes: 'loading-spinner'),
    //     div(classes: 'loading-text', [text('Mengunggah, mohon tunggu...')]),
    //   ]);
    // }
  }
}
