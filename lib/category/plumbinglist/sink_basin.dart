import 'package:dodo/reuseable.dart';
import 'package:flutter/material.dart';

class BasinSinkPage extends StatefulWidget {
  @override
  _BasinSinkPageState createState() => _BasinSinkPageState();
}

class _BasinSinkPageState extends State<BasinSinkPage> {
  final Cart cart = Cart();
  int quantity1 = 0;
  int quantity2 = 0;
  int quantity3 = 0;
  bool isExpanded = false;

  void incrementQuantity1() {
    setState(() {
      quantity1++;
    });
  }

  void decrementQuantity1() {
    setState(() {
      if (quantity1 > 1) {
        quantity1--;
      }
    });
  }

  void incrementQuantity2() {
    setState(() {
      quantity2++;
    });
  }

  void decrementQuantity2() {
    setState(() {
      if (quantity2 > 1) {
        quantity2--;
      }
    });
  }

  void incrementQuantity3() {
    setState(() {
      quantity3++;
    });
  }

  void decrementQuantity3() {
    setState(() {
      if (quantity3 > 1) {
        quantity3--;
      }
    });
  }

  void toggleExpansion() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basin and Sink'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProductItem(
                image: 'assets/images/plumbing/sink/wastepipe.png',
                name: 'Waste Pipe Leakage',
                price: 188,
                discount: 30,
                timeDuration: 'Time Duration: 1 hour',
                description: 'This service includes fixing waste pipe leakage issues.',
                quantity: quantity1,
                incrementQuantity: incrementQuantity1,
                decrementQuantity: decrementQuantity1,
              ),
              const SizedBox(height: 16),
              _buildProductItem(
                image: 'assets/images/plumbing/sink/blockage.png',
                name: 'Washbasin Blockage Removal',
                price: 255,
                discount: 30,
                timeDuration: 'Time Duration: 1 hour',
                description: 'Description for Product 2',
                quantity: quantity2,
                incrementQuantity: incrementQuantity2,
                decrementQuantity: decrementQuantity2,
              ),
              const SizedBox(height: 16),
              _buildProductItem(
                image: "assets/images/plumbing/sink/washbasin.png",
                name: 'Washbasin Installation',
                price: 647,
                discount: 30,
                timeDuration: 'Time Duration: 1 hour',
                description: 'Description for Product 3',
                quantity: quantity3,
                incrementQuantity: incrementQuantity3,
                decrementQuantity: decrementQuantity3,
              ),
            ],
          ),
        ),
      ),
    );
  }

 _buildProductItem({
  required String image,
  required String name,
  required double price,
  required int discount,
  required String timeDuration,
  required String description,
  required int quantity,
  required void Function() incrementQuantity,
  required void Function() decrementQuantity,
}) {
  final double discountedPrice = price * (1 - (discount / 100));
  final double totalPrice = discountedPrice * quantity;
  bool showFullDescription = description.length <= 100 || isExpanded;
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              width: 100,
              height: 100,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Price: ₹$price',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Discount: $discount% off',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Discounted Price: ₹$discountedPrice',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    timeDuration,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Description: ${showFullDescription ? description : description.substring(100)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  if (description.length > 100)
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: toggleExpansion,
                        child: Icon(
                          isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                          color: Theme.of(context).primaryColor,
                          size: 30,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Container(
              width: 80,
              child: ElevatedButton(onPressed: (){}, 
              child: Text('Add +')),
            )
          ],
        ),
     
     ],
    ),
  );
}
}
