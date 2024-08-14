import 'package:cine_reserve_app/core/constant/strings.dart';
import 'package:cine_reserve_app/core/functions/toast.dart';
import 'package:cine_reserve_app/features/home/presentation/blocs/top_rated/top_rated_movies_bloc.dart';
import 'package:cine_reserve_app/features/home/presentation/widgets/home_widgets/grid_view_movies/custom_grid_view_top_movies.dart';
import 'package:cine_reserve_app/features/home/presentation/widgets/home_widgets/grid_view_movies/custom_title_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridViewTopRatedBloc extends StatefulWidget {
  const GridViewTopRatedBloc({super.key});

  @override
  State<GridViewTopRatedBloc> createState() => _GridViewTopRatedBlocState();
}

class _GridViewTopRatedBlocState extends State<GridViewTopRatedBloc> {
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
      BlocProvider.of<TopRatedMoviesBloc>(context)
          .add(TopRatedMoviesGetEvent(page: nextPage++));
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
          title: kTopRatedMovies,
        ),
        SizedBox(
          height: 300.h,
          child: BlocConsumer<TopRatedMoviesBloc, TopRatedMoviesState>(
            listener: (context, state) {
              if (state is TopRatedMoviesStateFailure) {
                toast(message: state.errorMessage);
              }
              if (state is TopRatedMoviesStateFailurePagination) {
                toast(message: state.errorMessage);
              }
            },
            builder: (context, state) {
              if (state is TopRatedMoviesStateSuccess) {
                return CustomGridViewTopRated(
                    scrollController: _scrollController,
                    listPagination: state.listMovie);
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
