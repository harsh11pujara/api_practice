import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter/material.dart';

class ApiPractice extends StatefulWidget {
  const ApiPractice({Key? key}) : super(key: key);

  @override
  State<ApiPractice> createState() => _ApiPracticeState();
}

class _ApiPracticeState extends State<ApiPractice> {
  @override
  void initState() {
    fetchUserData();
    super.initState();
  }

  List<dynamic> user = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'GET method - fetching Data',
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: user.length,
          itemBuilder: (context, index) {
            var tempUser = user[index];
            return ListTile(
              leading: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(tempUser['picture']['thumbnail'])),
              title: Text(tempUser['name']['first']),
              subtitle: Text(tempUser['email']),
            );
          },
        ),
        floatingActionButton: SpeedDial(
          icon: Icons.more_horiz,
          activeBackgroundColor: Colors.transparent, children: [
          SpeedDialChild(child: const Icon(Icons.send_outlined), label: 'Post', onTap: postData),
          SpeedDialChild(child: const Icon(Icons.delete), label: 'Delete', onTap: () {}),
          SpeedDialChild(child: const Icon(Icons.find_replace), label: 'Put', onTap: () {})
        ],
        )
    );
  }

  fetchUserData() async {
    // print('getting data');
    String url = 'https://pokeapi.co/api/v2/pokemon';  //https://randomuser.me/api/?results=30
    final uri = Uri.parse(url);
    var response = await http.get(uri);
    var data = response.body;
    print(data.toString());
    var json = jsonDecode(data);
    setState(() {
      user = json['results'];
    });
    // print(json['results']);
  }

  postData() async {
    String url = 'https://jsonplaceholder.typicode.com/posts';

    var response = await http.post(Uri.parse(url),
        body: {'name': 'jack', 'age': '40', 'city': 'california'});
    print(response.statusCode);
  }
}