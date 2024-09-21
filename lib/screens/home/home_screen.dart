import 'package:ecommerce_mobile_app/constants.dart';
import 'package:ecommerce_mobile_app/models/product.dart';
import 'package:ecommerce_mobile_app/screens/home/Widget/categories.dart';
import 'package:ecommerce_mobile_app/screens/home/Widget/home_app_bar.dart';
import 'package:ecommerce_mobile_app/screens/home/Widget/image_Slider.dart';
import 'package:ecommerce_mobile_app/screens/home/Widget/my_search_bar.dart';
import 'package:ecommerce_mobile_app/screens/home/Widget/product_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSlider = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            const CustomerAppBar(),
            const SizedBox(height: 20),
            const MySearchBar(),
            const SizedBox(height: 20),
            ImageSlider(
              currentSlide: currentSlider,
              onChange: (value) {
                setState(() {
                  currentSlider = value;
                });
              },
            ),
            const SizedBox(height: 20),
            const Categories(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Special For You",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const Text(
                  "See all",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
                GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.78,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return ProductCard(product: products[index]);
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
