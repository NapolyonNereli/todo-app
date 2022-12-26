import 'package:flutter/material.dart';
import 'package:flutter_application_3/constants/const_colors.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../constants/const_style.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({Key? key, required this.todoItemList}) : super(key: key);
  List<String> todoItemList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(color: ConstColors.morrowWhite),
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20, top: 20),
                  child: Text(
                    "Favorites",
                    style: CustomText.pageTitle,
                  ),
                ),
                Column(
                  children: todoItemList
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Slidable(
                            key: UniqueKey(),
                            endActionPane: ActionPane(
                              motion: const StretchMotion(),
                              dismissible: DismissiblePane(onDismissed: () {
                                todoItemList.remove(e);
                              }),
                              children: [
                                SlidableAction(
                                  onPressed: (context) {},
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  label: "Delete From Favorite",
                                ),
                              ],
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: ConstColors.amethystShow,
                                border: Border.all(
                                    color: Colors.white30,
                                    width: 1.0,
                                    style: BorderStyle.solid),
                              ),
                              child: ListTile(
                                title: Text(
                                  e.toString(),
                                  style: CustomText.sliderText,
                                ),
                                subtitle: Text(
                                    (todoItemList.indexOf(e) + 1)
                                        .toString()),
                                leading: const Icon(
                                  Icons.arrow_circle_right_outlined,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          );
        },
      ),
    ));
    
  }
}
