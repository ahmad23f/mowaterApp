import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';

class ImageFromDatabase extends StatefulWidget {
  final ApiService apiService;

  const ImageFromDatabase({super.key, required this.apiService});

  @override
  _ImageFromDatabaseState createState() => _ImageFromDatabaseState();
}

class _ImageFromDatabaseState extends State<ImageFromDatabase> {
  late Future<Uint8List> _imageFuture;

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image from MySQL'),
      ),
      body: Center(
        child: FutureBuilder<Uint8List>(
          future: _imageFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Image.memory(snapshot.data!);
            }
          },
        ),
      ),
    );
  }
}
