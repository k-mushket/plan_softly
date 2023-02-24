import 'package:hive_flutter/hive_flutter.dart';

class PlanDataBase {
  List planList = [];

  final _box = Hive.box('box');

  void createData() {
    planList = [
      ['Some text 1', false],
      ['Some text 2', false],
      ['Some text 3', false],
    ];
  }

  void loadData() {
    planList = _box.get('PLANLIST');
  }

  void updateDataBase() {
    _box.put('PLANLIST', planList);
  }
}
