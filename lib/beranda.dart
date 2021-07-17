import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnhttp/http_view.dart';

class Beranda extends StatelessWidget {
  const Beranda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Beranda'),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Column(
                  children: [Text('Header')],
                ),
              ),
              Container(
                child: TextButton.icon(
                    onPressed: () {
                      Get.to(() => HttpView());
                    },
                    icon: Icon(Icons.ac_unit),
                    label: Text('Test Http')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
