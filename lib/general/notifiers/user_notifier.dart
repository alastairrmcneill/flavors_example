import 'package:flavors/general/models/models.dart';
import 'package:flutter/material.dart';

class UserNotifier extends ChangeNotifier {
  AppUser? _currentUser;

  AppUser? get currentUser => _currentUser;

  set setCurrentUser(AppUser? appUser) {
    _currentUser = appUser;
    notifyListeners();
  }
}
