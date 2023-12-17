import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/admin_core/widgets/admin_user_image_picker.dart';
import 'package:graduation_project/admin_core/network/brand_apis.dart';
import 'package:graduation_project/admin_core/screens/admin_cars.dart';
import 'package:graduation_project/utils/colors/app_colors.dart';
import '../../api/view/brand_api.dart';
import '../../model/brand_model.dart';
import '../../utils/widgets/company_container.dart';
import '../widgets/user_image_picker.dart';

class AdminBrands extends StatefulWidget {
  const AdminBrands({Key? key}) : super(key: key);

  @override
  State<AdminBrands> createState() => _AdminBrandsState();
}

class _AdminBrandsState extends State<AdminBrands> {
  File? branLogo;
  File? brandLogoEdit;
  File? passedSelectedImage;
  final TextEditingController brandNameController = TextEditingController();
  final TextEditingController brandCountryController = TextEditingController();
  final TextEditingController brandNameControllerEdit = TextEditingController();
  final TextEditingController brandCountryControllerEdit =
      TextEditingController();

  List<BrandModel> myBrands = [];
  // Map brandEqual = {
  //   'ALFA ROMEO': 'assets/logo_brand/Al.png',
  //   'AUDI': 'assets/logo_brand/audi.webp',
  //   'BMW': 'assets/logo/BMW.png',
  //   'CHEVROLET': 'assets/logo/Chevrolet_logo_PNG3.png',
  //   'CITROEN': 'assets/logo/Citroen_logo_PNG4.png',
  //   'DAEWOO': 'assets/logo/Daewoo_logo_PNG3.png',
  //   'DODGE': 'assets/logo/Dodge_logo_PNG10.png',
  //   'FERRARI': 'assets/logo/Ferrari_logo_PNG11.png',
  //   'FIAT': 'assets/logo/Fiat_logo_PNG1.gif',
  //   'FORD': 'assets/logo/Ford_logo_PNG2.png',
  //   'GEELY': 'assets/logo/Geely_logo_PNG2.png',
  //   'HONDA': 'assets/logo/Honda_logo_PNG4.png',
  //   'HUMMER': 'assets/logo_brand/Hummer.webp',
  //   'JEEP': 'assets/logo_brand/jeep.webp',
  //   'KIA': 'assets/logo/KIA_logo_PNG2.png',
  //   'LADA': 'assets/logo/Lada_logo_PNG1.png',
  //   'LAND ROVER': 'assets/logo/Land-Rover_logo_PNG1.png',
  //   'MESERATI': 'assets/logo_brand/maserati.webp',
  //   'MAZDA': 'assets/logo/Mazda_logo_PNG5.png',
  //   'Mercedes-AMG': 'assets/logo_brand/mercedes-amg.png',
  //   'MERCEDES BENZ': 'assets/logo/Mercedes.png',
  //   'MG': 'assets/logo/MG_logo_PNG11.png',
  //   'MINI': 'assets/logo/MINI_logo_PNG2.png',
  //   'MITSUBISHI': 'assets/logo/Mitsubishi_logo_PNG3.png',
  //   'NISSAN': 'assets/logo/Nissan_logo_PNG1.png',
  //   'OPEL': 'assets/logo/Opel_logo_PNG14.png',
  //   'PEUGEOT': 'assets/logo_brand/Peugeot.webp',
  //   'PORSCHE': 'assets/logo/Porsche_logo_PNG5.png',
  //   'PROTON': 'assets/logo/Proton_logo_PNG2.png',
  //   'RAM Trucks': 'assets/logo/Ram-Logo-PNG_008.png',
  //   'RENAULT': 'assets/logo_brand/Renault.webp',
  //   'SKODA': 'assets/logo/Škoda_logo_PNG3.png',
  //   'SUBARU': 'assets/logo/Subaru_logo_PNG3.png',
  //   'MARUTI SUZUKI': 'assets/logo/Maruti_Suzuki_Logo_PNG6.png',
  //   'SUZUKI': 'assets/logo/Suzuki_logo_PNG2.png',
  //   'TESLA': 'assets/logo/Tesla.png',
  //   'TOYOTA': 'assets/logo/Toyota_logo_PNG15.png',
  //   'VOLVO': 'assets/logo/Volvo_logo_PNG1.png',
  //   'BYD': 'assets/logo/BYD_logo_PNG5.png',
  //   'SEAT': 'assets/logo/Seat_logo_PNG3-scaled.jpg',
  //   'INFINITI': 'assets/logo/Infiniti_logo_PNG10.png',
  //   'CUPRA': 'assets/logo/Cupra_logo_PNG4.png',
  //   'DAIHATSU': 'assets/logo/Daihatsu_logo_PNG15.png',
  //   'HYUNDAI': 'assets/logo/Hyundai_logo_PNG2.png',
  //   'VOLKSWAGEN': 'assets/logo/Volkswagen_logo_PNG1.png'
  // };
  // int limit = 40;
  // int offset = 0;
  // bool isFirstLoadRunning = false;
  @override
  void initState() {
    super.initState();
    fetchBrands();
  }

  Future fetchBrands() async {
    List<BrandModel> brandData = await BrandApiAdmin().getAllBrands();
    setState(() {
      myBrands = brandData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            floatingActionButton: FloatingActionButton(
              backgroundColor: primaryColor,
              foregroundColor: Colors.white,
              child: const Icon(
                Icons.add,
              ),
              onPressed: () => addBrandBottomSheet(context),
            ),
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      addBrandBottomSheet(
                        context,
                      );
                    },
                    icon: const Icon(Icons.add))
              ],
              backgroundColor: secondaryColor,
              foregroundColor: Colors.white,
              title: const Text("Brands"),
            ),
            backgroundColor: primaryColor,
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 12.h,
                  ),
                  Expanded(
                      child: GridView.builder(
                    itemCount: myBrands.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return FutureBuilder(
                        future: BrandApiAdmin().getAllBrands(),
                        builder: (context, snapshot) {
                          // if (snapshot.connectionState ==
                          //     ConnectionState.waiting) {
                          //   return const CircularProgressIndicator(
                          //       // backgroundColor: Colors.transparent,
                          //       // color: Colors.transparent,
                          //       );
                          // }
                          if (snapshot.hasError) {
                            return const Text('No Data Found...');
                          }
                          if (snapshot.hasData) {
                            return Padding(
                                padding: const EdgeInsets.all(8),
                                child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                AdminModelsScreen(
                                                    brandName:
                                                        myBrands[index].name),
                                          ));
                                    },
                                    child: GestureDetector(
                                      onLongPress: () {
                                        _showAlertDialog(
                                            myBrands[index].name,
                                            myBrands[index].logo,
                                            myBrands[index].name,
                                            myBrands[index].id);
                                      },
                                      child: CompanyContainer(
                                          img: myBrands[index].logo,
                                          brandName: myBrands[index].name),
                                    )));
                          }
                          return const CircularProgressIndicator(
                            color: Colors.white,
                            backgroundColor: Colors.white,
                          );
                        },
                      );
                    },
                  )),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          BrandApiAdmin().getAllBrands();
                        });
                      },
                      child: const Text(
                        'See more',
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            )));
  }

  Future<void> _showAlertDialog(
      String modelName, String oldImage, String myOldName, String id) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(modelName),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Edit',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                showBottomSheetFun(context, oldImage, myOldName, id);
              },
            ),
            TextButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.red)),
              child: const Text(
                'Delete',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                await BrandApiAdmin().deleteBrand(id).then((value) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(
                        "Brand Deleted Successfully",
                        style: TextStyle(color: Colors.white),
                      )));
                  Navigator.pop(context);
                  setState(() {
                    fetchBrands();
                  });
                });
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> addBrandBottomSheet(BuildContext context) async {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
                color: secondaryColor,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(12),
                        child: Container(
                            width: 200.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.white)),
                            child: const Center(
                                child: Text(
                              "Add Brand",
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )))),
                    SizedBox(
                      height: 12.h,
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 12.w),
                        child: Align(
                            alignment: AlignmentDirectional.topStart,
                            child: Text(
                              'Brand Name',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp),
                            ))),
                    SizedBox(
                      height: 5.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12.w, right: 12.w),
                      child: TextField(
                        controller: brandNameController,
                        onChanged: (value) {
                          setState(() {
                            brandNameController.text = value;
                          });
                        },
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                    color: Colors.transparent)),
                            focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            border: const OutlineInputBorder()),
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 12.w),
                        child: Align(
                            alignment: AlignmentDirectional.topStart,
                            child: Text(
                              'Brand Country',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp),
                            ))),
                    SizedBox(
                      height: 5.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12.w, right: 12.w),
                      child: TextField(
                        // controller: TextEditingController()..text = myOldName,
                        controller: brandCountryController,
                        onChanged: (value) {
                          setState(() {
                            brandCountryController.text = value;
                          });
                        },
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                    color: Colors.transparent)),
                            focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            border: const OutlineInputBorder()),
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 12.w),
                        child: Align(
                            alignment: AlignmentDirectional.topStart,
                            child: Text(
                              'Brand Logo',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp),
                            ))),
                    SizedBox(
                      height: 5.h,
                    ),
                    AdminUserImagePicker(
                      selectedImageFunction: (mySelectedImage) {
                        branLogo = mySelectedImage;
                      },
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                            onTap: () async {
                              await BrandApiAdmin()
                                  .addBrand(
                                      name: brandNameController.text,
                                      country: brandCountryController.text,
                                      image: branLogo)
                                  .then((value) {
                                print(value);
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                        backgroundColor: Colors.green,
                                        content: Text(
                                          "Data Send Successfully",
                                          style: TextStyle(color: Colors.white),
                                        )));
                                Navigator.pop(context);
                                setState(() {
                                  fetchBrands();
                                });
                                print('Brand Added Successfully');
                              });
                            },
                            child: Container(
                              height: 40.h,
                              width: MediaQuery.of(context).size.width / 3,
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(16.r)),
                              child: Center(
                                  child: Text(
                                "Add Brand",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700),
                              )),
                            )),
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            height: 40.h,
                            width: MediaQuery.of(context).size.width / 3,
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(16.r)),
                            child: Center(
                                child: Text(
                              "Cancel",
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            )),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    )
                  ],
                )));
      },
    );
  }

  Future<void> showBottomSheetFun(
      BuildContext context, String oldImage, String myOldName, String id) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
                color: secondaryColor,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(12),
                        child: Container(
                            width: 200.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.white)),
                            child: const Center(
                                child: Text(
                              "Edit Brand",
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )))),
                    SizedBox(
                      height: 12.h,
                    ),
                    UserImagePicker(
                      oldImage: oldImage,
                      selectedImageFunction: (mySelectedImage) {
                        brandLogoEdit = mySelectedImage;
                      },
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 12.w),
                        child: Align(
                            alignment: AlignmentDirectional.topStart,
                            child: Text(
                              'Brand Name',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp),
                            ))),
                    SizedBox(
                      height: 5.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12.w, right: 12.w),
                      child: TextField(
                        controller: brandNameControllerEdit,
                        onChanged: (value) {
                          setState(() {
                            brandNameControllerEdit.text = value;
                          });
                        },
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                    color: Colors.transparent)),
                            focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            border: const OutlineInputBorder()),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12.w, right: 12.w),
                      child: TextField(
                        controller: brandCountryControllerEdit,
                        onChanged: (value) {
                          setState(() {
                            brandCountryControllerEdit.text = value;
                          });
                        },
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                    color: Colors.transparent)),
                            focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            border: const OutlineInputBorder()),
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () async {
                            print('Edit');
                            await BrandApiAdmin()
                                .editBrand(
                                    name: brandNameControllerEdit.text,
                                    country: brandCountryControllerEdit.text,
                                    image: brandLogoEdit,
                                    id: id)
                                .then((value) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                      backgroundColor: Colors.green,
                                      content: Text(
                                        "Data Send Successfully",
                                        style: TextStyle(color: Colors.white),
                                      )));
                              Navigator.pop(context);
                              setState(() {
                                fetchBrands();
                              });
                            });
                          },
                          child: Container(
                            height: 40.h,
                            width: MediaQuery.of(context).size.width / 3,
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(16.r)),
                            child: Center(
                                child: Text(
                              "Save Changes",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700),
                            )),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 40.h,
                            width: MediaQuery.of(context).size.width / 3,
                            decoration: BoxDecoration(
                                color: primaryColor,
                                // color: Colors.red,
                                borderRadius: BorderRadius.circular(16.r)),
                            child: Center(
                                child: Text(
                              "Cancel",
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            )),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    )
                  ],
                )));
      },
    );
  }
}
// Uint8List? imageData =
//     await branLogo?.readAsBytes();
// String base64Image = base64Encode(imageData!);
// dynamic test =   BrandApiAdmin().addBrand(brandNameController.text,
//       brandCountryController.text, base64Image);
// print(test);

// Map<String, dynamic> newBrand = {
//   "name": brandNameController.text,
//   "image": branLogo,
//   "country": brandCountryController.text
// };

// dynamic res =
//     await BrandApiAdmin().addBrand(brandNameController.text,brandCountryController.text,branLogo);
// print(res);
// print(res);
// if (res['success'] == true) {
//   print(res['success']);
// } else {
//   print(newBrand);
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       content: Text('Error: ${res['message']}'),
//       backgroundColor: Colors.red.shade300,
//     ),
//   );
// }
