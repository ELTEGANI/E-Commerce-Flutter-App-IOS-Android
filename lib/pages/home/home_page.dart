import 'package:e_commerace/pages/account/account_page.dart';
import 'package:e_commerace/pages/cart/cart_history.dart';
import 'package:e_commerace/pages/home/main_food_page.dart';
import 'package:e_commerace/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void onTapNav(int index){
     setState(() {
        _selectedIndex=index;
     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body:pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor:AppColors.mainColor,
        unselectedItemColor:Colors.amberAccent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize:0.0,
        unselectedFontSize:0.0,
        currentIndex:_selectedIndex,
        onTap: onTapNav,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive),
            label: 'Archive',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'me',
          )
        ],
      ),
    );
  }

    List pages = [
      MainFoodPage(),
      Container(child:Center(child: Text("Next Page")),),
      CartHistory(),
      AccountPage()
    ];

}
