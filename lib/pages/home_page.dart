import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_delivery/animation/fade_animation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        //inkwell makes any widget clickable
        leading: InkWell(
          child: const Icon(Icons.home),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              log("This is the basket", name: "Basket Button");
            },
            icon: Icon(
              Icons.shopping_basket,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeAnimation(
                    delay: 1,
                    child: Text(
                      'Food Delivery',
                      style: TextStyle(
                          color: Colors.grey[80],
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        FadeAnimation(
                          delay: 1,
                          child: makeCategory(isActive: true, title: 'Pizza'),
                        ),
                        FadeAnimation(
                          delay: 1.3,
                          child: makeCategory(isActive: true, title: 'Burgers'),
                        ),
                        FadeAnimation(
                          delay: 1.4,
                          child: makeCategory(isActive: false, title: 'Kebab'),
                        ),
                        FadeAnimation(
                          delay: 1.5,
                          child:
                              makeCategory(isActive: false, title: 'Desserts'),
                        ),
                        FadeAnimation(
                          delay: 1.6,
                          child: makeCategory(isActive: false, title: 'Salad'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            FadeAnimation(
              delay: 1,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Free Delivered',
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    FadeAnimation(
                      delay: 1.4,
                      child: makeItem(
                          image: 'assets/img/pomegrante.jpg',
                          title: 'Pomegranate',
                          price: '\$15.00'),
                    ),
                    FadeAnimation(
                      delay: 1.5,
                      child: makeItem(
                          image: 'assets/img/ads.jpg',
                          title: 'Lintel Soup',
                          price: '\$10.00'),
                    ),
                    FadeAnimation(
                      delay: 1.6,
                      child: makeItem(
                          image: 'assets/img/salad.jpg',
                          title: 'Lintel Soup',
                          price: '\$8.50'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }

  Widget makeCategory({isActive, title}) {
    return AspectRatio(
      aspectRatio: isActive ? 3 : 2.5 / 1,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: isActive ? Colors.yellow[700] : Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Align(
          child: Text(
            title,
            style: TextStyle(
                color: isActive ? Colors.white : Colors.grey[500],
                fontSize: 18,
                fontWeight: isActive ? FontWeight.bold : FontWeight.w100),
          ),
        ),
      ),
    );
  }

  Widget makeItem({image, title, price}) {
    return AspectRatio(
      aspectRatio: 1 / 1.5,
      child: GestureDetector(
        child: Container(
          margin: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                stops: const [.2, .9],
                colors: [
                  Colors.black.withOpacity(.9),
                  Colors.black.withOpacity(.3),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        price,
                        style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        title,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
