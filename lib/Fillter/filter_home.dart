import 'dart:convert';
import 'package:flutter/material.dart';
import 'fillter.dart';
import 'package:http/http.dart' as http;

Future<FilterProducts> fetchFilteredData() async {
  final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/filter_by'));

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    return FilterProducts.fromJson(jsonData);
  } else {
    throw Exception('Failed to fetch filtered data');
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<FilterProducts> _filteredData;

  @override
  void initState() {
    super.initState();
    _filteredData = fetchFilteredData();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FilterProducts>(
      future: _filteredData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text('Filtered Data: ${snapshot.data}');
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        // Display a loading indicator while fetching the data
        return CircularProgressIndicator();
      },
    );
  }
}
