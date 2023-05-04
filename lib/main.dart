import 'dart:convert';
import 'package:api_practice/apiPractice.dart';
import 'package:api_practice/httpHelper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ImageUpload(),
  ));
}

class ImageUpload extends StatefulWidget {
  const ImageUpload({Key? key}) : super(key: key);

  @override
  State<ImageUpload> createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  List<Map> users = [];

  @override
  void initState() {
    Helper().fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[900],
        title: const Text(
          "Upload Image and CRUD",
          style: TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Helper().insertData(body: {"name":"harsh","color":"blue"});
            // showBottomSheet(
            //   context: context,
            //   builder: (context) {
            //     return Container(
            //       width: MediaQuery.of(context).size.width,
            //       height: 200,
            //     );
            //   },
            // );
          },
          child: Icon(Icons.add)),
    );
  }
}
