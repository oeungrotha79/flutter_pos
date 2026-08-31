import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg_provider;
import 'package:pos_mobile/helpers/category_card.dart';
import 'package:pos_mobile/helpers/product_card.dart';
import 'package:pos_mobile/models/category.dart';
import 'package:pos_mobile/models/menu_item.dart';
import 'package:pos_mobile/models/product.dart';
import 'package:pos_mobile/provider/home_provider.dart';
import 'package:pos_mobile/screens/account_screen.dart';
import 'package:pos_mobile/screens/cart_screen.dart';
import 'package:pos_mobile/screens/explore_screen.dart';
import 'package:pos_mobile/screens/favorite_screen.dart';
import 'package:pos_mobile/screens/shop_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<MenuItem> _menus = [
    MenuItem(label: 'Shop', icon: 'assets/svg/shop.svg'),
    MenuItem(label: 'Explore', icon: 'assets/svg/Search.svg'),
    MenuItem(label: 'Cart', icon: 'assets/svg/Cart.svg'),
    MenuItem(label: 'Favourite', icon: 'assets/svg/Favorite.svg'),
    MenuItem(label: 'Account', icon: 'assets/svg/Account.svg'),
  ];

  final List<Widget> _pages = [
    ShopScreen(),
    ExploreScreen(),
    CartScreen(),
    FavoriteScreen(),
    AccountScreen(),
  ];

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomeProvider>(
        builder: (_, value, _) => IndexedStack(
          index: value.currentIndex,
          children: [
            ..._pages

          ]),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: Consumer<HomeProvider>(
        builder: (_, provider, __) => Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            currentIndex: provider.currentIndex,
            onTap: (index){
              provider.onTap(index);
              _pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease );
            },

            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.black87,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            items: [
              for (int index = 0; index < _menus.length; index++)
                BottomNavigationBarItem(
                  icon: ImageIcon(svg_provider.Svg(_menus[index].icon)),
                  label: _menus[index].label,
                ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _buildIcon(int index, int currentIndex) {
  //   final bool isSelected = index == currentIndex;
  //   return Container(
  //     padding: const EdgeInsets.all(6),
  //     decoration: isSelected
  //         ? BoxDecoration(
  //             color: Colors.green.withOpacity(0.15),
  //             shape: BoxShape.circle,
  //           )
  //         : null,
  //     child: SizedBox(
  //       width: 22,
  //       height: 22,
  //       child: SvgPicture.asset(
  //         _menus[index].icon,
  //         colorFilter: ColorFilter.mode(
  //           isSelected ? Colors.green : Colors.black87,
  //           BlendMode.srcIn,
  //         ),
  //         fit: BoxFit.contain,
  //       ),
  //     ),
  //   );
  // }
}
