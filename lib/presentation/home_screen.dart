import 'package:anime_sensei_app/constants.dart';
import 'package:anime_sensei_app/presentation/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _tag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.accent,
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50.0,
                decoration: BoxDecoration(
                    color: Palette.primary,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            _tag = value;
                          });
                        },
                        cursorColor: Palette.accent,
                        style: TextStyle(color: Palette.accent, fontSize: 18.0),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(bottom: 10.0),
                          hintText: 'Search...',
                          hintStyle:
                              TextStyle(color: Palette.accent, fontSize: 18.0),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.search,
                      size: 25.0,
                      color: Palette.accent,
                    )
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              GestureDetector(
                onTap: () => Get.to(ResultScreen(tag: _tag)),
                child: Container(
                  alignment: Alignment.center,
                  height: 40.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      border: Border.all(
                          color: Palette.primary,
                          width: 2.0,
                          style: BorderStyle.solid)),
                  child: Text(
                    'Search',
                    style: TextStyle(
                        color: Palette.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
