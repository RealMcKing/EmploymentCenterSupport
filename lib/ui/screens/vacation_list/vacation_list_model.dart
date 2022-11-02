import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:ecs/ui/navigation/main_navigation.dart';

class VacationListViewModel extends ChangeNotifier {
  final searchController = TextEditingController();
  bool _isSorted = true;
  Stream<QuerySnapshot<Map<String, dynamic>>> _querySnapshot = FirebaseFirestore
      .instance
      .collection('works')
      .orderBy('name', descending: true)
      .snapshots();

  bool get isSorted => _isSorted;

  Stream<QuerySnapshot<Map<String, dynamic>>> get querySnapshot =>
      _querySnapshot;

  void createVacation(BuildContext context) {
    Navigator.pushNamed(context, MainNavigationRouteNames.createVacationScreen);
  }

  void reverseSorted() {
    _isSorted = !_isSorted;
    _querySnapshot = FirebaseFirestore.instance
        .collection('works')
        .orderBy('name', descending: _isSorted)
        .snapshots();
    notifyListeners();
  }

  void setQuery() {
    String query = searchController.text;
    if (query.isEmpty) {
      _querySnapshot = FirebaseFirestore.instance
          .collection('works')
          .orderBy('name', descending: _isSorted)
          .snapshots();
    } else {
      _querySnapshot = FirebaseFirestore.instance
          .collection('works')
          .orderBy('name', descending: _isSorted)
          .where('name',
              isGreaterThanOrEqualTo: query,
              isLessThan: query.substring(0, query.length - 1) +
                  String.fromCharCode(query.codeUnitAt(query.length - 1) + 1))
          .snapshots();
    }

    notifyListeners();
  }

  void createQuery() {}

  void openDetailVacation(BuildContext context, String id) {
    Navigator.of(context).pushNamed(
      MainNavigationRouteNames.vacationDetailsScreen,
      arguments: id,
    );
  }
}
