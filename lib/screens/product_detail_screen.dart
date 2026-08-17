import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pos_mobile/models/product.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

bool _isProductDetailExpanded = false;
bool _isNutritionExpanded = false;

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int selectedImageIndex = 0;
  late double rating;

  @override
  void initState() {
    super.initState();
    rating = widget.product.rating ?? 0.0;
  }

  @override
  Widget build(BuildContext context) {
    final images = [widget.product.image, ...widget.product.images];

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,

        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
        ),

        actions: [
          IconButton(
            onPressed: () {
              // Share product
            },
            icon: const Icon(Icons.share, color: Colors.black),
          ),

          const SizedBox(width: 10),
        ],
      ),

      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Top Image Section
          Container(
            height: 320,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Stack(
              children: [
                // Images
                CarouselSlider.builder(
                  itemCount: images.length,

                  itemBuilder: (context, index, realIndex) {
                    return SizedBox(
                      width: double.infinity,
                      child: Image.asset(images[index], fit: BoxFit.contain),
                    );
                  },

                  options: CarouselOptions(
                    height: 320,
                    // Infinite scrolling
                    enableInfiniteScroll: true,

                    // Auto play
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration: const Duration(
                      milliseconds: 800,
                    ),

                    // Animation
                    enlargeCenterPage: false,

                    // Update indicator
                    onPageChanged: (index, reason) {
                      setState(() {
                        selectedImageIndex = index;
                      });
                    },
                    viewportFraction: 1.0,
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // Title
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.product.name,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    IconButton(
                      onPressed: () =>
                          setState(() => widget.product.toggleProduct()),
                      icon: Icon(
                        widget.product.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: widget.product.isFavorite
                            ? Colors.red
                            : Colors.black,
                      ),
                    ),
                  ],
                ),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.product.description,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),

                const SizedBox(height: 20),

                // Quantity + Price
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          widget.product.decreaseQty();
                        });
                      },
                    ),

                    Container(
                      width: 40,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(widget.product.quantity.toString()),
                    ),

                    IconButton(
                      onPressed: () {
                        setState(() {
                          widget.product.increaseQty();
                        });
                      },
                      icon: const Icon(Icons.add, color: Colors.green),
                    ),

                    const Spacer(),

                    Text(
                      '\$${(widget.product.price * widget.product.quantity).toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const Divider(height: 40),

                // Product Detail
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isProductDetailExpanded = !_isProductDetailExpanded;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Product Detail",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),

                      Icon(
                        _isProductDetailExpanded
                            ? Icons.keyboard_arrow_down
                            : Icons.keyboard_arrow_right,
                      ),
                    ],
                  ),
                ),

                AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: _isProductDetailExpanded
                      ? Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.product.nutrition ??
                                  'No product details are available.',
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ),
                        )
                      : const SizedBox(),
                ),

                const Divider(height: 40),

                // Nutrition
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isNutritionExpanded = !_isNutritionExpanded;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Nutritions",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),

                      Icon(
                        _isNutritionExpanded
                            ? Icons.keyboard_arrow_down
                            : Icons.keyboard_arrow_right,
                      ),
                    ],
                  ),
                ),

                AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: _isNutritionExpanded
                      ? Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.product.nutrition ??
                                  'No nutrition details are available.',
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ),
                        )
                      : const SizedBox(),
                ),

                const Divider(height: 40),

                // Review
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Review",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),

                    Row(
                      children: [
                        RatingBar.builder(
                          initialRating: rating,
                          minRating: 1,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 22,
                          itemPadding: const EdgeInsets.symmetric(
                            horizontal: 1,
                          ),
                          itemBuilder: (context, _) =>
                              const Icon(Icons.star, color: Colors.orange),
                          onRatingUpdate: (value) {
                            setState(() {
                              rating = value;
                            });

                            // TODO: Send rating to API/database
                            print('New rating: $value');
                          },
                        ),

                        const SizedBox(width: 8),

                        Text(
                          rating.toStringAsFixed(1),
                          style: const TextStyle(color: Colors.grey),
                        ),

                        const SizedBox(width: 4),

                        const Icon(Icons.arrow_forward_ios, size: 14),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // Button
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Add To Basket",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
