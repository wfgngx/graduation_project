import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../utils/colors/app_colors.dart';

class Camera extends StatefulWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  File? pickedImageFile;
  void openCamToTakeImg(bool gallery) async {
    final pickedImage = await ImagePicker().pickImage(
      source: gallery == false ? ImageSource.camera : ImageSource.gallery,
      imageQuality: 50,
    );
    if (pickedImage == null) {
      return;
    }
    setState(() {
      pickedImageFile = File(pickedImage.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child:
        Center(
            child: pickedImageFile == null
                ? Column(
                    children: [
                      const Spacer(),
                      const Text(
                        'Drop a car photo',
                        style: TextStyle(
                            letterSpacing: 2,
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 46.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                              onTap: () => openCamToTakeImg(false),
                              child: Container(
                                height: 120.h,
                                width: 130.w,
                                decoration: BoxDecoration(
                                    color: secondaryColor,
                                    borderRadius: BorderRadius.circular(16)),
                                child: const Center(
                                    child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(
                                      Icons.camera_alt,
                                      color: Colors.white,
                                      size: 46,
                                    ),
                                    Text(
                                      'C a m e r a',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    )
                                  ],
                                )),
                              )),
                          InkWell(
                              onTap: () => openCamToTakeImg(true),
                              child: Container(
                                height: 120.h,
                                width: 130.w,
                                decoration: BoxDecoration(
                                    color: secondaryColor,
                                    borderRadius: BorderRadius.circular(16)),
                                child: const Center(
                                    child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(
                                      Icons.camera,
                                      color: Colors.white,
                                      size: 46,
                                    ),
                                    Text(
                                      'G a l l e r y',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    )
                                  ],
                                )),
                              )),
                          // const Spacer()
                        ],
                      ),
                      const Spacer()
                    ],
                  )
                : Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(16),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.file(pickedImageFile!))),
                      Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextButton(
                                  style: const ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          secondaryColor)),
                                  onPressed: () async {
                                    // await cutImage(
                                    //     context: context, image: image!);
                                  },
                                  child: const Text(
                                    "Discover",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24),
                                  )),
                              TextButton(
                                  style: const ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          secondaryColor)),
                                  onPressed: () {
                                    setState(() {
                                      pickedImageFile = null;
                                    });
                                  },
                                  child: const Text(
                                    "Cancel",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24),
                                  ))
                            ],
                          ))
                    ],
                  )),
      ),
    );
  }
}
