import 'package:cine_reserve_app/core/constant/strings.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class SeatsLocalDataSource {
  Future<Box> openBox();
  Future<void> addSeat(Box box, int seat);
  Future<void> removeSeat(Box box, int index);
  List<dynamic> getSeats(Box box);
}

class SeatsLocalDataSourceImpl implements SeatsLocalDataSource {
  @override
  Future<Box> openBox() async {
    Box box = await Hive.openBox(kSeatBox);
    return box;
  }

  @override
  Future<void> addSeat(Box box, int seat) async {
    List<dynamic> seats = box.get(kSeatBox, defaultValue: []);
    seats.add(seat);
    await box.put(kSeatBox, seats);
  }

  @override
  Future<void> removeSeat(Box box, int seat) async {
    List<dynamic> seats = box.get(kSeatBox, defaultValue: []);
    seats.remove(seat);
    await box.put(kSeatBox, seats);
  }

  @override
  List<dynamic> getSeats(Box box) {
    List<dynamic> seats = box.get(kSeatBox, defaultValue: []);
    return seats;
  }
}
