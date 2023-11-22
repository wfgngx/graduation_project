import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/screens/model_details_screen.dart';
import 'package:graduation_project/screens/models.dart';

import '../../utils/widgets/brand_container.dart';
import '../../utils/widgets/company_container.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _searchController = TextEditingController();

  final List<String> carLogos = [
    'assets/images/bmw_prev_ui.png',
    'assets/images/mercedes_prev_ui.png',
    'assets/images/nissan_prev_ui.png',
    'assets/images/toyota_prev_ui.png'
  ];

  final List<String> dropDownListItems = [
    'Recent Cars',
    'Top Rated',
    'Most Popular'
  ];

  final List<String> brandsNameDropDown = [
    'BMW',
    'MERCEDES',
    'NISSAN',
    'TOYOTA'
  ];

  String defaultItemDropDown = "Recent Cars";

  final List<String> companyName = ['BMW', 'MERCEDES', 'NISSAN', 'TOYOTA'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBar(
              controller: _searchController,
              surfaceTintColor: const MaterialStatePropertyAll(Colors.white),
              leading: const Icon(Icons.search),
              hintText: 'Search',
              hintStyle:
                  const MaterialStatePropertyAll(TextStyle(fontSize: 18)),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
              onChanged: (query) {},
            ),
            SizedBox(
              height: 6.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Brands',
                  style: TextStyle(color: Colors.white, fontSize: 22.sp),
                ),
                DropdownButton(
                  elevation: 0,
                  iconSize: 32,
                  hint: Text(defaultItemDropDown),
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                  items: brandsNameDropDown.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      defaultItemDropDown = newValue!;
                    });
                  },
                )
              ],
            ),
            SizedBox(
              height: 6.h,
            ),
            Row(
              children: [
                // SizedBox(
                //     // height: 105,
                //     width: 30,
                //     child: Column(
                //       children: [
                //         ElevatedButton(onPressed: () {}, child: const Text("Test")),
                //         IconButton(onPressed: () {}, icon: const Icon(Icons.speed))
                //       ],
                //     )),
                Expanded(
                    child: SizedBox(
                        height: 105,
                        // width: 300,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: carLogos.length,
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return ModelsScreen();
                                      },
                                    ));
                                  },
                                  child: CompanyContainer(
                                      img: carLogos[index],
                                      brandName: companyName[index]),
                                ));
                          },
                        ))),
              ],
            ),
            SizedBox(
              height: 12.h,
            ),
            Divider(
              color: Colors.white,
              height: 1.h,
              indent: 20.w,
              endIndent: 20.w,
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  defaultItemDropDown,
                  style: TextStyle(color: Colors.white, fontSize: 22.sp),
                ),
                DropdownButton(
                  underline: const Divider(
                    color: Colors.transparent,
                  ),
                  elevation: 0,
                  iconSize: 32,
                  hint: Text(defaultItemDropDown),
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                  // value: defaultItemDropDown,
                  items: dropDownListItems.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      defaultItemDropDown = newValue!;
                    });
                  },
                )
              ],
            ),
            const SizedBox(
              height: 10,
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
    );
  }
}
