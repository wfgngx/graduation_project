import 'package:flutter/material.dart';

import '../../utils/colors/app_colors.dart';

class EditCar extends StatefulWidget {
  const EditCar({Key? key}) : super(key: key);

  @override
  State<EditCar> createState() => _EditCarState();
}

class _EditCarState extends State<EditCar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        backgroundColor: secondaryColor,
        title: const Text(
          "Add a new car",
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: primaryColor,
      body: Column(
        children: [
          SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width / 2 - 20,
            child: TextFormField(
              // controller: price,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(color: Colors.white)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                hintText: "Enter car Price",
                hintStyle: TextStyle(color: Colors.black38, fontSize: 16),
              ),
            ),
          ),
          SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width / 2 - 20,
            child: TextFormField(
              // controller: distance,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(color: Colors.white)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                hintText: "Enter car Distance",
                hintStyle: TextStyle(color: Colors.black38, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// {
// print('Edit');
// await UserApis()
//     .editCarUser(
// carModel: 'Edit car',
// carBrandName: 'Test',
// carCity: 'cairo',
// // image: ,
// carDescription: 'test',
// carDistance: '55',
// carDuration: '55',
// carFuel: '55',
// carLocation: 'fewfwe',
// carPrice: '444444',
// carTransmission: '555',
// modelYear: '2002',
// type: 'sell',
// id: id,
// userPhone: '0120415777',
// token: Provider.of<MyProvider>(context,
// listen: false)
//     .myToken
//     .isEmpty
// ? 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1haG1vdWR5b3Vzc2UyMjBAZ21haWwuY29tIiwiaWQiOiI2NTZkMjUwZGZmOGUyOGRmYzQzOWZmZTAiLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3MDMzMDg5NTN9.PdZeJaapalRJytDjIdFGLnz6RZbfUjT_LJE9eMeovRs'
//     : Provider.of<MyProvider>(context,
// listen: false)
//     .myToken)
//     .then((value) {
// ScaffoldMessenger.of(context)
//     .showSnackBar(const SnackBar(
// backgroundColor: Colors.green,
// content: Text(
// "Data Send Successfully",
// style: TextStyle(color: Colors.white),
// )));
// Navigator.pop(context);
// setState(() {
// getCars();
// });
// });
// },
