import 'package:cine_reserve_app/core/constant/app_color.dart';
import 'package:cine_reserve_app/core/constant/strings.dart';
import 'package:cine_reserve_app/core/widgets/custom_appbar.dart';
import 'package:cine_reserve_app/core/widgets/custom_elvaited_button.dart';
import 'package:cine_reserve_app/features/reservation/data/local_data_source/date_movie_local.dart';
import 'package:cine_reserve_app/features/reservation/data/local_data_source/seats_save_local.dart';
import 'package:cine_reserve_app/features/reservation/presentation/widgets/select_seats_widgets/bottom_vav_bar/body_bottom_nav_bar.dart';
import 'package:cine_reserve_app/features/reservation/presentation/widgets/select_seats_widgets/custom_arch.dart';
import 'package:cine_reserve_app/features/reservation/presentation/widgets/select_seats_widgets/custom_reserved_or_not.dart';
import 'package:cine_reserve_app/features/reservation/presentation/widgets/select_seats_widgets/custom_seat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SelectSeatsView extends StatefulWidget {
  const SelectSeatsView({super.key});

  @override
  State<SelectSeatsView> createState() => _SelectSeatsViewState();
}

enum StatusSeats { selected, unselected }

List<StatusSeats> _seatsClassA = List.filled(7, StatusSeats.unselected);
List<StatusSeats> _seatsClassB = List.filled(8, StatusSeats.unselected);
List<StatusSeats> _seatsClassC1 = List.filled(4, StatusSeats.unselected);
List<StatusSeats> _seatsClassC2 = List.filled(4, StatusSeats.unselected);
List<StatusSeats> _seatsClassD1 = List.filled(4, StatusSeats.unselected);
List<StatusSeats> _seatsClassD2 = List.filled(4, StatusSeats.unselected);
List<StatusSeats> _seatsClassE1 = List.filled(4, StatusSeats.unselected);
List<StatusSeats> _seatsClassE2 = List.filled(4, StatusSeats.unselected);
List<StatusSeats> _seatsClassF1 = List.filled(4, StatusSeats.unselected);
List<StatusSeats> _seatsClassF2 = List.filled(4, StatusSeats.unselected);

class _SelectSeatsViewState extends State<SelectSeatsView> {
  SeatsLocalDataSourceImpl seatsLocalDataSourceImpl =
      SeatsLocalDataSourceImpl();
  DateMoviesLocalDataSourceImpl dateMoviesLocalDataSourceImpl =
      DateMoviesLocalDataSourceImpl();
  bool isBottomNavBar = false;
  String day = "";
  String dayNumber = "";
  String hour = "";
  List seats = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondry,
      bottomNavigationBar: isBottomNavBar
          ? CustomBottomSelectSeats(
              day: day,
              dayNumber: dayNumber,
              hour: hour,
              seats: seats,
              numberSeats: seats.length,
              priceSeats: seats.length * 2,
            )
          : null,
      appBar: CustomAppBar(
        backgroundIcon: AppColor.white.withOpacity(0.4),
        title: kSelectSeats,
        isBottom: false,
        isLeading: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 75.h,
                  ),
                  const CustomArch(),
                  SizedBox(
                    height: 40.h,
                  ),
                  _buildAllSeatsOfCienma(),
                  SizedBox(
                    height: 35.h,
                  ),
                  const CustomHintReservedOrNot(),
                  SizedBox(
                    height: 50.h,
                  ),
                  !isBottomNavBar
                      ? SizedBox(
                          width: double.infinity,
                          child: CustomElvatedButton(
                            title: kBook,
                            onPressed: () async {
                              await getDayFromLocal();
                              await getSeatsFromLocal();
                              setState(() {
                                isBottomNavBar = true;
                              });
                            },
                          ))
                      : const SizedBox(),
                  SizedBox(
                    height: 50.h,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

//! get number seats from local
  Future<void> getSeatsFromLocal() async {
    Box box = await seatsLocalDataSourceImpl.openBox();
    seats = seatsLocalDataSourceImpl.getSeats(box);
  }

//! get date from local
  Future<void> getDayFromLocal() async {
    Box box = await dateMoviesLocalDataSourceImpl.openBox();
    Map days = dateMoviesLocalDataSourceImpl.getDay(box);
    day = days["dayTitle"];
    hour = days["hour"];
    dayNumber = days["dayNumber"];
  }

  //! here selected or unselected and add to local
  void _selectSeat(int index, List<StatusSeats> seatsClass) async {
    Box box = await seatsLocalDataSourceImpl.openBox();

    setState(() {
      if (seatsClass[index] == StatusSeats.unselected) {
        seatsClass[index] = StatusSeats.selected;
        seatsLocalDataSourceImpl.addSeat(box, index);
      } else {
        seatsClass[index] = StatusSeats.unselected;
        seatsLocalDataSourceImpl.removeSeat(box, index);
      }
    });
  }

  //! build one seat with change color
  Widget _buildSeat(int index, List<StatusSeats> seatsClass,
      [bool isColor = false]) {
    return CustomSeat(
      color: isColor
          ? AppColor.coralRed
          : seatsClass[index] == StatusSeats.selected
              ? AppColor.selectSeat
              : AppColor.white,
      onTap: isColor
          ? null
          : () async {
              _selectSeat(index, seatsClass);
            },
    );
  }

  //! build row of the seats
  Row _buildRowSeats(int lenghtList, List<StatusSeats> seatsClass,
      [bool isColor = false]) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        lenghtList,
        (index) => _buildSeat(index, seatsClass, isColor),
      ),
    );
  }

  //! build double row of the seats
  Row _buildDoubleRowSeats(
      List<StatusSeats> seatsClass1, List<StatusSeats> seatsClass2,
      {bool isColorLeft = false, bool isColorRight = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildRowSeats(seatsClass1.length, seatsClass1, isColorLeft),
        SizedBox(
          width: 30.w,
        ),
        _buildRowSeats(seatsClass2.length, seatsClass2, isColorRight),
      ],
    );
  }

//! all seats are here
  SizedBox _buildAllSeatsOfCienma() {
    return SizedBox(
      height: 300.h,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //! class A
          _buildRowSeats(_seatsClassA.length, _seatsClassA),
          //! class B
          _buildRowSeats(_seatsClassB.length, _seatsClassB),
          //! class C
          _buildDoubleRowSeats(_seatsClassC1, _seatsClassC2,
              isColorRight: true),
          //! class D
          _buildDoubleRowSeats(_seatsClassD1, _seatsClassD2, isColorLeft: true),
          //! class E
          _buildDoubleRowSeats(_seatsClassE1, _seatsClassE2,
              isColorRight: true),
          //! class F
          _buildDoubleRowSeats(_seatsClassF1, _seatsClassF2),
        ],
      ),
    );
  }
}
