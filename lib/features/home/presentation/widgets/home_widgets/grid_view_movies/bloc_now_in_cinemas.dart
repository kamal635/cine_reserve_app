import 'package:cine_reserve_app/core/constant/strings.dart';
import 'package:cine_reserve_app/core/functions/toast.dart';
import 'package:cine_reserve_app/features/home/presentation/blocs/new_in_cinemas/new_in_cinemas_bloc.dart';
import 'package:cine_reserve_app/features/home/presentation/widgets/home_widgets/grid_view_movies/custom_grid_view_now_in_cineams.dart';
import 'package:cine_reserve_app/features/home/presentation/widgets/home_widgets/grid_view_movies/custom_title_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridViewNowInCinemasBloc extends StatefulWidget {
  const GridViewNowInCinemasBloc({super.key});

  @override
  State<GridViewNowInCinemasBloc> createState() =>
      _GridViewNowInCinemasBlocState();
}

class _GridViewNowInCinemasBlocState extends State<GridViewNowInCinemasBloc> {
  late final ScrollController _scrollController;
  int nextPage = 2;

  @override
  void initState() {
    _scrollController = ScrollController();
    setState(() {
      _scrollController.addListener(_onScroll);
    });

    super.initState();
  }

  void _onScroll() {
    var currentPosition = _scrollController.position.pixels;
    var maxScrollGridView = _scrollController.position.maxScrollExtent;

    if (currentPosition >= 0.7 * maxScrollGridView) {
      BlocProvider.of<NowInCinemasBloc>(context)
          .add(NowInCinemasGetEvent(page: nextPage++));
    }
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleListViewHome(
          title: kNowCinemas,
        ),
        SizedBox(
          height: 300.h,
          child: BlocConsumer<NowInCinemasBloc, NowInCinemasState>(
            listener: (context, state) {
              if (state is NowInCinemasFailure) {
                toast(message: state.errorMessage);
              }
              if (state is NowInCinemasFailurePagination) {
                toast(message: state.errorMessage);
              }
            },
            builder: (context, state) {
              if (state is NowInCinemasSuccess) {
                return CustomGridViewNowInCinemas(
                  scrollController: _scrollController,
                  listMovies: state.listMovie,
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ],
    );
  }
}
