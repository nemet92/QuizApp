import 'package:flutter/material.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:studentn/utils/themes/theme.dart';

import '../widgets/customElavatedButton.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color correctBackgroundColor = Colors.green;
  int cavab = 5;
  TextEditingController? _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          drawer: Drawer(
            child: ListView(
              children: [
                DrawerHeader(
                  child: Column(
                    children: [
                      CircleAvatar(
                        child: Text('P'),
                        radius: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text('Pasayev Nemet Esed'),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Text('Imtahan Neticeleri'),
                ),
                ListTile(
                  title: Text('Qaranliq rejimi'),
                  trailing: Switch(
                      value: false,
                      onChanged: (state) {
                        setState(() {});
                      }),
                ),
              ],
            ),
          ),
          appBar: AppBar(
            title: Text(
              'Imtahana Hazirliq',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
            ),
            centerTitle: true,
            backgroundColor: Themes.primaryColor,
            actions: [
              PopupMenuButton(itemBuilder: (context) {
                return [
                  PopupMenuItem<int>(
                    value: 0,
                    child: Text(
                      "NV-nin üstün hərəkət rejimi ilə hərəkəti və bununla əlaqədar digər sürücülərin vəzifələri.",
                    ),
                  ),
                  PopupMenuItem<int>(
                    value: 1,
                    child: Text("Hərəkətə başlama və manevr etmə"),
                  ),
                ];
              }, onSelected: (value) {
                if (value == 0) {
                } else if (value == 1) {}
              }),
            ],
          ),
          backgroundColor: Colors.blue.shade100,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Expanded(
                  flex: 40,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5, left: 5),
                    child: Image.asset('assets/sual1.jpeg'),
                  ),
                ),
              ),
              Expanded(
                flex: 60,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomButtonWidget(
                            buttonText: '1',
                            textFontSize: 25,
                            textColor: Colors.white,
                            buttonBackgroundColor: Themes.primaryColor,
                            buttonBorderRadius: 5,
                            buttonSideColor: Themes.primaryColor,
                            onPressed: () {
                              setState(() {});
                            }),
                        CustomButtonWidget(
                            buttonText: '2',
                            textFontSize: 25,
                            textColor: Colors.white,
                            buttonBackgroundColor: Themes.primaryColor,
                            buttonBorderRadius: 5,
                            buttonSideColor: Themes.primaryColor,
                            onPressed: () {
                              setState(() {});
                            }),
                        CustomButtonWidget(
                            buttonText: '3',
                            textFontSize: 25,
                            textColor: Colors.white,
                            buttonBackgroundColor: Themes.primaryColor,
                            buttonBorderRadius: 5,
                            buttonSideColor: Themes.primaryColor,
                            onPressed: () {
                              setState(() {});
                            }),
                        CustomButtonWidget(
                            buttonText: '4',
                            textFontSize: 25,
                            textColor: Colors.white,
                            buttonBackgroundColor: Themes.primaryColor,
                            buttonBorderRadius: 5,
                            buttonSideColor: Themes.primaryColor,
                            onPressed: () {
                              setState(() {});
                            }),
                        CustomButtonWidget(
                            buttonText: '5',
                            textFontSize: 25,
                            textColor: Colors.white,
                            buttonBackgroundColor:
                                (cavab == 5) ? Themes.primaryColor : Colors.red,
                            buttonBorderRadius: 5,
                            buttonSideColor: Themes.primaryColor,
                            onPressed: () {
                              setState(() {});
                            })
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [IconButton(
                                iconSize: 25,
                                onPressed: () {},
                                icon: Icon(Icons.keyboard_arrow_left)),
                            Container(
                              decoration: BoxDecoration(color: Colors.white38),
                              height: 50,
                              width: 60,
                              child: Center(
                                  child: TextField(textAlign: TextAlign.center,
                                controller: _textEditingController,
                                decoration: InputDecoration(
                                    hintText: '1',
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(width: 3,color: Colors.black))),
                                style: TextStyle(fontSize: 25),
                              )),
                            ),
                            IconButton(
                                iconSize: 25,
                                onPressed: () {},
                                icon: Icon(Icons.keyboard_arrow_right)),
                            
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
