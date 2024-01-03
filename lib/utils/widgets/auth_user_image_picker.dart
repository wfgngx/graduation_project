import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class AuthUserImagePicker extends StatefulWidget {
  AuthUserImagePicker(
      {Key? key,
      required this.selectedImageFunction,
      required this.oldImage,
      this.edit = false,
      this.radius = 30})
      : super(key: key);
  final void Function(File mySelectedImage) selectedImageFunction;
  final String oldImage;
  double radius = 30;
  bool edit = false;

  @override
  State<AuthUserImagePicker> createState() => _AuthUserImagePickerState();
}

class _AuthUserImagePickerState extends State<AuthUserImagePicker> {
  File? pickedImageFile;
  late dynamic oldImage;
  void openCamToTakeImg() async {
    final pickedImage = await ImagePicker().pickImage(
        source: ImageSource.gallery, imageQuality: 50, maxWidth: 150);
    if (pickedImage == null) {
      return;
    }
    setState(() {
      pickedImageFile = File(pickedImage.path);
    });
    widget.selectedImageFunction(pickedImageFile!);
  }

  ImageProvider<Object>? getImageProviderFromAssets(String path) {
    return NetworkImage(path);
  }

  @override
  Widget build(BuildContext context) {
    oldImage = NetworkImage(widget.oldImage);
    return Column(
      children: [
        widget.edit
            ? InkWell(
                onTap: openCamToTakeImg,
                child: CircleAvatar(
                    radius: widget.radius,
                    backgroundImage: pickedImageFile != null
                        ? FileImage(pickedImageFile!)
                        : oldImage),
              )
            : CircleAvatar(
                radius: widget.radius,
                backgroundImage: pickedImageFile != null
                    ? FileImage(pickedImageFile!)
                    : oldImage),
        // InkWell(
        //   onTap: openCamToTakeImg,
        //   child: Icon(
        //     Icons.edit,
        //     color: Colors.white,
        //     size: 12,
        //   ),
        // )
        // TextButton.icon(
        //   onPressed: openCamToTakeImg,
        //   icon: const Icon(
        //     Icons.edit,
        //     size: 12,
        //     color: Colors.white,
        //   ),
        //   label: const Text("",
        //       style: TextStyle(
        //         color: Colors.white,
        //       )),
        // )
      ],
    );
  }
}
