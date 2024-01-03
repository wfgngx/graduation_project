import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/screens/splash.dart';
import 'package:provider/provider.dart';
import 'Provider/FireBase/firebase_function.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Hive.initFlutter();
  // Hive.registerAdapter(CarModelAdapter());
  // await Hive.openBox<CarModel>('favourite_cars');

  runApp(ChangeNotifierProvider<MyProvider>(
      create: (context) {
        final provider = MyProvider();
        return provider;
      },
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //bool authProvider() {
    //   var provider = Provider.of<MyProvider>(context, listen: false);
    //   return provider.isLogged; // Ensure that isLogged is not null
    // }
    //
    // bool onboardingProvider() {
    //   var provider = Provider.of<MyProvider>(context, listen: false);
    //   return provider.isOnBoard; // Ensure that isOnBoard is not null
    // }

    // Widget whichScreen() {
    //   var provider = Provider.of<MyProvider>(context);
    //   print(authProvider());
    //   print(onboardingProvider());
    //
    //   if (authProvider()) {
    //     return BottomNavBar();
    //   } else {
    //     if (onboardingProvider()) {
    //       return const LogInScreen();
    //     } else {
    //       return const OnBoardingScreen();
    //     }
    //   }
    // }

    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
              // theme: ThemeData(
              //     pageTransitionsTheme: PageTransitionsTheme(
              //   builders: <TargetPlatform, PageTransitionsBuilder>{
              //     TargetPlatform.android: ZoomPageTransitionsBuilder(),
              //   },
              // )),
              // theme: ThemeData.from(
              //   colorScheme: const ColorScheme.light(),
              // ).copyWith(
              //   pageTransitionsTheme: const PageTransitionsTheme(
              //     builders: <TargetPlatform, PageTransitionsBuilder>{
              //       TargetPlatform.android: ZoomPageTransitionsBuilder(),
              //     },
              //   ),
              //   ),
              debugShowCheckedModeBanner: false,
              home: SplashScreen());
        });
  }
}
//   MaterialApp(
//   home: Consumer<MyProvider>(
//     builder: (context, authProvider, child) {
//       if (authProvider.isLoggedIn) {
//         return BottomNavBar();
//       } else {
//         return Consumer<MyProvider>(
//           builder: (context, onboardingProvider, child) {
//             if (onboardingProvider.showOnboarding) {
//               return OnBoardingScreen(
//                 onboardingCompletedCallback: () {
//                   onboardingProvider.setOnboardingShown();
//                 },
//               );
//             } else {
//               return OnBoardingScreen(
//                   onboardingCompletedCallback: () {
//                 provider.setOnboardingShown();
//               });
//             }
//           },
//         );
//       }
//     },
//   ),
// );
