import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';
import 'package:mobile_kepuharjo_new/Dashboard_User/Screen/Pengajuan//daftar_keluarga.dart';
import 'package:mobile_kepuharjo_new/Dashboard_User/Screen/Pengajuan/cetak/akta_kelahiran/daftar_keluarga.dart';
import 'package:mobile_kepuharjo_new/Dashboard_User/Screen/Pengajuan/cetak/akta_kematian/daftar_keluarga.dart';
import 'package:mobile_kepuharjo_new/Dashboard_User/Screen/Pengajuan/cetak/kk_baru/daftar_keluarga.dart';
import 'package:mobile_kepuharjo_new/Dashboard_User/Screen/Pengajuan/cetak/kk_hilang/daftar_keluarga.dart';
import 'package:mobile_kepuharjo_new/Dashboard_User/Screen/Pengajuan/keluarga_domisili.dart';
import 'package:mobile_kepuharjo_new/Dashboard_User/Screen/Pengajuan/surat_keterangan/SKCK/daftar_keluarga.dart';
import 'package:mobile_kepuharjo_new/Dashboard_User/Screen/Pengajuan/surat_keterangan/belum_menikah/daftar_keluarga.dart';
import 'package:mobile_kepuharjo_new/Dashboard_User/Screen/Pengajuan/surat_keterangan/domisili/daftar_keluarga.dart';
import 'package:mobile_kepuharjo_new/Dashboard_User/Screen/Pengajuan/surat_keterangan/kematian/daftar_keluarga.dart';
import 'package:mobile_kepuharjo_new/Dashboard_User/Screen/Pengajuan/surat_keterangan/pengajuan_kis/daftar_keluarga.dart';
import 'package:mobile_kepuharjo_new/Dashboard_User/Screen/Pengajuan/surat_keterangan/usaha/daftar_keluarga.dart';
import 'package:mobile_kepuharjo_new/Model/Surat.dart';
import 'package:mobile_kepuharjo_new/Resource/Mycolor.dart';
import 'package:mobile_kepuharjo_new/Resource/Myfont.dart';
import 'package:mobile_kepuharjo_new/Services/api_connect.dart';
import 'package:mobile_kepuharjo_new/Services/api_services.dart';

class Layanan extends StatefulWidget {
  const Layanan({super.key});

  @override
  State<Layanan> createState() => _LayananState();
}

class _LayananState extends State<Layanan> {
  ApiServices apiServices = ApiServices();
  late Future<List<Surat>> listdata;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listdata = apiServices.getSurat();
  }

  final searchController = TextEditingController();
  void _searchData(String searchText) {
    // Menggunakan setState untuk memperbarui tampilan berdasarkan input pencarian
    setState(() {
      // Implementasikan logika pencarian di sini
      // Misalnya, Anda dapat menggunakan method filter pada list data yang sudah ada

      // Contoh: Mencari data yang memiliki namaSurat mengandung searchText
      // Anda dapat mengganti logika pencarian ini sesuai kebutuhan Anda
      listdata = apiServices.getSurat().then((suratList) {
        return suratList
            .where((surat) => surat.namaSurat!
                .toLowerCase()
                .contains(searchText.toLowerCase()))
            .toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: white,
        appBar: AppBar(
          backgroundColor: white,
          shadowColor: Colors.transparent,
          // centerTitle: true,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              "Jenis Surat",
              style: MyFont.poppins(
                  fontSize: 16, color: black, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: [
              RefreshIndicator(
                color: lavender,
                onRefresh: () async {
                  listdata = apiServices.getSurat();
                },
                child: Container(
                  color: white,
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 48,
                    child: TextField(
                      style: MyFont.poppins(fontSize: 12, color: black),
                      controller: searchController,
                      decoration: InputDecoration(
                        isDense: true,
                        hintStyle: MyFont.poppins(fontSize: 12, color: black),
                        hintText: 'Cari',
                        prefixIcon: Icon(
                          Icons.search,
                          color: black,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            width: 1.0,
                            color: black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            width: 1.0,
                            color: black,
                          ),
                        ),
                      ),
                      onChanged: _searchData,
                    ),
                  ),
                ),
              ),
              FutureBuilder<List<Surat>>(
                future: listdata,
                builder: (context, snapshot) {
                  if (snapshot.hasData &&
                      snapshot.connectionState == ConnectionState.done) {
                    List<Surat>? data = snapshot.data;
                    return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: data!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            if (data[index].namaSurat ==
                                'Cetak Kartu Keluarga Baru') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DaftarKeluargakk(
                                    selectedSurat: data[index],
                                  ),
                                ),
                              );
                            } else if (data[index].namaSurat ==
                                'Cetak Kartu Keluarga Hilang') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DaftarKeluargakkhilang(
                                    selectedSurat: data[index],
                                  ),
                                ),
                              );
                            } else if (data[index].namaSurat ==
                                'Cetak Akta Kelahiran') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DaftarKeluargaaktalahir(
                                    selectedSurat: data[index],
                                  ),
                                ),
                              );
                            } else if (data[index].namaSurat ==
                                'Cetak Akta Kematian') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DaftarKeluargaAktaKematian(
                                    selectedSurat: data[index],
                                  ),
                                ),
                              );
                            } else if (data[index].namaSurat ==
                                'Surat Kematian') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DaftarKeluargaSuratKematian(
                                    selectedSurat: data[index],
                                  ),
                                ),
                              );
                            } else if (data[index].namaSurat ==
                                'Surat Keterangan Usaha') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DaftarKeluargaSuratUsaha(
                                    selectedSurat: data[index],
                                  ),
                                ),
                              );
                            } else if (data[index].namaSurat ==
                                'Surat Keterangan Catatan Kepolisian') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DaftarKeluargaSKCK(
                                    selectedSurat: data[index],
                                  ),
                                ),
                              );
                            } else if (data[index].namaSurat ==
                                'Surat Keterangan Belum Menikah') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DaftarKeluargaSuratBelumMenikah(
                                    selectedSurat: data[index],
                                  ),
                                ),
                              );
                            } else if (data[index].namaSurat ==
                                'Surat Keterangan Pengajuan KIS') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DaftarKeluargaSuratPengajuanKIS(
                                    selectedSurat: data[index],
                                  ),
                                ),
                              );
                            } else if (data[index].namaSurat ==
                                'Surat Keterangan Domisili') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DaftarKeluargaSuratDomisili(
                                    selectedSurat: data[index],
                                  ),
                                ),
                              );
                            }
                          },
                          child: Container(
                            height: 90,
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 5),
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 70,
                                  width: 70,
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: softgrey.withOpacity(0.1),
                                  ),
                                  child: SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: Image.network(
                                      Api.connectimage +
                                          data[index].image.toString(),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Surat Keterangan",
                                        style: MyFont.poppins(
                                            fontSize: 13,
                                            color: black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        data[index].namaSurat.toString(),
                                        style: MyFont.poppins(
                                            fontSize: 12, color: black),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return ListView.builder(
                      itemCount: 8,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CardLoading(
                                height: 70,
                                width: 70,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CardLoading(
                                    height: 16,
                                    width: 100,
                                    borderRadius: BorderRadius.circular(10),
                                    // color: Colors.grey,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  CardLoading(
                                    height: 12,
                                    width: 150,
                                    borderRadius: BorderRadius.circular(10),
                                    // color: Colors.grey,
                                  ),
                                ],
                              ))
                            ],
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return ListView.builder(
                      itemCount: 8,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CardLoading(
                                height: 70,
                                width: 70,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CardLoading(
                                    height: 16,
                                    width: 100,
                                    borderRadius: BorderRadius.circular(10),
                                    // color: Colors.grey,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  CardLoading(
                                    height: 12,
                                    width: 150,
                                    borderRadius: BorderRadius.circular(10),
                                    // color: Colors.grey,
                                  ),
                                ],
                              ))
                            ],
                          ),
                        );
                      },
                    );
                  }
                  // List<Surat>? data = snapshot.data;
                  return ListView.builder(
                    itemCount: 8,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CardLoading(
                              height: 70,
                              width: 70,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CardLoading(
                                  height: 16,
                                  width: 100,
                                  borderRadius: BorderRadius.circular(10),
                                  // color: Colors.grey,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                CardLoading(
                                  height: 12,
                                  width: 150,
                                  borderRadius: BorderRadius.circular(10),
                                  // color: Colors.grey,
                                ),
                              ],
                            ))
                          ],
                        ),
                      );
                    },
                  );
                },
              )
            ],
          ),
        ));
  }
}
