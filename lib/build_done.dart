import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class BuildDone extends StatefulWidget {
  const BuildDone({super.key});

  @override
  State<BuildDone> createState() => _BuildDoneState();
}

class _BuildDoneState extends State<BuildDone> {
  bool isloading = false;

  final soraC = TextEditingController();
  final ayaC = TextEditingController();
  String data = "";
  String dataa = "";
  void getdata() async {
    setState(() {
      isloading = true;
    });
    final dio = Dio();
    final res = await dio.get(
      "http://api.alquran.cloud/v1/ayah/${soraC.text}:${ayaC.text}/quran-uthmani",
    );
    data = res.data['data']['text'].toString();
    dataa = res.data['data']['surah']['name'].toString();
    setState(() {
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(dataa),
          Text(data),
          TextFormField(
            controller: soraC,
            decoration: const InputDecoration(
              hintText: "رقم السورة",
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: ayaC,
            decoration: const InputDecoration(
              hintText: "رقم الاية",
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          MaterialButton(
            onPressed: () {
              getdata();
            },
            child: const Text("ENTER"),
          )
        ],
      ),
    );
  }
}
