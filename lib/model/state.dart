import 'package:firebase_auth/firebase_auth.dart';

///Application States model; Here we save User and Favorites items
class StateModel {
  bool isLoading;
  FirebaseUser user;
  List<String> favorites;

  StateModel({
    this.isLoading = false,
    this.user,
  });
}
