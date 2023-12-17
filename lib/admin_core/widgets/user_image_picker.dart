import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  const UserImagePicker(
      {Key? key, required this.selectedImageFunction, required this.oldImage})
      : super(key: key);
  final void Function(File mySelectedImage) selectedImageFunction;
  final String oldImage;

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
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
    oldImage = getImageProviderFromAssets(widget.oldImage);
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: pickedImageFile != null
                      ? FileImage(pickedImageFile!)
                      : oldImage)),
        ),
        TextButton.icon(
          onPressed: openCamToTakeImg,
          icon: const Icon(
            Icons.image,
            color: Colors.white,
          ),
          label: const Text("Edit Brand Logo",
              style: TextStyle(
                color: Colors.white,
              )),
        )
      ],
    );
  }
}
