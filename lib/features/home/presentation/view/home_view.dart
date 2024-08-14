import 'package:cine_reserve_app/core/constant/app_assets_icons.dart';
import 'package:cine_reserve_app/core/constant/app_color.dart';
import 'package:cine_reserve_app/core/constant/strings.dart';
import 'package:cine_reserve_app/core/widgets/custom_appbar.dart';
import 'package:cine_reserve_app/features/home/presentation/widgets/home_widgets/body_home_view.dart';
import 'package:cine_reserve_app/features/tickets/presentation/view/tickets_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

enum IconIndex {
  ticket,
  home,
}

class _HomeViewState extends State<HomeView> {
  IconIndex indexIcon = IconIndex.home;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      floatingActionButton: customFloatinActionButton(),
      floatingActionButtonLocation: _checkPositionFloatingButton(),
      bottomNavigationBar: customBottomAppBar(),
      appBar: _buildAppBar(),
      body: currentPage(context),
    );
  }

//! Floating action button
  Container customFloatinActionButton() {
    return Container(
      decoration: const BoxDecoration(shape: BoxShape.circle, boxShadow: [
        BoxShadow(
          color: AppColor.lightBlue,
          offset: Offset(0, -1.5),
        ),
      ]),
      child: FloatingActionButton(
        backgroundColor: AppColor.secondry,
        onPressed: () {},
        elevation: 0.0,
        child: Image.asset(
          _getIconAsset(),
          height: 25.h,
          width: 25.h,
        ),
      ),
    );
  }

//! bottom AppBar
  BottomAppBar customBottomAppBar() {
    return BottomAppBar(
      height: 55.h,
      color: AppColor.secondry,
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildIcon(
            IconIndex.ticket,
            AppAssetsIcons.ticket,
          ),
          _buildIcon(
            IconIndex.home,
            AppAssetsIcons.home,
          ),
        ],
      ),
    );
  }

//! hide icon in bottom appbar when floating change position
  Widget _buildIcon(
    IconIndex iconIndex,
    String iconAsset,
  ) {
    final bool isVisible = indexIcon == iconIndex;
    return !isVisible
        ? InkWell(
            onTap: () {
              setState(() {
                indexIcon = iconIndex;
              });
            },
            child: SizedBox(
              height: 35.h,
              width: 35.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    iconAsset,
                    height: 22.h,
                    width: 22.w,
                  ),
                ],
              ),
            ),
          )
        : const SizedBox();
  }

//! change page by current enum index
  Widget currentPage(BuildContext context) {
    switch (indexIcon) {
      case IconIndex.ticket:
        return const TicketsView();
      case IconIndex.home:
        return const HomeViewBody();
    }
  }

//! change image floating action button
  String _getIconAsset() {
    switch (indexIcon) {
      case IconIndex.ticket:
        return AppAssetsIcons.ticket;
      case IconIndex.home:
        return AppAssetsIcons.home;
    }
  }

//! change position floating action button by index enum
  FloatingActionButtonLocation _checkPositionFloatingButton() {
    switch (indexIcon) {
      case IconIndex.ticket:
        return FloatingActionButtonLocation.startDocked;
      case IconIndex.home:
        return FloatingActionButtonLocation.endDocked;
    }
  }

  PreferredSizeWidget _buildAppBar() {
    switch (indexIcon) {
      case IconIndex.ticket:
        return const CustomAppBar(
          title: "Mobile Tickets",
          isBottom: false,
        );
      case IconIndex.home:
        return const CustomAppBar(
          title: kchooseMovie,
          hintText: kSearch,
          readOnly: true,
          isOnTap: true,
        );
    }
  }
}
