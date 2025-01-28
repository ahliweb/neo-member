import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:jaspr/jaspr.dart';
import 'package:universal_html/html.dart' as html;
import 'package:membership_app_client/membership_app_client.dart' as mem;

class MemberVerificationComponent extends StatefulComponent {
  final mem.Member member;
  final Function(mem.Member) onVerify;
  final VoidCallback onCancel;
  final Function(String, bool) showNotification; // Tambahkan ini

  const MemberVerificationComponent({
    super.key,
    required this.member,
    required this.onVerify,
    required this.onCancel,
    required this.showNotification,
  });

  @override
  State<MemberVerificationComponent> createState() => _MemberVerificationComponentState();
}

class _MemberVerificationComponentState extends State<MemberVerificationComponent> {
  late mem.Member editedMember;
  // Data wilayah untuk alamat KTP
  List<Map<String, String>> provinces = [];
  List<Map<String, String>> regencies = [];
  List<Map<String, String>> districts = [];
  List<Map<String, String>> villages = [];

  String? selectedProvinceId;
  String? selectedRegencyId;
  String? selectedDistrictId;
  String? selectedVillageId;

  // Data wilayah untuk alamat Domisili
  List<Map<String, String>> domisiliRegencies = [];
  List<Map<String, String>> domisiliDistricts = [];
  List<Map<String, String>> domisiliVillages = [];

  String? selectedDomisiliProvinceId;
  String? selectedDomisiliRegencyId;
  String? selectedDomisiliDistrictId;
  String? selectedDomisiliVillageId;

  String? filePreviewUrl;
  html.File? newKtpFile;
  bool isUploading = false;



  @override
  void initState() {
    super.initState();
    editedMember = component.member;

    // 1. Fetch data provinsi (untuk KTP dan domisili)
    fetchProvinces().then((_) {
      // Inisialisasi data KTP
      initKTPAddress();
      // Inisialisasi data Domisili
      initDomisiliAddress();
    });
  }

  void initKTPAddress() {
    // Cari provinsi berdasarkan nama (normalisasi lowerCase)
    selectedProvinceId = provinces
        .firstWhere(
          (p) => p['name']!.toLowerCase() == editedMember.provinsi.toLowerCase(),
          orElse: () => {},
        )['id'];

    print('Selected Province ID (KTP): $selectedProvinceId');

    if (selectedProvinceId != null) {
      fetchRegencies(selectedProvinceId!).then((_) {
        selectedRegencyId = regencies
            .firstWhere(
              (r) => r['name']!.toLowerCase() == editedMember.kabupaten.toLowerCase(),
              orElse: () => {},
            )['id'];
        print('Selected Regency ID (KTP): $selectedRegencyId');

        if (selectedRegencyId != null) {
          fetchDistricts(selectedRegencyId!).then((_) {
            selectedDistrictId = districts
                .firstWhere(
                  (d) => d['name']!.toLowerCase() == editedMember.kecamatan.toLowerCase(),
                  orElse: () => {},
                )['id'];
            print('Selected District ID (KTP): $selectedDistrictId');

            if (selectedDistrictId != null) {
              fetchVillages(selectedDistrictId!).then((_) {
                selectedVillageId = villages
                    .firstWhere(
                      (v) => v['name']!.toLowerCase() == editedMember.kelurahan.toLowerCase(),
                      orElse: () => {},
                    )['id'];
                print('Selected Village ID (KTP): $selectedVillageId');
                setState(() {});
              });
            }
          });
        }
      });
    }
  }

  void initDomisiliAddress() {
    // Jika user menaruh nama provinsi domisili di editedMember.provinsiDomisili
    // kita cari ID-nya juga di 'provinces' (bisa saja pakai data provinces yang sama).
    selectedDomisiliProvinceId = provinces
        .firstWhere(
          (p) => p['name']!.toLowerCase() == (editedMember.provinsiDomisili ?? '').toLowerCase(),
          orElse: () => {},
        )['id'];

    print('Selected Province ID (DOMISILI): $selectedDomisiliProvinceId');

    if (selectedDomisiliProvinceId != null) {
      fetchRegencies(selectedDomisiliProvinceId!, isDomisili: true).then((_) {
        selectedDomisiliRegencyId = domisiliRegencies
            .firstWhere(
              (r) => r['name']!.toLowerCase() == (editedMember.kabupatenDomisili ?? '').toLowerCase(),
              orElse: () => {},
            )['id'];
        print('Selected Regency ID (DOMISILI): $selectedDomisiliRegencyId');

        if (selectedDomisiliRegencyId != null) {
          fetchDistricts(selectedDomisiliRegencyId!, isDomisili: true).then((_) {
            selectedDomisiliDistrictId = domisiliDistricts
                .firstWhere(
                  (d) => d['name']!.toLowerCase() == (editedMember.kecamatanDomisili ?? '').toLowerCase(),
                  orElse: () => {},
                )['id'];
            print('Selected District ID (DOMISILI): $selectedDomisiliDistrictId');

            if (selectedDomisiliDistrictId != null) {
              fetchVillages(selectedDomisiliDistrictId!, isDomisili: true).then((_) {
                selectedDomisiliVillageId = domisiliVillages
                    .firstWhere(
                      (v) => v['name']!.toLowerCase() == (editedMember.kelurahanDomisili ?? '').toLowerCase(),
                      orElse: () => {},
                    )['id'];
                print('Selected Village ID (DOMISILI): $selectedDomisiliVillageId');
                setState(() {});
              });
            }
          });
        }
      });
    }
  }




  Future<void> fetchProvinces() async {
    try {
      final response = await http.get(Uri.parse('https://api.corsproxy.io/?url=https://emsifa.github.io/api-wilayah-indonesia/api/provinces.json'));
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


  Future<void> fetchDistricts(String regencyId,  {bool isDomisili = false}) async {
    try {
      final response = await http.get(Uri.parse('https://api.corsproxy.io/?url=https://emsifa.github.io/api-wilayah-indonesia/api/districts/$regencyId.json'));
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
      final response = await http.get(Uri.parse('https://api.corsproxy.io/?url=https://emsifa.github.io/api-wilayah-indonesia/api/villages/$districtId.json'));
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

  Future<String?> uploadFileToObjectStorage(html.File file, String fileName) async {
    const endpoint = 'https://s3.nevaobjects.id';
    const bucketName = 'app-membership-01';
    // const accessKey = 'GWAWLX8LXVP86D3QIEND';
    // const secretKey = 'LW6doJ30Cemim5upi8qj6TpJ5piAtuJ851b8l8xb';

    try {
      final reader = html.FileReader();
      reader.readAsArrayBuffer(file);
      await reader.onLoadEnd.first;

      final fileBytes = reader.result as Uint8List;

      // Header S3 untuk otorisasi
      final headers = {
        'Content-Type': file.type,
        'x-amz-acl': 'public-read', // Akses publik untuk file
      };

      // URL unggah
      final uploadUrl = Uri.parse('$endpoint/$bucketName/$fileName');

      final response = await http.put(
        uploadUrl,
        body: fileBytes,
        headers: headers,
      );

      if (response.statusCode == 200) {
        return '$endpoint/$bucketName/$fileName'; // URL file yang diunggah
      } else {
        print('Error uploading file: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  void promptUploadKTP() async {
    // Create a hidden file input element
    final input = html.FileUploadInputElement()
      ..accept = 'image/*' // Hanya menerima gambar
      ..click();

    // Tunggu hingga pengguna memilih file
    input.onChange.listen((event) async {
      if (input.files != null && input.files!.isNotEmpty) {
        final file = input.files!.first;

        // Validasi ukuran file (opsional)
        if (file.size > 5 * 1024 * 1024) {
          component.showNotification('Ukuran file terlalu besar (maks 5MB)', false);
          return;
        }

        // Generate preview gambar
        final reader = html.FileReader();
        reader.readAsDataUrl(file); // Baca file sebagai data URL
        await reader.onLoad.first; // Tunggu hingga pembacaan selesai

        setState(() {
          filePreviewUrl = reader.result as String; // URL sementara untuk preview
          newKtpFile = file; // Simpan file untuk upload nanti
        });
      }
    });
  }

  void onVerifikasiClicked() async {
    // Aktifkan loading overlay
    setState(() {
      isUploading = true;
    });

    try {
      if (editedMember.status == 'Valid') {
        // Jika status valid, ubah menjadi "Belum Valid"
        editedMember = editedMember.copyWith(status: 'Belum Valid');
        await saveUpdatedMember(); // Simpan perubahan ke backend
        component.showNotification('Status berhasil diubah menjadi "Belum Valid"', true);
        return; // Selesai tanpa memproses KTP
      }

      // Jika status belum valid, proses upload file (jika ada)
      if (newKtpFile != null) {
        // Validasi file sebelum upload
        final fileName = 'ktp-${DateTime.now().millisecondsSinceEpoch}.${newKtpFile!.name.split('.').last}';
        final uploadedUrl = await uploadFileToObjectStorage(newKtpFile!, fileName);

        if (uploadedUrl != null) {
          setState(() {
            editedMember = editedMember.copyWith(ktp: uploadedUrl, status: 'Valid');
            filePreviewUrl = null; // Reset preview setelah upload
            newKtpFile = null; // Reset file setelah upload
          });

          await saveUpdatedMember();
          component.showNotification('KTP berhasil diperbarui dan diverifikasi', true);
        } else {
          component.showNotification('Gagal mengunggah KTP', false);
        }
      } else {
        // Jika tidak ada file baru, hanya perbarui status
        editedMember = editedMember.copyWith(status: 'Valid');
        await saveUpdatedMember();
        component.showNotification('Status diverifikasi tanpa perubahan KTP', true);
      }
    } catch (e) {
      component.showNotification('Terjadi kesalahan: $e', false);
    } finally {
      // Nonaktifkan loading overlay setelah proses selesai
      setState(() {
        isUploading = false;
      });
    }
  }






  Future<void> saveUpdatedMember() async {
    try {
      print('Updating member in backend: ${editedMember.toJson()}');
      final result = await mem.Client('http://localhost:8080/').member.updateMember(editedMember);
      if (!result) {
        print('Failed to save member');
        component.showNotification('Gagal menyimpan perubahan KTP', false);
      }
      else {
      print('Member updated successfully');}
    } catch (e) {
      print('Error updating member: $e');
      component.showNotification('Terjadi kesalahan saat menyimpan perubahan KTP', false);
    }
  }

  

  




  void updateField(String field, String value) {
    if (editedMember.status == 'Valid') return; // Tidak bisa update jika status valid
    setState(() {
      switch (field) {
        case 'namaPelanggan':
          editedMember = editedMember.copyWith(namaPelanggan: value);
          break;
        case 'noWhatsapp':
          editedMember = editedMember.copyWith(noWhatsapp: value);
          break;
        case 'alamatKtp':
          editedMember = editedMember.copyWith(alamatKtp: value);
          break;
        case 'kelurahan':
          editedMember = editedMember.copyWith(kelurahan: value);
          break;
        case 'kecamatan':
          editedMember = editedMember.copyWith(kecamatan: value);
          break;
        case 'kabupaten':
          editedMember = editedMember.copyWith(kabupaten: value);
          break;
        case 'provinsi':
          editedMember = editedMember.copyWith(provinsi: value);
          break;

          // Domisili
        case 'alamatDomisili':
          editedMember = editedMember.copyWith(alamatDomisili: value);
          break;
        case 'kelurahanDomisili':
          editedMember = editedMember.copyWith(kelurahanDomisili: value);
          break;
        case 'kecamatanDomisili':
          editedMember = editedMember.copyWith(kecamatanDomisili: value);
          break;
        case 'kabupatenDomisili':
          editedMember = editedMember.copyWith(kabupatenDomisili: value);
          break;
        case 'provinsiDomisili':
          editedMember = editedMember.copyWith(provinsiDomisili: value);
          break;
      }
    });
  }

  


  @override
  Iterable<Component> build(BuildContext context) sync* {
    final isValid = editedMember.status == 'Valid'; // Periksa apakah status valid
    yield div(classes: 'verification-container', [
      div(classes: 'verification-ktp', [
        if (filePreviewUrl != null)
          img(
            src: filePreviewUrl!,
            alt: 'Preview KTP',
            classes: 'ktp-image',
            attributes: {
              'style': 'cursor: pointer;',
              'title': 'Klik untuk mengganti KTP',
            },
            events: {
              'click': (event) => promptUploadKTP(), // Memungkinkan mengganti file
            },
          )
        else if (editedMember.ktp != null)
          img(
            src: editedMember.ktp!,
            alt: 'KTP Image',
            classes: 'ktp-image',
            attributes: {
              'style': 'cursor: pointer;',
              'title': 'Klik untuk mengganti KTP',
            },
            events: {
              'click': (event) => promptUploadKTP(), // Memungkinkan mengganti file
            },
          )
        else
          div(
            classes: 'ktp-not-found',
            attributes: {
              'style': 'cursor: pointer;',
              'title': 'Klik untuk mengunggah KTP',
            },
            events: {
              'click': (event) => promptUploadKTP(), // Jika file belum ada
            },
            [text('KTP Tidak Ditemukan')],
          ),
      ]),



      div(classes: 'verification-form', [
        // Input untuk Nama Pelanggan
        div(classes: 'form-field', [
          label([text('Nama Pelanggan')]),
          input(
            [],
            value: editedMember.namaPelanggan,
            disabled: isValid,
            onInput: (value) {
              setState(() {
                editedMember = editedMember.copyWith(namaPelanggan: value as String);
              });
            },
          ),
        ]),
        // Input untuk No. WhatsApp
        div(classes: 'form-field', [
          label([text('No. WhatsApp')]),
          input(
            [],
            value: editedMember.noWhatsapp,
            disabled: isValid,
            onInput: (value) {
              setState(() {
                editedMember = editedMember.copyWith(noWhatsapp: value as String);
              });
            },
          ),
        ]),
        // Input untuk NIK (non-editable)
        div(classes: 'form-field', [
          label([text('NIK')]),
          input(
            [],
            value: editedMember.nik.toString(),
            disabled: true, // NIK tidak bisa diedit
          ),
        ]),
        // Input untuk Alamat KTP
        div(classes: 'form-field', [
          label([text('Alamat KTP')]),
          input(
            [],
            value: editedMember.alamatKtp,
            disabled: isValid,
            onInput: (value) {
              setState(() {
                editedMember = editedMember.copyWith(alamatKtp: value as String);
              });
            },
          ),
        ]),
        div(classes: 'form-field', [
          label([text('Provinsi')]),
          select(
            [
              for (final province in provinces)
                option(
                  value: province['id'],
                  selected: selectedProvinceId == province['id'] ||
                      (selectedProvinceId == null && province['name'] == editedMember.provinsi),
                  [text(province['name']!)],
                ),
            ],
            disabled: isValid,
            onChange: (value) {
              setState(() {
                if (value.isNotEmpty) {
                  // Ambil elemen pertama dari list
                  final selectedValue = value.first;

                  print('Selected Value: $selectedValue'); // Debug
                  selectedProvinceId = selectedValue;

                  // Perbarui field berdasarkan nilai yang dipilih
                  updateField(
                    'provinsi',
                    provinces.firstWhere((p) => p['id'] == selectedProvinceId)['name']!,
                  );

                  // Ambil kabupaten berdasarkan provinsi yang dipilih
                  fetchRegencies(selectedProvinceId!);
                } else {
                  print('Invalid value: $value');
                }
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
                  selected: selectedRegencyId == regency['id'] ||
                      (selectedRegencyId == null && regency['name'] == editedMember.kabupaten),
                  [text(regency['name']!)],
                ),
            ],
            disabled: isValid || selectedProvinceId == null,
            onChange: (value) {
              setState(() {
                if (value.isNotEmpty) {
                  // Ambil elemen pertama dari list
                  final selectedValue = value.first;

                  print('Selected Value: $selectedValue'); // Debug
                  selectedRegencyId = selectedValue;

                  // Perbarui field berdasarkan nilai yang dipilih
                  updateField(
                    'kabupaten',
                    regencies.firstWhere((p) => p['id'] == selectedRegencyId)['name']!,
                  );

                  // Ambil kecamatan berdasarkan kabupaten yang dipilih
                  fetchDistricts(selectedRegencyId!);
                } else {
                  print('Invalid value: $value');
                }
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
                  selected: selectedDistrictId == district['id'] ||
                      (selectedDistrictId == null && district['name'] == editedMember.kecamatan),
                  [text(district['name']!)],
                ),
            ],
            disabled: isValid || selectedRegencyId == null,
            onChange: (value) {
              setState(() {
                if (value.isNotEmpty) {
                  // Ambil elemen pertama dari list
                  final selectedValue = value.first;

                  print('Selected Value: $selectedValue'); // Debug
                  selectedDistrictId = selectedValue;

                  // Perbarui field berdasarkan nilai yang dipilih
                  updateField(
                    'kecamatan',
                    districts.firstWhere((p) => p['id'] == selectedDistrictId)['name']!,
                  );

                  // Ambil kelurahan berdasarkan kecamatan yang dipilih
                  fetchVillages(selectedDistrictId!);
                } else {
                  print('Invalid value: $value');
                }
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
                  selected: editedMember.kelurahan == village['name'] ||
                      (selectedVillageId == null && village['name'] == editedMember.kelurahan),
                  [text(village['name']!)],
                ),
            ],
            disabled: isValid || selectedDistrictId == null,
            onChange: (value) {
              setState(() {
                if (value.isNotEmpty) {
                  // Ambil elemen pertama dari list
                  final selectedValue = value.first;

                  print('Selected Value: $selectedValue'); // Debug
                  selectedVillageId = selectedValue;

                  // Perbarui field berdasarkan nilai yang dipilih
                  updateField(
                    'kelurahan',
                    villages.firstWhere((p) => p['id'] == selectedVillageId)['name']!,
                  );
                } else {
                  print('Invalid value: $value');
                }
              });
            },
          ),
        ]),
        // Form Alamat Domisili
        div(classes: 'form-field', [
          label([text('Alamat Domisili')]),
          input(
            [],
            value: editedMember.alamatDomisili ?? '',
            disabled: isValid,
            onInput: (value) {
              setState(() {
                editedMember = editedMember.copyWith(alamatDomisili: value as String);
              });
            },
          ),
        ]),
        

        // Dropdown Provinsi Domisili
        div(classes: 'form-field', [
          label([text('Provinsi Domisili')]),
          select(
            [
              for (final province in provinces)
                option(
                  value: province['id'],
                  // jika selectedDomisiliProvinceId cocok, atau jika belum null tapi nama cocok
                  selected: selectedDomisiliProvinceId == province['id'] ||
                      (selectedDomisiliProvinceId == null &&
                          province['name'] == editedMember.provinsiDomisili),
                  [text(province['name']!)]
                ),
            ],
            disabled: isValid, // Non-editable kalau status member valid
            onChange: (value) {
              setState(() {
                if (value.isNotEmpty) {
                  final selectedValue = value.first; // Karena value adalah List<String>
                  selectedDomisiliProvinceId = selectedValue;

                  // Update kolom provinsi domisili di editedMember
                  updateField(
                    'provinsiDomisili',
                    provinces.firstWhere((p) => p['id'] == selectedDomisiliProvinceId)['name']!,
                  );

                  // Fetch data kabupaten/kota untuk domisili
                  fetchRegencies(selectedDomisiliProvinceId!, isDomisili: true);
                }
              });
            },
          ),
        ]),

        // Dropdown Kabupaten Domisili
        div(classes: 'form-field', [
          label([text('Kabupaten/Kota Domisili')]),
          select(
            [
              for (final regency in domisiliRegencies)
                option(
                  value: regency['id'],
                  selected: selectedDomisiliRegencyId == regency['id'] ||
                      (selectedDomisiliRegencyId == null &&
                          regency['name'] == editedMember.kabupatenDomisili),
                  [text(regency['name']!)]
                ),
            ],
            disabled: isValid || selectedDomisiliProvinceId == null,
            onChange: (value) {
              setState(() {
                if (value.isNotEmpty) {
                  final selectedValue = value.first;
                  selectedDomisiliRegencyId = selectedValue;

                  updateField(
                    'kabupatenDomisili',
                    domisiliRegencies.firstWhere((p) => p['id'] == selectedDomisiliRegencyId)['name']!,
                  );

                  // Fetch data kecamatan untuk domisili
                  fetchDistricts(selectedDomisiliRegencyId!, isDomisili: true);
                }
              });
            },
          ),
        ]),

        // Dropdown Kecamatan Domisili
        div(classes: 'form-field', [
          label([text('Kecamatan Domisili')]),
          select(
            [
              for (final district in domisiliDistricts)
                option(
                  value: district['id'],
                  selected: selectedDomisiliDistrictId == district['id'] ||
                      (selectedDomisiliDistrictId == null &&
                          district['name'] == editedMember.kecamatanDomisili),
                  [text(district['name']!)]
                ),
            ],
            disabled: isValid || selectedDomisiliRegencyId == null,
            onChange: (value) {
              setState(() {
                if (value.isNotEmpty) {
                  final selectedValue = value.first;
                  selectedDomisiliDistrictId = selectedValue;

                  updateField(
                    'kecamatanDomisili',
                    domisiliDistricts.firstWhere((p) => p['id'] == selectedDomisiliDistrictId)['name']!,
                  );

                  // Fetch data kelurahan untuk domisili
                  fetchVillages(selectedDomisiliDistrictId!, isDomisili: true);
                }
              });
            },
          ),
        ]),

        // Dropdown Kelurahan Domisili
        div(classes: 'form-field', [
          label([text('Kelurahan Domisili')]),
          select(
            [
              for (final village in domisiliVillages)
                option(
                  value: village['id'],
                  selected: selectedDomisiliVillageId == village['id'] ||
                      (selectedDomisiliVillageId == null &&
                          village['name'] == editedMember.kelurahanDomisili),
                  [text(village['name']!)]
                ),
            ],
            disabled: isValid || selectedDomisiliDistrictId == null,
            onChange: (value) {
              setState(() {
                if (value.isNotEmpty) {
                  final selectedValue = value.first;
                  selectedDomisiliVillageId = selectedValue;

                  updateField(
                    'kelurahanDomisili',
                    domisiliVillages.firstWhere((p) => p['id'] == selectedDomisiliVillageId)['name']!,
                  );
                }
              });
            },
          ),
        ]),


        
        button(
          classes: 'verification-button verify',
          onClick: onVerifikasiClicked,
          [text(isValid ? 'BATALKAN VERIFIKASI' : 'VERIFIKASI')],
        ),
        button(
          classes: 'cancel-button',
          onClick: component.onCancel,
          [text('KEMBALI')],
        ),
      ]),
    ]);


    // Overlay jika isUploading true
    if (isUploading) {
      yield div(
        classes: 'loading-overlay',
        [
          div([],classes: 'loading-spinner'),
          div(classes: 'loading-text', [text('Mengunggah, mohon tunggu...')]),
        ],
      );
    }
  }
}