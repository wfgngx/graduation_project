import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/api/user/user_apis.dart';
import 'package:graduation_project/screens/user_cars/rent_sell_a_car.dart';
import 'package:graduation_project/screens/user_cars/users_cars_details.dart';
import 'package:graduation_project/utils/colors/app_colors.dart';
import 'package:provider/provider.dart';
import '../../Provider/FireBase/firebase_function.dart';
import '../../model/user_cars.dart';
import '../../utils/widgets/brand_container.dart';

class UserCarsScreen extends StatefulWidget {
  UserCarsScreen({Key? key}) : super(key: key);

  @override
  State<UserCarsScreen> createState() => _UserCarsScreenState();
  TextEditingController newPrice = TextEditingController();
  TextEditingController newDistance = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
}

class _UserCarsScreenState extends State<UserCarsScreen> {
  List<UserCars> cars = [];
  String actualCity = 'City';

  final List<String> mohafazat = [
    'Alexandria',
    'Assiut',
    'Aswan',
    'Beheira',
    'Bani Suef',
    'Daqahliya',
    'Damietta',
    'Fayyoum',
    'Gharbiya',
    'Giza',
    'Cairo'
  ];
  TextEditingController newDuration = TextEditingController();
  TextEditingController newPrice = TextEditingController();

  @override
  void initState() {
    super.initState();
    getCars();
  }

  void getCars() async {
    print(
        'My token is ${Provider.of<MyProvider>(context, listen: false).myToken}');
    List<UserCars> test = await UserApis().getPrivateCars(
        Provider.of<MyProvider>(context, listen: false).myToken);
    setState(() {
      cars = test;
    });
    // print(
    //     'My token is ${Provider.of<MyProvider>(context, listen: false).myToken}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          foregroundColor: Colors.white,
          backgroundColor: secondaryColor,
          title: const Text(
            "Your Cars",
            style: TextStyle(color: Colors.white),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: secondaryColor,
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RentOrSell(),
                  ));
            }),
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: cars.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 150,
                      ),
                      Image.asset("assets/images/bmw_model.png"),
                      Text(
                        'There are no cars yet!',
                        style: GoogleFonts.inter(
                            fontSize: 26,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  )
                :
                // SizedBox(
                //     height: 500,
                //     child: Padding(
                //         padding: const EdgeInsets.all(8),
                //         child: Column(children: [
                //           const Spacer(),
                //           const Text(
                //             'Add a Car',
                //             style: TextStyle(
                //                 letterSpacing: 3,
                //                 color: Colors.white,
                //                 fontSize: 24,
                //                 fontWeight: FontWeight.bold),
                //           ),
                //           SizedBox(
                //             height: 16.h,
                //           ),
                //           InkWell(
                //               onTap: () => Navigator.push(
                //                   context,
                //                   MaterialPageRoute(
                //                     builder: (context) => const AddNewCar(
                //                       rent: false,
                //                     ),
                //                   )),
                //               child: Stack(
                //                 children: [
                //                   ClipRRect(
                //                       borderRadius: BorderRadius.circular(32),
                //                       child: FadeInImage(
                //                           fit: BoxFit.cover,
                //                           height: 200,
                //                           width: double.infinity,
                //                           placeholder:
                //                               MemoryImage(kTransparentImage),
                //                           image: const AssetImage(
                //                               "assets/images/buy_a_car.jpg"))),
                //                   Positioned(
                //                       bottom: 0,
                //                       right: 0,
                //                       left: 0,
                //                       child: Container(
                //                           decoration: const BoxDecoration(
                //                             borderRadius: BorderRadius.only(
                //                                 bottomLeft: Radius.circular(32),
                //                                 bottomRight:
                //                                     Radius.circular(32)),
                //                             // borderRadius: BorderRadius.circular(32),
                //                             color: Colors.black54,
                //                           ),
                //                           padding: EdgeInsets.symmetric(
                //                               vertical: 10.h, horizontal: 44.w),
                //                           child: const Column(children: [
                //                             Text(
                //                               ("Sell a Car"),
                //                               maxLines: 2,
                //                               // softWrap: true,
                //                               textAlign: TextAlign.center,
                //                               overflow: TextOverflow.ellipsis,
                //                               style: TextStyle(
                //                                   fontSize: 20,
                //                                   fontWeight: FontWeight.bold,
                //                                   color: Colors.white),
                //                             ),
                //                           ]))),
                //                 ],
                //               )),
                //           SizedBox(
                //             height: 30.h,
                //           ),
                //           InkWell(
                //               onTap: () => Navigator.push(
                //                   context,
                //                   MaterialPageRoute(
                //                     builder: (context) => const AddNewCar(
                //                       rent: true,
                //                     ),
                //                   )),
                //               child: Stack(
                //                 children: [
                //                   ClipRRect(
                //                       borderRadius: BorderRadius.circular(32),
                //                       child: FadeInImage(
                //                           fit: BoxFit.cover,
                //                           height: 200,
                //                           width: double.infinity,
                //                           placeholder:
                //                               MemoryImage(kTransparentImage),
                //                           image: const AssetImage(
                //                               "assets/images/rent_a_car.jpg"))),
                //                   Positioned(
                //                       bottom: 0,
                //                       right: 0,
                //                       left: 0,
                //                       child: Container(
                //                           decoration: const BoxDecoration(
                //                             borderRadius: BorderRadius.only(
                //                                 bottomLeft: Radius.circular(32),
                //                                 bottomRight:
                //                                     Radius.circular(32)),
                //                             color: Colors.black54,
                //                           ),
                //                           padding: EdgeInsets.symmetric(
                //                               vertical: 10.h, horizontal: 44.w),
                //                           child: const Column(children: [
                //                             Text(
                //                               ("For Rent"),
                //                               maxLines: 2,
                //                               // softWrap: true,
                //                               textAlign: TextAlign.center,
                //                               overflow: TextOverflow.ellipsis,
                //                               style: TextStyle(
                //                                   fontSize: 20,
                //                                   fontWeight: FontWeight.bold,
                //                                   color: Colors.white),
                //                             ),
                //                           ]))),
                //                 ],
                //               )),
                //           const Spacer(),
                //         ])))
                // :
                ListView.builder(
                    itemCount: cars.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => InkWell(
                        onLongPress: () => _showAlertDialog(cars[index].id),
                        child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => UserCarDetails(
                                        imageList: cars[index].images,
                                        userCars: cars[index],
                                        rent: false),
                                  ));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: ModelContainer(
                                  brandBool: false,
                                  fuel: cars[index].fuel,
                                  speed: '250 km/h',
                                  image: cars[index].images.isNotEmpty
                                      ? cars[index].images[0].secureUrl
                                      : '',
                                  model: cars[index].name,
                                  brandImage: 'assets/images/bmw_model.png',
                                  price: cars[index].price.toString()),
                            )))),
          ),
        ));
  }

  Future<void> _showAlertDialog(String id) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          // title: Text(modelName),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Edit',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                editeCarBottomSheet(context, id);
                // Navigator.push(context, MaterialPageRoute(builder: (context) => EditCar(),))l
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
                await UserApis()
                    .deleteCar(
                        id,
                        Provider.of<MyProvider>(context, listen: false)
                                .myToken
                                .isEmpty
                            ? 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1haG1vdWR5b3Vzc2UyMjBAZ21haWwuY29tIiwiaWQiOiI2NTZkMjUwZGZmOGUyOGRmYzQzOWZmZTAiLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3MDMzMDg5NTN9.PdZeJaapalRJytDjIdFGLnz6RZbfUjT_LJE9eMeovRs'
                            : Provider.of<MyProvider>(context, listen: false)
                                .myToken)
                    .then((value) {
                  setState(() {
                    getCars();
                  });
                  Navigator.pop(context);
                  // print(id);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Car Deleted Successfully")));
                  // // Navigator.pop(context);
                  //
                  // setState(() {
                  //   getCars();
                  // });
                  // Navigator.pop(context);
                });
                // await BrandApiAdmin().deleteBrand(id).then((value) {
                //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                //       backgroundColor: Colors.red,
                //       content: Text(
                //         "Brand Deleted Successfully",
                //         style: TextStyle(color: Colors.white),
                //       )));
                //   Navigator.pop(context);
                //   setState(() {
                //   });
                // });
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> editeCarBottomSheet(
    BuildContext context,
    String id,
    // String newDuration,
    // String newPrice,
  ) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
                color: secondaryColor,
                child: Form(
                    key: widget._key,
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
                                  "Edit Car",
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )))),
                        SizedBox(
                          height: 30.h,
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 12.w),
                            child: Align(
                                alignment: AlignmentDirectional.topStart,
                                child: Text(
                                  'Price',
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
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "please enter a valid value";
                              }
                              return null; // Return null if the validation passes
                            },
                            controller: widget.newPrice,
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              setState(() {});
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
                        const SizedBox(
                          height: 16,
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 12.w),
                            child: Align(
                                alignment: AlignmentDirectional.topStart,
                                child: Text(
                                  'Distance',
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
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "please enter a valid value";
                              }
                              return null; // Return null if the validation passes
                            },
                            keyboardType: TextInputType.number,
                            controller: widget.newDistance,
                            onChanged: (value) {
                              setState(() {
                                // brandCountryControllerEdit.text = value;
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
                                Map<String, dynamic> myRes = await UserApis()
                                    .editCarUser(
                                        carDistance: widget.newDistance.text,
                                        carPrice: widget.newPrice.text,
                                        id: id,
                                        token: Provider.of<MyProvider>(context,
                                                    listen: false)
                                                .myToken
                                                .isEmpty
                                            ? 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1haG1vdWR5b3Vzc2UyMjBAZ21haWwuY29tIiwiaWQiOiI2NTZkMjUwZGZmOGUyOGRmYzQzOWZmZTAiLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3MDMzMDg5NTN9.PdZeJaapalRJytDjIdFGLnz6RZbfUjT_LJE9eMeovRs'
                                            : Provider.of<MyProvider>(context,
                                                    listen: false)
                                                .myToken);
                                //     .then((value) {
                                //   ScaffoldMessenger.of(context)
                                //       .showSnackBar(const SnackBar(
                                //           backgroundColor: Colors.green,
                                //           content: Text(
                                //             "Data Send Successfully",
                                //             style:
                                //                 TextStyle(color: Colors.white),
                                //           )));
                                //   Navigator.pop(context);
                                //   setState(() {
                                //     getCars();
                                //   });
                                // });
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
                        SizedBox(height: 12.h)
                      ],
                    ))));
      },
    );
  }
  //
}
