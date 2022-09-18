import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

typedef void onClick(File file);
class getImageWidget extends StatefulWidget {
  final onClick pickImage;

  getImageWidget({Key? key,required this.pickImage}) : super(key: key);

  @override
  State<getImageWidget> createState() => _getImageWidgetState();
}

class _getImageWidgetState extends State<getImageWidget> {
  File? _image;

  final picker = ImagePicker();

  //bool _load = false;
  Future _getImage(ImageSource imageSource) async {
    final image = await picker.pickImage(source: imageSource);

    setState(() {
      _image = File(image!.path);
      widget.pickImage(_image!);
    });
  }

  Widget showImage() {
    return Container(
      // width: 180,
      // height: 180,
        color: const Color(0xffd0cece),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
        child: Center(
            child: _image == null
                ? Icon(Icons.add)
                : Image.file(File(_image!.path)))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
      //padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
      height: 180,
      width: 180,
      //showImage(),
      child: Card(
        //margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
        //padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
        child: Container(
          child: InkWell(
            child: showImage(),
            onTap: () {
              _getImage(ImageSource.gallery);
            },
          ),
        ),
        color: Color(0xffc6c6c6),
      ),
    );
  }
}
