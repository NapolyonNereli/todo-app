import 'package:flutter/material.dart';
import 'package:flutter_application_3/constants/const_colors.dart';
import 'package:flutter_application_3/screen/favorite_page.dart';
import 'package:flutter_application_3/screen/selected_page.dart';
import 'package:flutter_application_3/widgets/app_bar.dart';
import 'package:flutter_application_3/constants/const_style.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../constants/const_style.dart';

List<String> titles = <String>["Home", "Favorite", "SelectedItem"];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controllerText = TextEditingController();
  List<String> todoItems = [];
  List<String> favoriteItems = [];
  List<String> selectedItems = [];
  var completedItem = TextDecoration.none;

  @override
  Widget build(BuildContext context) {
    const int tabsCount = 3;
    return DefaultTabController(
      length: tabsCount,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: SelectedAppBar(),
        ),
        body: Container(
          decoration: const BoxDecoration(
            color: ConstColors.morrowWhite,
          ),
          child: TabBarView(
            children: [
              ListView.builder(
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: Column(children: [
                      SizedBox(
                        width: 500,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: TextField(
                                cursorColor: ConstColors.purpleParadise,
                                decoration: TextFieldDecoration.customInput,
                                controller: _controllerText,
                              ),
                            ),
                            Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 50),
                                child: ElevatedButton(
                                    style: TodoAddButtonStyle.buttonStyle,
                                    onPressed: () {
                                      setState(() {
                                        todoItems.add(_controllerText.text);
                                      });
                                      _controllerText.text = "";
                                    },
                                    child: Text(
                                      "Saved",
                                      style: CustomText.buttonText,
                                    ))),
                          ],
                        ),
                      ),
                      Column(
                        children: todoItems
                            .map(
                              (e) => Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Slidable(
                                    key: UniqueKey(),
                                    endActionPane: ActionPane(
                                      motion: const StretchMotion(),
                                      dismissible:
                                          DismissiblePane(onDismissed: () {
                                        favoriteItems.add(e);
                                        todoItems.remove(e);
                                      }),
                                      children: [
                                        SlidableAction(
                                          onPressed: (context) {},
                                          backgroundColor: Colors.green,
                                          foregroundColor: Colors.white,
                                          icon: Icons.favorite,
                                          label: "Add Favorite",
                                        ),
                                      ],
                                    ),
                                    startActionPane: ActionPane(
                                      motion: const StretchMotion(),
                                      dismissible:
                                          DismissiblePane(onDismissed: (() {
                                        setState(() {
                                          todoItems.remove(e);
                                        });
                                      })),
                                      children: [
                                        SlidableAction(
                                          onPressed: (context) {},
                                          backgroundColor: Colors.red,
                                          foregroundColor: Colors.white,
                                          icon: Icons.delete,
                                          label: "Delete",
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
                                        onTap: () {
                                          setState(() {
                                            completedItem = completedItem ==
                                                    TextDecoration.none
                                                ? TextDecoration.lineThrough
                                                : TextDecoration.none;
                                            selectedItems.add(e);
                                          });
                                        },
                                        title: Text(e.toString(),
                                            style: TextStyle(
                                                color: ConstColors.morrowWhite,
                                                fontSize: 20,
                                                decoration: completedItem)),
                                        subtitle: Text(
                                            (todoItems.indexOf(e) + 1)
                                                .toString()),
                                        leading: const Icon(
                                          Icons.arrow_circle_right_outlined,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )),
                              ),
                            )
                            .toList(),
                      ),
                    ]),
                  );
                },
              ),
              FavoritePage(todoItemList: favoriteItems),
              SelectedPage(selectedItem: selectedItems),
            ],
          ),
        ),
      ),
    );
  }
}
