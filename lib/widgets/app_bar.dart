import 'package:flutter/material.dart';
import 'package:flutter_application_3/constants/const_colors.dart';

class SelectedAppBar extends StatelessWidget {
  const SelectedAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: ConstColors.creamyBerry,
      //title: const Text(ConstText.titleApp, style: TextStyle(color: Colors.red),),
      scrolledUnderElevation: 4.0,
      shadowColor: Theme.of(context).shadowColor,
      bottom: const TabBar(
        indicator: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            color: ConstColors.morrowWhite),
        tabs: [
          Tab(icon: Icon(Icons.home, color: ConstColors.homeIcon)),
          Tab(icon: Icon(Icons.favorite, color: ConstColors.favoriteIcon)),
          Tab(icon: Icon(Icons.list_alt, color: ConstColors.listIcon)),
        ],
      ),
    );
  }
}
