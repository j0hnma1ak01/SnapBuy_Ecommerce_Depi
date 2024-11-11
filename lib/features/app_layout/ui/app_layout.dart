import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_buy_app/core/themes/colors_manager.dart';
import 'package:snap_buy_app/core/utils/app_icons.dart';
import 'package:snap_buy_app/features/app_layout/logic/cubit/app_lyout_cubit.dart';
import 'package:snap_buy_app/features/app_layout/logic/cubit/app_lyout_state.dart';
import 'package:snap_buy_app/features/app_layout/ui/widget/icon_botton_bar.dart';

class AppLayoutScreen extends StatelessWidget {
  const AppLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppLayoutCubit(),
      child: BlocConsumer<AppLayoutCubit, AppLayoutState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = context.read<AppLayoutCubit>();
          return Scaffold(
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: ColorsManager.primaryColor,
              currentIndex: cubit.currentIndex,
              onTap: (index) => cubit.changeCurrentIndex(index),
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: IconBottonBar(
                      cubit: cubit, iconName: AppIcons.homeIcon, index: 0),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: IconBottonBar(
                      cubit: cubit, iconName: AppIcons.shopIcon, index: 1),
                  label: 'Shop',
                ),
                // BottomNavigationBarItem(
                //   icon: IconBottonBar(
                //       cubit: cubit, iconName: AppIcons.favouriteIcon, index: 2),
                //   label: 'Favourite',
                // ),
                BottomNavigationBarItem(
                  icon: IconBottonBar(
                      cubit: cubit, iconName: AppIcons.bagIcon, index: 2),
                  label: 'Bag',
                ),
                BottomNavigationBarItem(
                  icon: IconBottonBar(
                      cubit: cubit, iconName: AppIcons.profileIcon, index: 3),
                  label: 'Profile',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
