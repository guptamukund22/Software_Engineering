import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TakePicture extends StatefulWidget {
  TakePicture({super.key, required this.camera});
  final CameraDescription camera;

  @override
  State<TakePicture> createState() => _TakePictureState();
}

class _TakePictureState extends State<TakePicture> {
  late CameraController controller;
  late Future<void> _initializeControlFuture;

  @override
  void initState() {
    controller = CameraController(widget.camera, ResolutionPreset.medium);
    _initializeControlFuture = controller.initialize();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int added = 0;
    String path = '';
    late XFile image;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            try {
              await _initializeControlFuture;
              image = await controller.takePicture();
              RepaintBoundary(
                child: Image.file(File(path)),
              );
              print("no");
              print(image.path);
              var response = await http.post(
                Uri.parse("https://api.api-ninjas.com/v1/objectdetection"),
                body: image.openRead(),
                headers: {
                  "X-Api-Key": "A5YaK1WdiD17DoY/DO0X7g==tqyS8IjQjqsVDGGZ"
                },
              );
              print(response);
            } catch (e) {
              print("yes");
              print(e);
              setState(() {
                added = 0;
              });
            }
          },
          child: Icon(Icons.camera)),
      body: [
        Column(
          children: [
            FutureBuilder(
                future: _initializeControlFuture,
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return CameraPreview(controller);
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                })),
            Container(
              height: 20,
              width: 20,
              color: Colors.black,
            ),
          ],
        ),
        Center(
          child: Image.file(File(path)),
        )
      ][added],
    );
  }
}

class Display extends StatelessWidget {
  Display({super.key, required this.path});
  final String path;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.file(File(path)),
      ),
    );
  }
}
