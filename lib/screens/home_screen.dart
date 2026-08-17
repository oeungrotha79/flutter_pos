import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:pos_mobile/helpers/category_card.dart';
import 'package:pos_mobile/helpers/product_card.dart';
import 'package:pos_mobile/models/category.dart';
import 'package:pos_mobile/models/menu_item.dart';
import 'package:pos_mobile/models/product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Product> _meat = [
    Product(
      id: 1,
      name: 'Beef',
      description: '100g, Price',
      image: 'assets/images/beef.png',
      images: [
        'assets/images/beef.png',
        'assets/images/beef.png',
        'assets/images/beef.png',
      ],
      price: 20.10,
      nutrition: 'High protein, rich in iron, low carbs',
      rating: 4.6,
    ),
    Product(
      id: 2,
      name: 'Chicken',
      description: '1pcs, Price',
      image: 'assets/images/chicken.png',
      images: [
        'assets/images/chicken.png',
        'assets/images/chicken.png',
        'assets/images/chicken.png',
      ],
      price: 30.32,
      nutrition: 'Lean protein, rich in niacin and selenium',
      rating: 4.4,
    ),
  ];
  final List<Product> _bestSell = [
    Product(
      id: 1,
      name: 'Red Pepper',
      description: '100g, Price',
      image: 'assets/images/pepper.png',
      images: [
        'assets/images/pepper.png',
        'assets/images/pepper.png',
        'assets/images/pepper.png',
      ],
      price: 20.10,
      nutrition: 'Rich in vitamins A and C, supports digestion',
      rating: 4.2,
    ),
    Product(
      id: 2,
      name: 'Tomato',
      description: '1pcs, Price',
      image: 'assets/images/tomato.png',
      images: [
        'assets/images/tomato.png',
        'assets/images/tomato.png',
        'assets/images/tomato.png',
      ],
      price: 30.32,
      nutrition: 'Good source of lycopene, vitamin C, and potassium',
      rating: 4.7,
    ),
    Product(
      id: 3,
      name: 'Green Apple',
      description: '2Kg, Price',
      image: 'assets/images/greenapple.png',
      images: [
        'assets/images/greenapple.png',
        'assets/images/greenapple.png',
        'assets/images/greenapple.png',
      ],
      price: 3.532,
      nutrition: 'Fiber-rich, supports digestion and hydration',
      rating: 4.5,
    ),
    Product(
      id: 4,
      name: 'Organic Banana',
      description: '7pcs',
      image: 'assets/images/banana.jpg',
      images: [
        'assets/images/banana.jpg',
        'assets/images/banana.jpg',
        'assets/images/banana.jpg',
      ],
      price: 5.1234,
      nutrition: 'Packed with potassium and energy-boosting carbohydrates',
      rating: 4.8,
    ),
  ];

  final List<Product> _exclusiveOffers = [
    Product(
      id: 1,
      name: 'Organic Banana',
      description: '7pcs',
      image: 'assets/images/banana.jpg',
      images: [
        'assets/images/banana.jpg',
        'assets/images/banana.jpg',
        'assets/images/banana.jpg',
      ],
      price: 5.1234,
      nutrition: 'High in potassium and vitamins, great for smoothies',
      rating: 4.9,
    ),
    Product(
      id: 2,
      name: 'Organic Apple',
      description: '1Kg, Price',
      image: 'assets/images/apple.jpg',
      images: [
        'assets/images/apple.jpg',
        'assets/images/apple.jpg',
        'assets/images/apple.jpg',
      ],
      price: 7.235,
      nutrition: 'Crunchy apples rich in fiber, vitamin C, and antioxidants',
      rating: 4.7,
    ),
    Product(
      id: 3,
      name: 'Organic Orange',
      description: '2Kg, Price',
      image: 'assets/images/orange.jpg',
      images: [
        'assets/images/orange.jpg',
        'assets/images/orange.jpg',
        'assets/images/orange.jpg',
      ],
      price: 2.35,
      nutrition: 'Vitamin C powerhouse with immune-supporting flavonoids',
      rating: 4.5,
    ),
    Product(
      id: 5,
      name: 'Green Apple',
      description: '2Kg, Price',
      image: 'assets/images/greenapple.png',
      images: [
        'assets/images/greenapple.png',
        'assets/images/greenapple.png',
        'assets/images/greenapple.png',
      ],
      price: 3.532,
      nutrition: 'Fresh green apples with fiber for digestive health',
      rating: 4.6,
    ),
  ];

  final List<String> _slider = [
    'assets/images/B1.png',
    'assets/images/B2.png',
    'assets/images/B3.png',
    'assets/images/B4.png',
  ];

  final List<Category> _groceries = [
    Category(title: "Pulses", image: "assets/images/pulses.png"),
    Category(title: "Rices", image: "assets/images/rice.png"),
    Category(title: "Spices", image: "assets/images/spices.png"),
    Category(title: "Vegetables", image: "assets/images/vegetables.png"),
  ];

  final List<Color> _categoryCardColors = const [
    Color(0xffF7F0E7),
    Color(0xffE8F5E9),
  ];

  int currentSlideIndex = 0;

  int _currentIndex = 0;

  final List<MenuItem> _menus = [
    MenuItem(label: 'Shop', icon: 'assets/svg/shop.svg'),
    MenuItem(label: 'Explore', icon: 'assets/svg/Search.svg'),
    MenuItem(label: 'Cart', icon: 'assets/svg/Cart.svg'),
    MenuItem(label: 'Favourite', icon: 'assets/svg/Favorite.svg'),
    MenuItem(label: 'Account', icon: 'assets/svg/Account.svg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // appBar: AppBar(
      //   toolbarHeight: 150,
      //   backgroundColor: Colors.white,
      //   centerTitle: true,
      //   // leading: SizedBox(),
      //   title: Column(
      //     mainAxisSize: MainAxisSize.min,

      //     // mainAxisAlignment: MainAxisAlignment.center,
      //     // crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       Center(child: Image.asset('assets/images/Group.png', height: 30)),
      //       const SizedBox(height: 20),
      //       Row(
      //         mainAxisSize: MainAxisSize.min,
      //         children: [
      //           const Icon(Icons.location_on, size: 20),
      //           SizedBox(width: 8),
      //           Text(
      //             'Dhaka, Bannassre',
      //             style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      //           ),
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
            children: [
              SizedBox(height: 30),
              Image.asset('assets/images/Group.png', height: 30),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  const Icon(Icons.location_on, size: 20),
                  SizedBox(width: 8),
                  Text(
                    'Dhaka, Bannassre',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: CupertinoSearchTextField(
                  backgroundColor: Color(0xFFF2F3F2),
                  padding: EdgeInsets.all(16),
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  prefixIcon: Icon(
                    CupertinoIcons.search,
                    color: Colors.black,
                    size: 24,
                  ),
                  prefixInsets: EdgeInsets.only(left: 16),
                  placeholder: 'Search your product',
                ),
              ),
            ],
          ),

          //carousel slider
          Stack(
            alignment: Alignment.bottomCenter,

            children: [
              CarouselSlider(
                items: [
                  for (String item in _slider)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        item,
                        width: 360,
                        height: 140,
                        fit: BoxFit.cover,
                      ),
                    ),
                ],
                options: CarouselOptions(
                  height: 120,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    currentSlideIndex = index;
                    setState(() {});
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int index = 0; index < _slider.length; index++)
                      AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        width: currentSlideIndex == index ? 16 : 6,
                        height: 6,
                        margin: EdgeInsets.only(
                          right: index == _slider.length - 1 ? 0 : 6,
                        ),
                        decoration: BoxDecoration(
                          color: currentSlideIndex == index
                              ? Colors.green
                              : Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 20),
          //exclusive offer
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  'Exclusive Offers',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    // padding: EdgeInsets.zero,
                    // minimumSize: Size.zero,
                    // tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    'See All',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 305,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(20),
              children: [
                for (int index = 0; index < _exclusiveOffers.length; index++)
                  Padding(
                    padding: EdgeInsets.only(
                      right: index == _exclusiveOffers.length - 1 ? 0 : 16,
                    ),
                    child: ProductCard(product: _exclusiveOffers[index]),
                  ),
              ],
            ),
          ),

          //best selling
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  'Best Selling',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    // padding: EdgeInsets.zero,
                    // minimumSize: Size.zero,
                    // tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    'See All',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 305,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(20),
              children: [
                for (int index = 0; index < _bestSell.length; index++)
                  Padding(
                    padding: EdgeInsets.only(
                      right: index == _bestSell.length - 1 ? 0 : 16,
                    ),
                    child: ProductCard(product: _bestSell[index]),
                  ),
              ],
            ),
          ),

          //Groceries
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  'Groceries',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(),
                  child: Text(
                    'See All',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 140,
            width: 220,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(20),
              children: [
                for (int index = 0; index < _groceries.length; index++)
                  Padding(
                    padding: EdgeInsets.only(
                      right: index == _groceries.length - 1 ? 0 : 16,
                    ),
                    child: CategoryCard(
                      category: _groceries[index],
                      backgroundColor:
                          _categoryCardColors[index %
                              _categoryCardColors.length],
                    ),
                  ),
              ],
            ),
          ),

          //groseries card
          SizedBox(
            height: 305,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(20),
              children: [
                for (int index = 0; index < _meat.length; index++)
                  Padding(
                    padding: EdgeInsets.only(
                      right: index == _meat.length - 1 ? 0 : 16,
                    ),
                    child: ProductCard(product: _meat[index]),
                  ),
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
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
                icon: _buildIcon(index),
                label: _menus[index].label,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(int index) {
    final bool isSelected = index == _currentIndex;
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: isSelected
          ? BoxDecoration(
              color: Colors.green.withOpacity(0.15),
              shape: BoxShape.circle,
            )
          : null,
      child: SizedBox(
        width: 22,
        height: 22,
        child: SvgPicture.asset(
          _menus[index].icon,
          colorFilter: ColorFilter.mode(
            isSelected ? Colors.green : Colors.black87,
            BlendMode.srcIn,
          ),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
