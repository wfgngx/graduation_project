import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/admin_core/network/car_apis.dart';
import 'package:graduation_project/utils/colors/app_colors.dart';
import 'package:image_picker/image_picker.dart';
import '../../api/view/car_api.dart';
import '../../model/car_model.dart';

class AddCarScreen extends StatefulWidget {
  const AddCarScreen({Key? key}) : super(key: key);

  @override
  State<AddCarScreen> createState() => _AddCarScreenState();
}

class _AddCarScreenState extends State<AddCarScreen> {
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

  ImageProvider<Object>? getImageProviderFromAssets(String path) {
    return AssetImage(path);
  }

  TextEditingController brandName = TextEditingController();
  TextEditingController carName = TextEditingController();
  TextEditingController gearBox = TextEditingController();
  TextEditingController bodyType = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController sales = TextEditingController();
  TextEditingController driveType = TextEditingController();
  TextEditingController topSpeed = TextEditingController();
  TextEditingController acceleration = TextEditingController();
  TextEditingController fuel = TextEditingController();
  TextEditingController yearOfProduction = TextEditingController();
  late List<int> years = [2002];
  @override
  void initState() {
    super.initState();
    fetchCars();
  }

  List<CarModel> myCars = [];

  void fetchCars() async {
    List<CarModel> carData = await CarApi().fetchCars(
      limit: 20,
      offset: 0,
    );
    setState(() {
      myCars = carData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                const Text(
                  "Add a new car",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  width: 150,
                  decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(16)),
                  child: Center(
                    child: pickedImageFile == null
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Spacer(),
                              IconButton(
                                  onPressed: () {
                                    openCamToTakeImg(true);
                                  },
                                  icon: const Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                    size: 32,
                                  )),
                              const Spacer(),
                              IconButton(
                                  onPressed: () {
                                    openCamToTakeImg(false);
                                  },
                                  icon: const Icon(
                                    Icons.camera,
                                    color: Colors.white,
                                    size: 32,
                                  )),
                              const Spacer()
                            ],
                          )
                        : Image.file(pickedImageFile!),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextField(
                  controller: brandName,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    hintText: "Brand Name",
                    hintStyle: TextStyle(color: Colors.white30),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: carName,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    hintText: "Name",
                    hintStyle: TextStyle(color: Colors.white30),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                TextField(
                  controller: gearBox,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    hintText: "Gear Box",
                    hintStyle: TextStyle(color: Colors.white30),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                TextField(
                  controller: bodyType,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    hintText: "Body Type",
                    hintStyle: TextStyle(color: Colors.white30),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                TextField(
                  controller: price,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    hintText: "Price",
                    hintStyle: TextStyle(color: Colors.white30),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                TextField(
                  controller: sales,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    hintText: "Sales",
                    hintStyle: TextStyle(color: Colors.white30),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                TextField(
                  controller: driveType,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    hintText: "Drive Type",
                    hintStyle: TextStyle(color: Colors.white30),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                TextField(
                  controller: topSpeed,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    hintText: "Top Speed",
                    hintStyle: TextStyle(color: Colors.white30),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                TextField(
                  controller: acceleration,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    hintText: "Acceleration",
                    hintStyle: TextStyle(color: Colors.white30),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                TextField(
                  controller: fuel,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    hintText: "Fuel",
                    hintStyle: TextStyle(color: Colors.white30),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                // TextField(
                //   controller: yearOfProduction,
                //   onChanged: (value) {
                //     // years.add(yearOfProduction.toString());
                //   },
                //   decoration: const InputDecoration(
                //     border: OutlineInputBorder(
                //         borderRadius: BorderRadius.all(Radius.circular(16))),
                //     hintText: "Year of production",
                //     hintStyle: TextStyle(color: Colors.white30),
                //   ),
                // ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: 150.w,
                        child: ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.white),
                                elevation: MaterialStatePropertyAll(10)),
                            onPressed: () async {
                              List<int> years = yearOfProduction.text
                                  .split(',')
                                  .map((year) => int.tryParse(year.trim()) ?? 0)
                                  .toList();
                              var response = await AdminCarsApi()
                                  .addCar(
                                image: pickedImageFile,
                                brandName: brandName.text,
                                name: carName.text,
                                gearBox: gearBox.text,
                                bodyType: bodyType.text,
                                price: price.text,
                                sales: sales.text,
                                driveType: driveType.text,
                                topSpeed: topSpeed.text,
                                acceleration: acceleration.text,
                                fuel: fuel.text,
                                // yearOfProduction: years
                              )
                                  .then((value) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        backgroundColor: Colors.green,
                                        content:
                                            Text("Car Updated Successfully")));
                                setState(() {
                                  Navigator.pop(context);
                                });
                              });
                              print(response);
                            },
                            child: const Text(
                              "Submit",
                              style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ))),
                    SizedBox(
                        width: 150.w,
                        child: ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.white),
                                elevation: MaterialStatePropertyAll(10)),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Cancel",
                              style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
