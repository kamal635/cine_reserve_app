import 'package:cine_reserve_app/core/constant/strings.dart';
import 'package:cine_reserve_app/core/widgets/custom_appbar.dart';
import 'package:cine_reserve_app/features/home/presentation/blocs/search_home/search_home_bloc.dart';
import 'package:cine_reserve_app/features/home/presentation/widgets/search_widgets/body_search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchHomeView extends StatelessWidget {
  const SearchHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: kSearchHome,
        hintText: kSearch,
        onTapIcon: () {},
        onChanged: (value) {
          BlocProvider.of<SearchHomeBloc>(context)
              .add(SearchMoviesTappedEvent(query: value));
        },
      ),
      body: const SearchHomeViewBody(),
    );
  }
}
