
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:news_app_bloc/bloc/bottom_navbar_bloc.dart';

import 'package:news_app_bloc/style/theme.dart' as Style;

class MainScrean extends StatefulWidget{
  @override
  _MainScreanState createState() => _MainScreanState();
}

class _MainScreanState extends State<MainScrean>{
  BottomNavBarBloc _bottomBavBarBloc;

  @override
  void initState() {
    super.initState();

    _bottomBavBarBloc = BottomNavBarBloc();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Style.Colors.mainColor,
          title: Text("IskanderPost", style: TextStyle(
            color: Colors.white
          ),
          ),
        ),
      ),
      body: SafeArea(
        child: StreamBuilder<NavBarItem>(
          stream: _bottomBavBarBloc.itemStream,
          initialData: _bottomBavBarBloc.defaultItem,
          // ignore: missing_return
          builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapshot){
            switch(snapshot.data){
              case NavBarItem.HOME:
                return testScreen();
              case NavBarItem.SOURCES:
                return testScreen();
              case NavBarItem.SEARCH:
                return testScreen();
            }
          },
        ),
      ),
      bottomNavigationBar: StreamBuilder(
        stream: _bottomBavBarBloc.itemStream,
        initialData: _bottomBavBarBloc.defaultItem,
        builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapchot){
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30)
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[100],
                  spreadRadius: 0, blurRadius: 10
                )
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                topRight: Radius.circular(30)
              ),
              child: BottomNavigationBar(
                backgroundColor: Colors.white,
                iconSize: 20,
                unselectedItemColor: Style.Colors.grey,
                unselectedFontSize: 9.5,
                selectedFontSize: 9.5,
                type: BottomNavigationBarType.fixed,
                fixedColor: Style.Colors.mainColor,
                currentIndex: snapchot.data.index,
                onTap: _bottomBavBarBloc.pickItem,
                items: [
                  BottomNavigationBarItem(
                    title: Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(
                        "Home"
                      ),
                    ),
                    icon: Icon(EvaIcons.homeOutline),
                    activeIcon: Icon(EvaIcons.home),
                  ),
                  BottomNavigationBarItem(
                    title: Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(
                          "Source"
                      ),
                    ),
                    icon: Icon(EvaIcons.gridOutline),
                    activeIcon: Icon(EvaIcons.grid),
                  ),
                  BottomNavigationBarItem(
                    title: Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(
                          "Search"
                      ),
                    ),
                    icon: Icon(EvaIcons.searchOutline),
                    activeIcon: Icon(EvaIcons.search),
                  ),
                ],
              ),
            ),
          );
          },
      ),
    );
  }

  Widget testScreen(){
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "testScreen"
          ),
        ],
      ),
    );
  }

}