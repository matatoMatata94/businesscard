import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BusinessCard extends StatefulWidget {
  @override
  _BusinessCardState createState() => _BusinessCardState();
}

class _BusinessCardState extends State<BusinessCard> {
  File _avatarImage;
  final picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 150,
                width: 150,
                child: Center(
                  child: _avatarImage == null
                      ? Text('No image selected.')
                      : Image.file(_avatarImage),
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.orange,
                ),
              ),
              Container(height: 50),
              Container(
                child: Text(
                  'matatoMatata94',
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 40,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
                width: 250,
                child: Divider(
                  thickness: 2,
                  color: Colors.teal[100],
                ),
              ),
              Container(height: 30),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.teal,
                  ),
                  title: Text(
                    '+99 123456789',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.teal[900],
                    ),
                  ),
                ),
              ),
              Container(height: 30),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: ListTile(
                  leading: Icon(
                    Icons.mail,
                    color: Colors.teal,
                  ),
                  title: Text(
                    'example@mail.com',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.teal[900],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: getImage,
          tooltip: 'Pick Image',
          child: Icon(Icons.add_a_photo),
        ),
      ),
    );
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
    );

    setState(() {
      if (pickedFile != null) {
        _avatarImage = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
}
