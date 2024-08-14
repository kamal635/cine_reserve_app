import 'package:cine_reserve_app/core/constant/strings.dart';
import 'package:cine_reserve_app/core/functions/toast.dart';

import 'package:cine_reserve_app/features/home/presentation/blocs/up_coming/up_coming_bloc.dart';
import 'package:cine_reserve_app/features/home/presentation/widgets/home_widgets/grid_view_movies/custom_grid_view_up_coming.dart';
import 'package:cine_reserve_app/features/home/presentation/widgets/home_widgets/grid_view_movies/custom_title_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridViewUpComingBloc extends StatefulWidget {
  const GridViewUpComingBloc({super.key});

  @override
  State<GridViewUpComingBloc> createState() => _GridViewUpComingBlocState();
}

class _GridViewUpComingBlocState extends State<GridViewUpComingBloc> {
  late final ScrollController _scrollController;
  int nextPage = 2;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  void _onScroll() {
    var currentPosition = _scrollController.offset;
    var maxScrollGridView = _scrollController.position.maxScrollExtent;

    if (currentPosition >= 0.7 * maxScrollGridView) {
      BlocProvider.of<UpComingBloc>(context)
          .add(UpComingMoviesEvent(page: nextPage++));
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
          title: kUpComingMovies,
        ),
        SizedBox(
          height: 300.h,
          child: BlocConsumer<UpComingBloc, UpComingState>(
            listener: (context, state) {
              if (state is UpComingStateFailure) {
                toast(message: state.errorMessage);
              }
              if (state is UpComingStateFailurePagination) {
                toast(message: state.errorMessage);
              }
            },
            builder: (context, state) {
              if (state is UpComingStateSuccess) {
                return CustomGridViewUpComing(
                  scrollController: _scrollController,
                  listPagination: state.listMovies,
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
