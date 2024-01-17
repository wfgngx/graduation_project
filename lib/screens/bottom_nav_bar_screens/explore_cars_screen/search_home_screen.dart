import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:graduation_project/utils/strings.dart';
import 'package:provider/provider.dart';

import '../../../Provider/FireBase/firebase_function.dart';
import '../../../api/view/car_api.dart';
import '../../../model/car_model.dart';
import '../../../utils/widgets/brand_container.dart';
import '../../model_details_screen.dart';

class SearchedScreen extends StatefulWidget {
  final String brandName;
  final String model;

  const SearchedScreen({Key? key, required this.brandName, required this.model})
      : super(key: key);

  @override
  State<SearchedScreen> createState() => _SearchedScreenState();
}

class _SearchedScreenState extends State<SearchedScreen> {
  List<CarModel> searchCars = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: FutureBuilder(
          future: CarApi().fetchSearchCars(
            brandName: widget.brandName,
            token: Provider.of<MyProvider>(context, listen: false)
                    .myToken
                    .isEmpty
                ? 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1haG1vdWR5b3Vzc2UyMjBAZ21haWwuY29tIiwiaWQiOiI2NTZkMjUwZGZmOGUyOGRmYzQzOWZmZTAiLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3MDMzMDg5NTN9.PdZeJaapalRJytDjIdFGLnz6RZbfUjT_LJE9eMeovRs'
                : Provider.of<MyProvider>(context, listen: false).myToken,
            search: widget.model,
            // sort:defaultItemDropDown.toLowerCase()
          ),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return AnimationLimiter(
                  child: ListView.builder(
                      itemCount: searchCars.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) =>
                          AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 375),
                              child: SlideAnimation(
                                  duration: const Duration(seconds: 2),
                                  verticalOffset: 50.0,
                                  child: FadeInAnimation(
                                      child: InkWell(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return ModelDetailsScreen(
                                            productionYears: searchCars[index]
                                                .yearsOfProduction,
                                            listImage:
                                                searchCars[index].listImage,
                                            carModel: searchCars[index],
                                          );
                                        },
                                      ));
                                    },
                                    child: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: ModelContainer(
                                            // fuel:
                                            //     "${myCars[index].fuel.substring(0, 1)}...",
                                            fuel: searchCars[index].fuel,
                                            brandImage: brandEqual[widget.brandName].logo,
                                            // brandImage: brandEqual[
                                            //     myCars[index].brandId],
                                            speed: searchCars[index].topSpeed,
                                            image:
                                                searchCars[index].listImage[0],
                                            model: searchCars[index].name,
                                            price: searchCars[index]
                                                .avgPrice
                                                .toString())),
                                  ))))));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(
                color: Colors.white,
              );
            } else {
              // return shimmerContainer();
              return const CircularProgressIndicator(
                color: Colors.white,
              );
            }
          },
        ),
      ),
    );
  }
}
