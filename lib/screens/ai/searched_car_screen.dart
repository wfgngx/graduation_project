import 'package:flutter/material.dart';
import 'package:graduation_project/utils/colors/app_colors.dart';
import 'package:provider/provider.dart';
import '../../Provider/FireBase/firebase_function.dart';
import '../../api/view/car_api.dart';
import '../../model/car_model.dart';
import '../../utils/widgets/brand_container.dart';
import '../model_details_screen.dart';

class SearchedCarScreen extends StatefulWidget {
  const SearchedCarScreen(
      {Key? key, required this.carSearched, required this.brand})
      : super(key: key);

  @override
  State<SearchedCarScreen> createState() => _SearchedCarScreenState();
  final String carSearched;
  final String brand;
}

class _SearchedCarScreenState extends State<SearchedCarScreen> {
  List<CarModel> myCars = [];
  @override
  void initState() {
    super.initState();
    fetchSearchCar();
  }

  void fetchSearchCar() async {
    List<CarModel> carData = await CarApi().fetchSearchCars(
        brandName: widget.brand,
        token: Provider.of<MyProvider>(context, listen: false).myToken.isEmpty
            ? 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1haG1vdWR5b3Vzc2UyMjBAZ21haWwuY29tIiwiaWQiOiI2NTZkMjUwZGZmOGUyOGRmYzQzOWZmZTAiLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3MDMzMDg5NTN9.PdZeJaapalRJytDjIdFGLnz6RZbfUjT_LJE9eMeovRs'
            : Provider.of<MyProvider>(context, listen: false).myToken,
        search: widget.carSearched);
    setState(() {
      myCars = carData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: myCars.isEmpty
          ? const Center(
              child: Text(
                "No Cars Found !",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            )
          : ListView.builder(
              itemCount: myCars.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return ModelDetailsScreen(
                          productionYears: myCars[index].yearsOfProduction,
                          listImage: myCars[index].listImage,
                          carModel: myCars[index],
                        );
                      },
                    ));
                  },
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ModelContainer(
                          brandBool: false,
                          fuel: myCars[index].fuel,
                          brandImage: '',
                          speed: myCars[index].topSpeed,
                          image: myCars[index].listImage[0],
                          model: myCars[index].name,
                          price: myCars[index].avgPrice.toString())),
                );
              }),
    );
  }
}
