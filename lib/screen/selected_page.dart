
import 'package:flutter/material.dart';
import 'package:flutter_application_3/constants/const_colors.dart';
import 'package:flutter_application_3/constants/const_style.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SelectedPage extends StatelessWidget {
  SelectedPage({Key? key, required this.selectedItem}) : super(key: key);
  List<String> selectedItem = [];
  
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
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Text(
                      "Completed",
                      style: CustomText.pageTitle,
                    ),
                  ),
                  Column(
                    children: selectedItem
                        .map((e) => Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Slidable(
                                key: UniqueKey(),
                                endActionPane: ActionPane(
                                  motion: const StretchMotion(),
                                  dismissible: DismissiblePane(
                                    onDismissed: () {
                                      selectedItem.remove(e);
                                    },
                                  ),
                                  children: [
                                    SlidableAction(
                                      onPressed: (context) {},
                                      backgroundColor: Colors.red,
                                      foregroundColor: Colors.white,
                                      icon: Icons.delete,
                                      label: "Delete From Completed",
                                    )
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
                                      (selectedItem.indexOf(e) + 1).toString(),
                                    ),
                                    leading: const Icon(
                                        Icons.arrow_circle_right_outlined, color: Colors.white,),
                                  ),
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
