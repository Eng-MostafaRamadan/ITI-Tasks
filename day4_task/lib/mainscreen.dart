import 'package:day4_task/Data/category.dart';
import 'package:day4_task/Data/data.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final List<Category> list = Data().CategoryList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xffF2AA4C)),
        title: const Text(
          "WOW Pizza Category",
          style: TextStyle(color: Color(0xffF2AA4C)),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff101820),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          final item = list[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(10),
              onTap: () {
                Navigator.of(context).pushNamed(
                  item.namec,
                  arguments: item,
                );
              },
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.asset(item.image, fit: BoxFit.cover),
                ),
              ),
              title: Text(
                item.namec,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
    );
  }
}
