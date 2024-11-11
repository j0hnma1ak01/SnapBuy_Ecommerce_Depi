import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:snap_buy_app/features/app_layout/logic/cubit/app_lyout_state.dart';
import 'package:snap_buy_app/features/favourite/ui/widget/favourite_screen.dart';
import 'package:snap_buy_app/features/home/ui/home_screen.dart';
import 'package:snap_buy_app/features/profile/ui/profile_view.dart';
import 'package:snap_buy_app/features/shop/ui/shop_screen.dart';

class AppLayoutCubit extends Cubit<AppLayoutState> {
  AppLayoutCubit() : super(AppLyoutInitial());

  List<Widget> screens = [
    const HomeScreen(),
    const ShoppingCartScreen(),
    const FavouriteScreen(),
    const ProfilePage(),
  ];

  int currentIndex = 0;

  changeCurrentIndex(int index) {
    currentIndex = index;
    emit(AppLyoutChangeIndex());
  }
}
