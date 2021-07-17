import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class HttpView extends StatelessWidget {
  const HttpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('HTTP VIEW'),
        ),
        body: HttpViewBody(),
      ),
    );
  }
}

class HttpViewBody extends StatelessWidget {
  const HttpViewBody({Key? key}) : super(key: key);

  void _getHtttp() async {
    // This example uses the Google Books API to search for books about http.
    // https://developers.google.com/books/docs/overview
    // https://www.googleapis.com//books/v1/volumes?q=http
    var url =
        Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var itemCount = jsonResponse['totalItems'];
      // print('Number of books about http: $itemCount.');
      // print('body respons: $jsonResponse.');
      // print('Number of keys: ' + jsonResponse.keys.length.toString());
      print('items na: ' + jsonResponse['items'][0].keys.toString());
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
          onPressed: () {
            _getHtttp();
          },
          child: Text('get http')),
    );
  }
}
