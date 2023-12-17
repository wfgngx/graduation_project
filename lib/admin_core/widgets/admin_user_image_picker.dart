import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AdminUserImagePicker extends StatefulWidget {
  const AdminUserImagePicker({Key? key, required this.selectedImageFunction})
      : super(key: key);
  final void Function(File mySelectedImage) selectedImageFunction;

  @override
  State<AdminUserImagePicker> createState() => _AdminUserImagePickerState();
}

class _AdminUserImagePickerState extends State<AdminUserImagePicker> {
  File? pickedImageFile;
  Future<void> openCamToTakeImg() async {
    final pickedImage = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 50, maxWidth: 150);

    if (pickedImage == null) {
      return;
    }
    setState(() {
      pickedImageFile = File(pickedImage.path);
    });
    widget.selectedImageFunction(pickedImageFile!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          foregroundImage:
              pickedImageFile != null ? FileImage(pickedImageFile!) : null,
        ),
        TextButton.icon(
          onPressed: openCamToTakeImg,
          icon: const Icon(Icons.image),
          label: Text("Select an image",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              )),
        )
      ],
    );
  }
}
