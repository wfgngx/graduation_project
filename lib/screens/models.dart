import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/utils/colors/app_colors.dart';
import '../utils/widgets/brand_container.dart';
import 'model_details_screen.dart';

class ModelsScreen extends StatelessWidget {
  ModelsScreen({Key? key}) : super(key: key);
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              children: [
                SizedBox(
                  height: 40.h,
                ),
                SearchBar(
                  controller: _searchController,
                  surfaceTintColor:
                      const MaterialStatePropertyAll(Colors.white),
                  leading: const Icon(Icons.search),
                  hintText: 'Search',
                  hintStyle:
                      const MaterialStatePropertyAll(TextStyle(fontSize: 18)),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
                  onChanged: (query) {},
                ),
                ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const ModelDetailsScreen();
                              },
                            ));
                          },
                          child: const Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: ModelContainer()),
                        ))
              ],
            ),
          ),
        ));
    // return Scaffold(
    //     appBar: AppBar(
    //       foregroundColor: Colors.white,
    //       backgroundColor: Colors.transparent,
    //       elevation: 0,
    //       title: const Text(
    //         "BMW Models",
    //         style: TextStyle(color: Colors.white),
    //       ),
    //     ),
    //     backgroundColor: const Color.fromRGBO(39, 55, 77, 1.0),
    //     body: Column(
    //       children: [
    //         SearchBar(
    //           controller: _searchController,
    //           surfaceTintColor: const MaterialStatePropertyAll(Colors.white),
    //           leading: const Icon(Icons.search),
    //           hintText: 'Search',
    //           hintStyle:
    //               const MaterialStatePropertyAll(TextStyle(fontSize: 18)),
    //           shape: MaterialStatePropertyAll(RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(8))),
    //           onChanged: (query) {},
    //         ),
    //         ListView.builder(
    //             itemCount: 10,
    //             shrinkWrap: true,
    //             // physics: const NeverScrollableScrollPhysics(),
    //             itemBuilder: (context, index) => InkWell(
    //                   onTap: () {
    //                     Navigator.push(context, MaterialPageRoute(
    //                       builder: (context) {
    //                         return const ModelDetailsScreen();
    //                       },
    //                     ));
    //                   },
    //                   child: const Padding(
    //                       padding: EdgeInsets.all(12), child: ModelContainer()),
    //                 ))
    //       ],
    //     ));
  }
}
