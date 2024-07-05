import 'package:mobile_kepuharjo_new/Model/Masyarakat.dart';
import 'package:mobile_kepuharjo_new/Model/Surat.dart';

class Pengajuan {
  int? idPengajuan;
  String? uuid;
  String? nomorSurat;
  String? noPengantar;
  String? status;
  String? keterangan;
  String? keteranganDitolak;
  String? createdAt;
  String? updatedAt;
  String? filePdf;
  String? imageBukti;
  String? imageKk;
  String? imageKTP;
  String? imageSuratNikah;
  String? imageAktaCerai;
  String? imageSuratKehilangan;
  String? imageBidan;
  String? imageSuratLahir;
  String? imageSuratKematian;
  String? imageAkteKelahiran;
  String? info;
  int? idMasyarakat;
  int? idSurat;
  Masyarakat? masyarakat;
  Surat? surat;

  Pengajuan(
      {this.idPengajuan,
      this.uuid,
      this.nomorSurat,
      this.noPengantar,
      this.status,
      this.keterangan,
      this.keteranganDitolak,
      this.createdAt,
      this.updatedAt,
      this.filePdf,
      this.imageBukti,
      this.imageKk,
      this.imageKTP,
      this.imageSuratNikah,
      this.imageAktaCerai,
      this.imageSuratKehilangan,
      this.imageBidan,
      this.imageSuratLahir,
      this.imageSuratKematian,
      this.imageAkteKelahiran,
      this.info,
      this.idMasyarakat,
      this.idSurat,
      this.masyarakat,
      this.surat});

  Pengajuan.fromJson(Map<String, dynamic> json) {
    idPengajuan = json['id_pengajuan'];
    uuid = json['uuid'];
    nomorSurat = json['nomor_surat'];
    noPengantar = json['no_pengantar'];
    status = json['status'];
    keterangan = json['keterangan'];
    keteranganDitolak = json['keterangan_ditolak'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    filePdf = json['file_pdf'];
    imageBukti = json['image_bukti'];
    imageKk = json['image_kk'];
    imageKTP = json['image_ktp'];
    imageSuratNikah = json['image_suratnikah'];
    imageAktaCerai = json['image_aktacerai'];
    imageSuratKehilangan = json['image_suratkehilangan'];
    imageBidan = json['image_bidan'];
    imageSuratLahir = json['image_suratlahir'];
    imageSuratKematian = json['image_suratkematian'];
    imageAkteKelahiran = json['image_aktekelahiran'];
    info = json['info'];
    idMasyarakat = json['id_masyarakat'];
    idSurat = json['id_surat'];
    masyarakat = json['masyarakat'] != null
        ? Masyarakat.fromJson(json['masyarakat'])
        : null;
    surat = json['surat'] != null ? Surat.fromJson(json['surat']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id_pengajuan'] = this.idPengajuan;
    data['uuid'] = this.uuid;
    data['nomor_surat'] = this.nomorSurat;
    data['status'] = this.status;
    data['keterangan'] = this.keterangan;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['file_pdf'] = this.filePdf;
    data['image_bukti'] = this.imageBukti;
    data['image_kk'] = this.imageKk;
    data['image_ktp'] = this.imageKTP;
    data['image_suratnikah'] = this.imageSuratNikah;
    data['image_aktacerai'] = this.imageAktaCerai;
    data['image_suratkehilangan'] = this.imageSuratKehilangan;
    data['image_bidan'] = this.imageBidan;
    data['image_suratnikah'] = this.imageSuratLahir;
    data['image_suratkematian'] = this.imageSuratKematian;
    data['image_aktekelahiran'] = this.imageAkteKelahiran;
    data['info'] = this.info;
    data['id_masyarakat'] = this.idMasyarakat;
    data['id_surat'] = this.idSurat;
    if (this.masyarakat != null) {
      data['masyarakat'] = this.masyarakat!.toJson();
    }
    if (this.surat != null) {
      data['surat'] = this.surat!.toJson();
    }
    return data;
  }
}
