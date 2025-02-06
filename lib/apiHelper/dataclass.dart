// ignore: camel_case_types
class cData {
  String idArtikel;
  String kategori;
  String judulArtikel;
  String konten;
  String artikelImg;
  String travel;
  String createdAt;

  // Tambahkan URL dasar gambar
  static const String baseUrl =
      'https://rosanatravel.com/admin/assets/images/artikel/';

  cData({
    required this.idArtikel,
    required this.kategori,
    required this.judulArtikel,
    required this.konten,
    required this.artikelImg,
    required this.travel,
    required this.createdAt,
  });

  factory cData.fromJson(Map<String, dynamic> json) {
    return cData(
      idArtikel: json['id_artikel'],
      kategori: json['kategori'],
      judulArtikel: json['judul_artikel'],
      konten: json['konten'],
      artikelImg: baseUrl + json['artikel_img'], // Gabungkan dengan URL dasar
      travel: json['travel'],
      createdAt: json['created_at'],
    );
  }
}

class PaketData {
  final String idPaket;
  final String fkIdKeberangkatan;
  final String kategori;
  final String travel;
  final String namaProgram;
  final String paket;
  final String hotelMekkah;
  final String hotelMadinah;
  final String bintangMekkah;
  final String bintangMadinah;
  final String lamaHari;
  final String matauang;
  final String uangMuka;
  final String matauangall;
  final String hargaPaket;
  final String sudahTermasuk;
  final String belumTermasuk;
  final String paketImg;
  final String nomorGuide;
  final String tampilan;
  final String publish;
  final String createdBy;
  final String userId;
  final String userName;
  final String userEmail;
  final String userPassword;
  final String userLevel;
  final String createdAt;
  final String pass;
  final String isJamaah;
  final String fkIdJamaah;
  final String idKeberangkatan;
  final String tanggalKeberangkatan;
  final String isAktif;
  final String tanggalManasik;

  static const String baseUrl = 'https://rosanatravel.com/admin/assets/images/';

  PaketData({
    required this.idPaket,
    required this.fkIdKeberangkatan,
    required this.kategori,
    required this.travel,
    required this.namaProgram,
    required this.paket,
    required this.hotelMekkah,
    required this.hotelMadinah,
    required this.bintangMekkah,
    required this.bintangMadinah,
    required this.lamaHari,
    required this.matauang,
    required this.uangMuka,
    required this.matauangall,
    required this.hargaPaket,
    required this.sudahTermasuk,
    required this.belumTermasuk,
    required this.paketImg,
    required this.nomorGuide,
    required this.tampilan,
    required this.publish,
    required this.createdBy,
    required this.userId,
    required this.userName,
    required this.userEmail,
    required this.userPassword,
    required this.userLevel,
    required this.createdAt,
    required this.pass,
    required this.isJamaah,
    required this.fkIdJamaah,
    required this.idKeberangkatan,
    required this.tanggalKeberangkatan,
    required this.isAktif,
    required this.tanggalManasik,
  });

  factory PaketData.fromJson(Map<String, dynamic> json) {
    return PaketData(
      idPaket: json['id_paket'] ?? '',
      fkIdKeberangkatan: json['fk_id_keberangkatan'] ?? '',
      kategori: json['kategori'] ?? '',
      travel: json['travel'] ?? '',
      namaProgram: json['nama_program'] ?? '',
      paket: json['paket'] ?? '',
      hotelMekkah: json['hotel_mekkah'] ?? '',
      hotelMadinah: json['hotel_madinah'] ?? '',
      bintangMekkah: json['bintang_mekkah'] ?? '',
      bintangMadinah: json['bintang_madinah'] ?? '',
      lamaHari: json['lama_hari'] ?? '',
      matauang: json['matauang'] ?? '',
      uangMuka: json['uang_muka'] ?? '',
      matauangall: json['matauangall'] ?? '',
      hargaPaket: json['harga_paket'] ?? '',
      sudahTermasuk: json['sudah_termasuk'] ?? '',
      belumTermasuk: json['belum_termasuk'] ?? '',
      paketImg: baseUrl + (json['paket_img'] ?? ''),
      nomorGuide: json['nomor_guide'] ?? '',
      tampilan: json['tampilan'] ?? '',
      publish: json['publish'] ?? '',
      createdBy: json['created_by'] ?? '',
      userId: json['user_id'] ?? '',
      userName: json['user_name'] ?? '',
      userEmail: json['user_email'] ?? '',
      userPassword: json['user_password'] ?? '',
      userLevel: json['user_level'] ?? '',
      createdAt: json['created_at'] ?? '',
      pass: json['pass'] ?? '',
      isJamaah: json['is_jamaah'] ?? '',
      fkIdJamaah: json['fk_id_jamaah'] ?? '',
      idKeberangkatan: json['id_keberangkatan'] ?? '',
      tanggalKeberangkatan: json['tanggal_keberangkatan'] ?? '',
      isAktif: json['is_aktif'] ?? '',
      tanggalManasik: json['tanggal_manasik'] ?? '',
    );
  }
}

class DoaData {
  final String title;
  final String arab;
  final String transliteration;
  final String translation;
  final String category;

  DoaData({
    required this.title,
    required this.arab,
    required this.transliteration,
    required this.translation,
    required this.category,
  });

  factory DoaData.fromJson(Map<String, dynamic> json) {
    return DoaData(
      title: json['title'],
      arab: json['arab'],
      transliteration: json['transliteration'],
      translation: json['translation'],
      category: json['category'],
    );
  }
}
