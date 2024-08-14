import 'package:cine_reserve_app/core/constant/app_linear.dart';
import 'package:cine_reserve_app/core/functions/toast.dart';
import 'package:cine_reserve_app/features/home/presentation/blocs/search_home/search_home_bloc.dart';
import 'package:cine_reserve_app/features/home/presentation/widgets/search_widgets/row_movie_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchHomeViewBody extends StatelessWidget {
  const SearchHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: kToolbarHeight + 75.h),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: AppLinear.linearPages,
        ),
        child: BlocConsumer<SearchHomeBloc, SearchHomeState>(
          listener: (context, state) {
            if (state is SearchHomeFailure) {
              toast(message: state.errorMessage);
            }
          },
          builder: (context, state) {
            if (state is SearchHomeLoading) {
              return const CircularProgressIndicator();
            }
            if (state is SearchHomeSuccess) {
              return ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: state.listMovies.length,
                  itemBuilder: (context, i) {
                    return RowResultSearch(
                      moviesEntity: state.listMovies[i],
                    );
                  });
            }
            return const SizedBox();
          },
        ));
  }
}
