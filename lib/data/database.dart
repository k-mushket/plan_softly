import 'package:hive_flutter/hive_flutter.dart';

class PlanDataBase {
  List planList = [];

  final _box = Hive.box('box');

  void createData() {
    planList = [
      ['Text 1', false],
      ['Text 2', false],
    ];
  }

  void loadData() {
    planList = _box.get('PLANLIST');
  }

  void updateDataBase() {
    _box.put('PLANLIST', planList);
  }
}
