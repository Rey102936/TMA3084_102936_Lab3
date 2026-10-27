import 'package:flutter/material.dart';

void main() {
  runApp(const RestaurantMenuApp());
}
class CartItem {
  final String name;
  final String imagePath;
  final double price;
  int quantity;

  CartItem({
    required this.name,
    required this.imagePath,
    required this.price,
    this.quantity = 1,
  });
}

class RestaurantMenuApp extends StatelessWidget {
  const RestaurantMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant Menu',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const MenuScreen(),
    );
  }
}

// 1. MAIN MENU SCREEN
class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant Menu'),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            FoodCard(
              name: 'Vegetable Pizza',
              imagePath: 'assets/vegetables_pizza.png',
              price: 'RM 18.00',
              description: 'Loaded with fresh veggies, mushrooms, onions, and melted mozzarella cheese.',
            ),
            FoodCard(
              name: 'Cheese Pizza',
              imagePath: 'assets/cheese_pizza.png',
              price: 'RM 14.00',
              description: 'Classic cheese pizza topped with rich tomato sauce and extra mozzarella.',
            ),
            FoodCard(
              name: 'Chicken Pizza',
              imagePath: 'assets/chicken_pizza.png',
              price: 'RM 16.00',
              description: 'Tender grilled chicken pieces topped with savory BBQ sauce, onions, and melted mozzarella cheese.',
            ),
          ],
        ),
      ),
    );
  }
}

// REUSABLE FOOD CARD WIDGET WITH NAVIGATION (EXTRA TASK)
class FoodCard extends StatelessWidget {
  final String name;
  final String imagePath;
  final String price;
  final String description;

  const FoodCard({
    super.key,
    required this.name,
    required this.imagePath,
    required this.price,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: const EdgeInsets.all(10.0),
      color: Colors.deepOrangeAccent,
      elevation: 8.0,
      child: InkWell(
        // Extra Task: Navigation on Tap
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodDetailScreen(
                name: name,
                imagePath: imagePath,
                price: price,
                description: description,
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  imagePath,
                  width: 90.0,
                  height: 90.0,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.fastfood,
                    size: 80,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 20.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 22.0,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      price,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// EXTRA TASK: FOOD DETAIL SCREEN
class FoodDetailScreen extends StatelessWidget {
  final String name;
  final String imagePath;
  final String price;
  final String description;

  const FoodDetailScreen({
    super.key,
    required this.name,
    required this.imagePath,
    required this.price,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  imagePath,
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.fastfood,
                    size: 150,
                    color: Colors.deepOrangeAccent,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              name,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              price,
              style: const TextStyle(
                fontSize: 22,
                color: Colors.deepOrange,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}