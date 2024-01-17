import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/Provider/FireBase/firebase_function.dart';
import 'package:graduation_project/api/ai_api.dart';
import 'package:graduation_project/screens/ai/searched_car_screen.dart';
import 'package:graduation_project/screens/ai/success_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../utils/colors/app_colors.dart';

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

  bool detected = false;
  bool wrong = false;
  bool load = false;

  Map<String, dynamic> myResponse = {};
  String bodyType = '';
  String modelName = '';
  bool searchCar = false;
  Map brandEqual = {
    'ALFA ROMEO': 'assets/logo_brand/Al.png',
    'AUDI': 'assets/logo_brand/audi.webp',
    'BMW': 'assets/logo/BMW.png',
    'CHEVROLET': 'assets/logo/Chevrolet_logo_PNG3.png',
    'CITROEN': 'assets/logo/Citroen_logo_PNG4.png',
    'DAEWOO': 'assets/logo/Daewoo_logo_PNG3.png',
    'DODGE': 'assets/logo/Dodge_logo_PNG10.png',
    'FERRARI': 'assets/logo/Ferrari_logo_PNG11.png',
    'FIAT': 'assets/logo/Fiat_logo_PNG1.gif',
    'FORD': 'assets/logo/Ford_logo_PNG2.png',
    'GEELY': 'assets/logo/Geely_logo_PNG2.png',
    'HONDA': 'assets/logo/Honda_logo_PNG4.png',
    'HUMMER': 'assets/logo_brand/Hummer.webp',
    'JEEP': 'assets/logo_brand/jeep.webp',
    'KIA': 'assets/logo/KIA_logo_PNG2.png',
    'LADA': 'assets/logo/Lada_logo_PNG1.png',
    'LAND ROVER': 'assets/logo/Land-Rover_logo_PNG1.png',
    'MESERATI': 'assets/logo_brand/maserati.webp',
    'MAZDA': 'assets/logo/Mazda_logo_PNG5.png',
    'Mercedes-AMG': 'assets/logo_brand/mercedes-amg.png',
    'MERCEDES BENZ': 'assets/logo/Mercedes.png',
    'MG': 'assets/logo/MG_logo_PNG11.png',
    'MINI': 'assets/logo/MINI_logo_PNG2.png',
    'MITSUBISHI': 'assets/logo/Mitsubishi_logo_PNG3.png',
    'NISSAN': 'assets/logo/Nissan_logo_PNG1.png',
    'OPEL': 'assets/logo/Opel_logo_PNG14.png',
    'PEUGEOT': 'assets/logo_brand/Peugeot.webp',
    'PORSCHE': 'assets/logo/Porsche_logo_PNG5.png',
    'PROTON': 'assets/logo/Proton_logo_PNG2.png',
    'RAM Trucks': 'assets/logo/Ram-Logo-PNG_008.png',
    'RENAULT': 'assets/logo_brand/Renault.webp',
    'SKODA': 'assets/logo/Škoda_logo_PNG3.png',
    'SUBARU': 'assets/logo/Subaru_logo_PNG3.png',
    'MARUTI SUZUKI': 'assets/logo/Maruti_Suzuki_Logo_PNG6.png',
    'SUZUKI': 'assets/logo/Suzuki_logo_PNG2.png',
    'TESLA': 'assets/logo/Tesla.png',
    'TOYOTA': 'assets/logo/Toyota_logo_PNG15.png',
    'VOLVO': 'assets/logo/Volvo_logo_PNG1.png',
    'BYD': 'assets/logo/BYD_logo_PNG5.png',
    'SEAT': 'assets/logo/Seat_logo_PNG3-scaled.jpg',
    'INFINITI': 'assets/logo/Infiniti_logo_PNG10.png',
    'CUPRA': 'assets/logo/Cupra_logo_PNG4.png',
    'DAIHATSU': 'assets/logo/Daihatsu_logo_PNG15.png',
    'HYUNDAI': 'assets/logo/Hyundai_logo_PNG2.png',
    'VOLKSWAGEN': 'assets/logo/Volkswagen_logo_PNG1.png'
  };

  @override
  Widget build(BuildContext context) {
    // String allTextBeforeLastSpace = textBeforeLastSpace.join(' ');
    List<String> words = bodyType.split(' ');
    String lastWord = words.last;
    List<String> textBeforeLastSpace = words.sublist(0, words.length - 1);
    modelName = textBeforeLastSpace.join(' ');

    return Scaffold(
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Center(
                child: pickedImageFile == null
                    ? SizedBox(
                        height: 600,
                        child: Column(
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
                                          borderRadius:
                                              BorderRadius.circular(16)),
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
                                          borderRadius:
                                              BorderRadius.circular(16)),
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
                        ))
                    : Stack(
                        children: [
                          Column(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image.file(
                                          height: 400,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              50,
                                          pickedImageFile!))),
                              detected
                                  ? Column(children: [
                                      Image.asset(
                                        brandEqual[
                                            "${myResponse['result']['prediction']['company']}"
                                                .toUpperCase()],
                                        width: 100,
                                        height: 50,
                                      ),
                                      Container(
                                          width: 300,
                                          height: 300,
                                          decoration: BoxDecoration(
                                              color: secondaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  "Brand : ${myResponse['result']['prediction']['company']}",
                                                  style: GoogleFonts.actor(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Text(
                                                  // "Prediction is : ${myResponse['result']['prediction']['model']}",
                                                  "Model: $modelName",
                                                  style: GoogleFonts.actor(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Text(
                                                  "Body Type: $lastWord",
                                                  style: GoogleFonts.actor(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Text(
                                                  "Year of Production: ${myResponse['result']['prediction']['year']}",
                                                  style: GoogleFonts.actor(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Text(
                                                  "Probability is : ${myResponse['result']['probability']} %",
                                                  style: GoogleFonts.actor(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Gap(30),
                                                Center(
                                                  child: Row(
                                                    children: [
                                                      Card(
                                                          elevation: 50,
                                                          child: Container(
                                                            height: 50,
                                                            width: 130,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  primaryColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                            ),
                                                            child: InkWell(
                                                              onTap: () {
                                                                setState(() {
                                                                  pickedImageFile =
                                                                      null;
                                                                  detected =
                                                                      false;
                                                                });
                                                              },
                                                              child:
                                                                  const Center(
                                                                child: Text(
                                                                  "Add another car",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          )),
                                                      Card(
                                                          elevation: 50,
                                                          child: Container(
                                                            height: 50,
                                                            width: 130,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  primaryColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                            ),
                                                            child: InkWell(
                                                              onTap: () {
                                                                print(
                                                                  myResponse['result']
                                                                          [
                                                                          'prediction']
                                                                      [
                                                                      'company'],
                                                                );
                                                                print(
                                                                    modelName);
                                                                Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                  builder:
                                                                      (context) {
                                                                    return SearchedCarScreen(
                                                                      brand: myResponse['result']
                                                                              [
                                                                              'prediction']
                                                                          [
                                                                          'company'],
                                                                      carSearched:
                                                                          modelName,
                                                                    );
                                                                  },
                                                                ));
                                                              },
                                                              child:
                                                                  const Center(
                                                                child: Text(
                                                                  "Search",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ))
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ))
                                    ])
                                  : Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          TextButton(
                                              style: const ButtonStyle(
                                                  // fixedSize: MaterialStatePropertyAll(50),
                                                  backgroundColor:
                                                      MaterialStatePropertyAll(
                                                          secondaryColor)),
                                              onPressed: () async {
                                                setState(() {
                                                  load = true;
                                                });
                                                var myCarResponse =
                                                    await AIApi().detectCar(
                                                        image: pickedImageFile,
                                                        token: Provider.of<
                                                                    MyProvider>(
                                                                context,
                                                                listen: false)
                                                            .myToken);
                                                if (myCarResponse['success'] ==
                                                    true) {
                                                  setState(() {
                                                    load = false;
                                                    myResponse = myCarResponse;
                                                    bodyType =
                                                        myCarResponse['result']
                                                                ['prediction']
                                                            ['model'];
                                                    modelName =
                                                        myCarResponse['result']
                                                                ['prediction']
                                                            ['model'];
                                                    detected = true;
                                                  });
                                                  print(myCarResponse);
                                                } else {
                                                  setState(() {
                                                    // detected = true;
                                                    load = false;
                                                    wrong = true;
                                                    myResponse = myCarResponse;

                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              SuccessfulScreen(
                                                                  image:
                                                                      pickedImageFile!,
                                                                  response:
                                                                      myResponse[
                                                                          'message']),
                                                        ));
                                                  });
                                                }
                                              },
                                              child: load
                                                  ? const CircularProgressIndicator(
                                                      color: Colors.white,
                                                    )
                                                  : const Text(
                                                      "Discover",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 24),
                                                    )),
                                          TextButton(
                                              style: const ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStatePropertyAll(
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
                                      )),
                              const Gap(50)
                            ],
                          )
                        ],
                      )),
          ),
        ));
  }
}
// Card(
//     elevation: 50,
//     child: Container(
//       height: 50,
//       width: 130,
//       decoration:
//           BoxDecoration(
//         color: primaryColor,
//         borderRadius:
//             BorderRadius
//                 .circular(
//                     12),
//       ),
//       child: InkWell(
//         onTap: () {
//           setState(() {
//             pickedImageFile =
//                 null;
//             detected =
//                 false;
//           });
//         },
//         child: const Center(
//           child: Text(
//             "Add another car",
//             style:
//                 TextStyle(
//               fontSize: 18,
//               color: Colors
//                   .white,
//             ),
//           ),
//         ),
//       ),
//     )
