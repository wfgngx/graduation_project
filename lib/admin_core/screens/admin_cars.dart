import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/admin_core/network/car_apis.dart';
import 'package:graduation_project/admin_core/screens/add_car_screen.dart';
import 'package:graduation_project/utils/colors/app_colors.dart';
import 'package:provider/provider.dart';
import '../../Provider/FireBase/firebase_function.dart';
import '../../api/view/car_api.dart';
import '../../model/car_model.dart';
import '../widgets/models_list_view.dart';

class AdminModelsScreen extends StatefulWidget {
  const AdminModelsScreen({
    Key? key,
    required this.brandName,
  }) : super(key: key);
  final String brandName;

  @override
  State<AdminModelsScreen> createState() => _AdminModelsScreenState();
}

class _AdminModelsScreenState extends State<AdminModelsScreen> {
  final List<String> dropDownListItems = ['Date', 'Price', 'Sales'];
  String defaultItemDropDown = "Sales";
  final TextEditingController carNameController = TextEditingController();
  final TextEditingController carPriceController = TextEditingController();
  int limit = 5;
  int offset = 0;
  bool isFirstLoadRunning = false;

  @override
  void initState() {
    super.initState();
    fetchCars();
  }

  List<CarModel> myCars = [];

  void fetchCars() async {
    setState(() {
      isFirstLoadRunning = true;
    });

    List<CarModel> carData = await CarApi().fetchCars(
        limit: limit,
        offset: offset,
        brand: widget.brandName,
        sort: defaultItemDropDown.toLowerCase(),
        token: Provider.of<MyProvider>(context, listen: false).myToken.isEmpty
            ? 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1haG1vdWR5b3Vzc2UyMjBAZ21haWwuY29tIiwiaWQiOiI2NTZkMjUwZGZmOGUyOGRmYzQzOWZmZTAiLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3MDMzMDg5NTN9.PdZeJaapalRJytDjIdFGLnz6RZbfUjT_LJE9eMeovRs'
            : Provider.of<MyProvider>(context, listen: false).myToken);
    setState(() {
      myCars = carData;
      isFirstLoadRunning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Padding(
            padding: const EdgeInsets.all(16),
            child: FloatingActionButton(
              backgroundColor: primaryColor,
              foregroundColor: Colors.white,
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddCarScreen(),
                        ));
                  },
                  icon: const Icon(Icons.add)),
              onPressed: () {},
            )),
        appBar: AppBar(
          actions: [
            Padding(
                padding: const EdgeInsets.only(right: 12),
                child: DropdownButton(
                  elevation: 0,
                  iconSize: 32,
                  hint: Text(
                    defaultItemDropDown,
                    style: const TextStyle(color: Colors.white),
                  ),
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                    size: 14,
                  ),
                  items: dropDownListItems.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      defaultItemDropDown = newValue!;
                      fetchCars();
                    });
                  },
                ))
          ],
          foregroundColor: Colors.white,
          backgroundColor: secondaryColor,
          title: Text(
            widget.brandName,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              children: [
                SizedBox(
                  height: 12.h,
                ),
                // SearchBar(
                //   controller: _searchController,
                //   surfaceTintColor:
                //       const MaterialStatePropertyAll(Colors.white),
                //   leading: const Icon(Icons.search),
                //   hintText: 'Search',
                //   hintStyle:
                //       const MaterialStatePropertyAll(TextStyle(fontSize: 18)),
                //   shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(8))),
                //   onChanged: (query) async{
                //     List<CarModel> carData = await CarApi().fetchCars(
                //         limit: limit,
                //         offset: offset,
                //         brand: query,
                //         sort: defaultItemDropDown.toLowerCase());
                //   },
                // ),
                // SizedBox(
                //   height: 12.h,
                // ),
                isFirstLoadRunning
                    ? const Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      )
                    : ListView.builder(
                        itemCount: limit,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => GestureDetector(
                            onLongPress: () {
                              _showAlertDialog(
                                  myCars[index].id,
                                  myCars[index].name,
                                  myCars[index].avgPrice.toString());
                            },
                            child: ModelListView(
                              modelName: myCars[index].name,
                              carModel: myCars[index],
                            ))),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(
                      child: InkWell(
                    onTap: () {
                      print("احمد ياسين قموصه");
                      setState(() {
                        limit += 1;
                        offset = 0;
                      });
                      fetchCars();
                    },
                    child: const Text(
                      "See more",
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                )
                // InkWell(
                //   onTap: () {
                //     Navigator.push(context, MaterialPageRoute(
                //       builder: (context) {
                //         return ModelListView(
                //             modelName: myCars[index].name);
                //       },
                //     ));
                //   },
                // ))
              ],
            ),
          ),
        ));
  }

  Future<void> _showAlertDialog(String id, String carName, String price) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(carName),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Edit',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                showBottomSheetFun(context, price, id, carName);
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
                var response = await AdminCarsApi().deleteCar(id).then((value) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(
                        'Car Deleted Successfully',
                        style: TextStyle(color: Colors.white),
                      )));
                  setState(() {
                    fetchCars();
                  });

                  Navigator.pop(context);
                });
                // print(id);
                // print(response.body);
                // print(response.body);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> showBottomSheetFun(
      BuildContext context, String oldPrice, String id, String carName) {
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
                    Padding(
                        padding: EdgeInsets.only(left: 12.w),
                        child: Align(
                            alignment: AlignmentDirectional.topStart,
                            child: Text(
                              'Car Name',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp),
                            ))),
                    SizedBox(
                      height: 16.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12.w, right: 12.w),
                      child: TextField(
                        controller: carNameController,
                        onSubmitted: (value) {
                          setState(() {});
                        },
                        decoration: InputDecoration(
                            hintText: carName,
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
                        padding: EdgeInsets.only(left: 12.w),
                        child: Align(
                            alignment: AlignmentDirectional.topStart,
                            child: Text(
                              'Car Price',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp),
                            ))),
                    SizedBox(
                      height: 16.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12.w, right: 12.w),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: carPriceController,
                        onSubmitted: (value) {
                          setState(() {});
                        },
                        decoration: InputDecoration(
                            hintText: oldPrice.toString(),
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
                            await AdminCarsApi()
                                .editCar(
                                    name: carNameController.text,
                                    price: carPriceController.text,
                                    id: id)
                                .then((value) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      backgroundColor: Colors.green,
                                      content:
                                          Text("Car Updated Successfully")));
                              setState(() {
                                fetchCars();
                                Navigator.pop(context);
                                Navigator.pop(context);
                              });
                            });
                            // BrandApiAdmin().editCar(
                            //     name: brandNameControllerEdit.text,
                            //     country: brandCountryControllerEdit.text,
                            //     image: brandLogoEdit,
                            //     id: id);
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
