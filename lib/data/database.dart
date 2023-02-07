import 'package:hive_flutter/hive_flutter.dart';

class PlanDataBase {
  List planList = [];

  final _box = Hive.box('box');

  void createData() {
    planList = [
      ['You are a beautiful girl 🤩', false],
      ['I love you, my Grinch 😘', false],
      ['Remember I\'m always there 🥺', false],
    ];
  }

  void loadData() {
    planList = _box.get('PLANLIST');
  }

  void updateDataBase() {
    _box.put('PLANLIST', planList);
  }
}
