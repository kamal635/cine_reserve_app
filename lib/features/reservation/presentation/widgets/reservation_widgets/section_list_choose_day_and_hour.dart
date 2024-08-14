import 'package:cine_reserve_app/core/constant/strings.dart';
import 'package:cine_reserve_app/core/utils/router.dart';
import 'package:cine_reserve_app/core/widgets/custom_elvaited_button.dart';
import 'package:cine_reserve_app/features/home/data/data_source/local_data_source/movie_local.dart';
import 'package:cine_reserve_app/features/home/domain/entity/movie_entity.dart';
import 'package:cine_reserve_app/features/reservation/data/local_data_source/date_movie_local.dart';
import 'package:cine_reserve_app/features/reservation/presentation/widgets/reservation_widgets/custom_box_choose_day.dart';
import 'package:cine_reserve_app/features/reservation/presentation/widgets/reservation_widgets/custom_box_choose_hour.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SectionListChooseDayAndHour extends StatefulWidget {
  const SectionListChooseDayAndHour({super.key, required this.moviesEntity});
  final MoviesEntity moviesEntity;
  @override
  State<SectionListChooseDayAndHour> createState() =>
      _SectionListChooseDayAndHourState();
}

class _SectionListChooseDayAndHourState
    extends State<SectionListChooseDayAndHour> {
  DateMoviesLocalDataSourceImpl dayMoviesLocalDataSourceImpl =
      DateMoviesLocalDataSourceImpl();

  List<String> titles = ["Tue", "Wed", "Thu", "Fri", "Sat"];
  List<String> subTitles = ["13", "14", "15", "16", "17"];
  List<String> hour = ["16:00", "17:00", "18:00", "19:00", "20:00"];

  List<bool> isTapHour = List.filled(5, false);
  List<bool> isTapDayList = List.filled(5, false);

  bool selectedHourIndex = false;
  bool selectedDayIndex = false;

  String dayTitles = "";
  String dayNumber = "";
  String dayHour = "";

  void handleTapHour(int index) {
    setState(() {
      for (var i = 0; i < isTapHour.length; i++) {
        if (i == index) {
          isTapHour[i] = !isTapHour[i];
          selectedHourIndex = isTapHour[i];
        } else {
          isTapHour[i] = false;
        }
      }
    });
  }

  void handleTapDay(int index) {
    setState(() {
      for (var i = 0; i < isTapDayList.length; i++) {
        if (i == index) {
          isTapDayList[i] = !isTapDayList[i];
          selectedDayIndex = isTapDayList[i];
        } else {
          isTapDayList[i] = false;
        }
      }
    });
  }

  Map<String, String> daysMethod() {
    Map<String, String> days;
    days = {
      "dayTitle": dayTitles,
      "dayNumber": dayNumber,
      "hour": dayHour,
    };
    return days;
  }

  Future<void> addDaytoLocal() async {
    Box box = await dayMoviesLocalDataSourceImpl.openBox();
    await dayMoviesLocalDataSourceImpl.addDay(box, daysMethod());
  }

  Future<void> addMovietoLocal() async {
    await MovieLocalDataSourceImpl.addMovie(widget.moviesEntity);
  }

  bool get showButton => selectedHourIndex && selectedDayIndex == true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: 300.h,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: List.generate(titles.length, (index) {
              return CustomBoxChooseDay(
                isTapDay: isTapDayList[index],
                onTap: () {
                  dayTitles = titles[index];
                  dayNumber = subTitles[index];
                  handleTapDay(index);
                },
                alignment: Alignment(
                  -1 + (0.5 * index),
                  [-0.4, -0.7, -1, -0.7, -0.4][index].toDouble(),
                ),
                title: titles[index],
                subTitle: subTitles[index],
              );
            }),
          ),
        ),
        SizedBox(
          height: 180.h,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: List.generate(hour.length, (index) {
              return CustomBoxChooseHour(
                isTapHour: isTapHour[index],
                onTap: () {
                  handleTapHour(index);
                  dayHour = hour[index];
                },
                alignment: Alignment(
                  [-1, -0.5, 0, 0.5, 1][index].toDouble(),
                  [-0.2, -0.7, -1.1, -0.7, -0.2][index].toDouble(),
                ),
                hour: hour[index],
              );
            }),
          ),
        ),
        if (showButton)
          SizedBox(
            width: double.infinity,
            child: CustomElvatedButton(
              title: kReservation,
              onPressed: () async {
                await addMovietoLocal();
                await addDaytoLocal();

                if (!context.mounted) return;
                context.push(AppRouter.selectSeatsView);
              },
            ),
          ),
      ],
    );
  }
}
