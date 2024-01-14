import 'package:flutter/material.dart';
import 'package:listkuliner/detail_page.dart';
import 'package:listkuliner/http_helper.dart';
import 'package:listkuliner/makanan.dart';
import 'package:listkuliner/styles.dart';

class ListItem extends StatelessWidget {
  HttpHelper api = HttpHelper();
  final Makanan makanan;

  ListItem({super.key, required this.makanan, required this.api});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              makanan: makanan,
              api: api,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: decorBoxContainer(),
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  api.url + makanan.gambar,
                  height: 75,
                  width: 85,
                  fit: BoxFit.cover,
                )),
            const SizedBox(width: 10),
            itemText(),
            Icon(Icons.food_bank_rounded, color: iconColor, size: 30)
          ],
        ),
      ),
    );
  }

  BoxDecoration decorBoxContainer() {
    return const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      boxShadow: [
        BoxShadow(
          color: Color.fromARGB(255, 178, 178, 178),
          offset: Offset(1.0, 2.0),
          blurRadius: 6.0,
        ),
      ],
    );
  }

  Expanded itemText() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(makanan.nama, style: textHeader2),
          Text(
            makanan.deskripsi,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.black38),
          ),
          Text(
            makanan.harga,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black45,
            ),
          ),
        ],
      ),
    );
  }
}

/*class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.menu,
  });

  final Makanan menu;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(
                      makanan: menu,
                    )));
      },
      child: Container(
        margin: EdgeInsets.all(10),
        height: 100,
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                  color: const Color.fromARGB(255, 188, 188, 188),
                  offset: Offset(1, 2),
                  blurRadius: 6)
            ]),
        child: Row(
          children: [
            gambar(),
            SizedBox(
              width: 30,
            ),
            deskripsiTeks(),
            Icon(
              Icons.food_bank_rounded,
              color: iconColor,
            )
          ],
        ),
      ),
    );
  }

  ClipRRect gambar() {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: Image.asset(
        menu.gambarUtama,
        height: 75,
        width: 85,
        fit: BoxFit.cover,
      ),
    );
  }

  Expanded deskripsiTeks() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 12),
          Text(
            menu.nama,
            style: textHeader1,
          ),
          Text(
            menu.deskripsi,
            style: TextStyle(
              color: Colors.black38,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: 3),
          Text(
            menu.harga,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}*/
