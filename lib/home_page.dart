import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:listkuliner/http_helper.dart';
import 'package:listkuliner/list_item.dart';
import 'package:listkuliner/makanan.dart';
import 'package:listkuliner/styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HttpHelper api = HttpHelper();
  Future<List<Makanan>> fetchmakanan() async {
    final response = await api.getAPI();

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      print(jsonResponse);
      return jsonResponse
          .map((makanan) => new Makanan.fromJson(makanan))
          .toList();
    } else {
      throw Exception();
    }
  }

  late Future<List<Makanan>> futuremakanan;

  @override
  void initState() {
    futuremakanan = fetchmakanan();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<List<Makanan>>(
        future: futuremakanan,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                padding: const EdgeInsets.all(10),
                itemBuilder: (context, index) {
                  var makanan = (snapshot.data as List<Makanan>)[index];
                  return ListItem(
                    makanan: makanan,
                    api: api,
                  );
                },
                itemCount: (snapshot.data as List<Makanan>).length);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

/*class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Makanan> listMenu = Makanan.dummyData;
    return SafeArea(
      child: Column(children: [
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.list_alt, size: 30),
            Text(
              'List Kuliner',
              style: textHeader1,
            )
          ],
        ),
        SizedBox(height: 10),
        Expanded(
            child: ListView.builder(
                itemCount: listMenu.length,
                itemBuilder: (context, index) {
                  return ListItem(menu: listMenu[index]);
                }))
      ]),
    );
  }
}*/
