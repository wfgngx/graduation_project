import 'package:flutter/material.dart';
import 'package:graduation_project/model/car_model.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProvider extends ChangeNotifier {
  Map<String, dynamic> profileData = {};
  List<CarModel> favouriteCars = [];
  String email = '';
  String password = '';
  String myToken = '';
  String picture = '';
  void setToken(String token) {
    myToken = token;
    notifyListeners();
  }

  setTokenShared() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", myToken);
    notifyListeners();
  }

  void getProfileData(Map<String, dynamic> data) {
    profileData = data;
    notifyListeners();
  }

  // addFavouriteCar(CarModel carModel) async {
  //   var favouriteBox = Hive.box<CarModel>('favourite_cars');
  //   await favouriteBox.add(carModel);
  //   notifyListeners();
  // }

  // Future<List<CarModel>> fetchFavouriteCars() async {
  //   var articleBox = Hive.box<CarModel>('favourite_cars');
  //   favouriteCars = articleBox.values.toList();
  //   notifyListeners();
  //   return favouriteCars;
  // }

  setAuthState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLoggedIn", true);
    notifyListeners();
  }

  setAdminState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("admin", true);
    notifyListeners();
  }

  setOnBoardState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isWelcomed", true);
    notifyListeners();
  }

  setEmail(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("email", email);
    notifyListeners();
  }

  setProfilePicture(String picture) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("picture", picture);
    notifyListeners();
  }

  setPassword(String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("password", password);
    notifyListeners();
  }
}
// bool _isLogged = false;
//
// bool get isLogged => _isLogged;
//
// authProvider() {
//   // Initialize the login state from SharedPreferences on app startup
//   _loadLoginState();
// }
//
// Future<void> _loadLoginState() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   _isLogged = prefs.getBool('isLogged') ?? false;
//   notifyListeners();
// }
//
// Future<void> login() async {
//   _isLogged = true;
//   notifyListeners();
//
//   // Save login state to SharedPreferences
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   await prefs.setBool('isLogged', true);
// }
//
// Future<void> logout() async {
//   _isLogged = false;
//   notifyListeners();
//
//   // Save login state to SharedPreferences
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   await prefs.setBool('isLogged', false);
// }
//
// bool _isOnBoard = false;
//
// bool get isOnBoard => _isOnBoard;
//
// OnboardingProvider() {
//   // Initialize the onboarding state from SharedPreferences on app startup
//   _loadOnboardingState();
// }
//
// Future<void> _loadOnboardingState() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   _isOnBoard = prefs.getBool('isOnBoard') ?? true;
//   notifyListeners();
// }

// Future<void> setOnboardingShown() async {
//   _isOnBoard = false;
//   notifyListeners();
//
//   // Save onboarding state to SharedPreferences
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   await prefs.setBool('isOnBoard', false);
// }
// bool _isLoggedIn = false;
//
// bool get isLoggedIn => _isLoggedIn;
//
// void login() {
//   _isLoggedIn = true;
//   notifyListeners();
// }
//
// void logout() {
//   _isLoggedIn = false;
//   notifyListeners();
