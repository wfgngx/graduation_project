import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/Provider/FireBase/firebase_function.dart';
import 'package:graduation_project/model/car_model.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  Future<List<CarModel>>? _fetchFavouriteCars;

 // @override
  // void initState() {
  //   super.initState();
  //   _fetchFavouriteCars =
  //       Provider.of<MyProvider>(context, listen: false).fetchFavouriteCars();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Favorite Cars"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              FutureBuilder<List<CarModel>>(
                future: _fetchFavouriteCars,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasData) {
                    final markedArticles = snapshot.data;
                    return showAllMarkedArticles(markedArticles!);
                  } else {
                    return const Text('No Data');
                  }
                },
              ),
            ],
          ),
        ));
  }

  Widget showAllMarkedArticles(List<CarModel> markedArticles) {
    final provider = Provider.of<MyProvider>(context);
    return markedArticles.isEmpty
        ? Center(
            child: Text(
              "There are no favourites yet...",
              style: GoogleFonts.abel(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          )
        : Expanded(
            child: ListView.separated(
              itemCount: markedArticles.length,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  thickness: 1,
                  height: 1,
                  color: Colors.grey,
                  indent: 15,
                  endIndent: 15,
                );
              },
              itemBuilder: (context, index) {
                return GestureDetector(
                  onLongPress: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text(
                          "Delete this article?",
                          style: TextStyle(fontSize: 18),
                        ),
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TextButton(
                                  style: const ButtonStyle(
                                      backgroundColor:
                                          MaterialStatePropertyAll(Colors.red)),
                                  onPressed: () async {
                                    // setState(() async {
                                    //   await provider.deleteUser(index: index);
                                    //   Navigator.pop(context);
                                    //   ScaffoldMessenger.of(context)
                                    //       .showSnackBar(const SnackBar(
                                    //           backgroundColor: Colors.red,
                                    //           duration: Duration(seconds: 2),
                                    //           content: Text(
                                    //             'Article Deleted',
                                    //             style: TextStyle(color: Colors.white),
                                    //           )));
                                    // });
                                  },
                                  child: const Text(
                                    'Yes',
                                    // style: TextStyle(
                                    //     color: CupertinoColors.white, fontSize: 18),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18),
                                  ))
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  child: trendingBodyItems(markedArticles[index], context),
                );
              },
            ),
          );
  }

  Widget trendingBodyItems(CarModel carModel, BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
        padding: const EdgeInsets.only(bottom: 14, top: 14),
        child: GestureDetector(
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   return ArticleDetails(articleModel: articleModel);
              // }));
            },
            child: Column(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: FadeInImage(
                        width: double.infinity,
                        fit: BoxFit.contain,
                        placeholder: MemoryImage(kTransparentImage),
                        image: NetworkImage(carModel.img))),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  carModel.name,
                  style: GoogleFonts.libreBaskerville(
                    fontSize: 18,
                    // color: provider.themeMode == ThemeMode.light
                    //     ? Colors.black
                    //     : Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        // Icon(
                        //   Icons.border_color_outlined,
                        //   color: provider.themeMode == ThemeMode.light
                        //       ? Colors.black
                        //       : Colors.white,
                        //   size: 12,
                        // ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          carModel.length,
                          style: TextStyle(),
                        ),
                      ],
                    ),
                    // Row(
                    //   children: [
                    //     Icon(
                    //       Icons.timer_sharp,
                    //       color: provider.themeMode == ThemeMode.light
                    //           ? Colors.black
                    //           : Colors.white,
                    //       size: 12,
                    //     ),
                    //     const SizedBox(
                    //       width: 5,
                    //     ),
                    //     Text(
                    //       articleModel.publishedAt.substring(0, 10),
                    //       style: TextStyle(
                    //         color: provider.themeMode == ThemeMode.light
                    //             ? Colors.black
                    //             : Colors.white,
                    //       ),
                    //     )
                    //   ],
                    // )
                  ],
                ),
              ],
            )));
  }
}
