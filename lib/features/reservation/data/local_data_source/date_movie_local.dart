import 'package:cine_reserve_app/core/constant/strings.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class DateMoviesLocalDataSource {
  Future<Box> openBox();
  Future<void> addDay(Box box, Map day);
  Map getDay(Box box);
}

class DateMoviesLocalDataSourceImpl implements DateMoviesLocalDataSource {
  @override
  Future<Box> openBox() async {
    Box box = await Hive.openBox(kDayBox);
    return box;
  }

  @override
  Future<void> addDay(Box box, Map day) async {
    await box.put("day", day);
  }

  @override
  Map getDay(Box box) {
    return box.get("day");
  }
}
