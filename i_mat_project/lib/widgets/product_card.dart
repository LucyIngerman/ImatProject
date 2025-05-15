import 'package:flutter/material.dart';
import 'auto_fade_overflow_text.dart'; // import the fading text widget

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  ProductCard(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.symmetric(horizontal: 10),
      elevation: 4,
      child: Container(
        width: 160,
        height: 300,
        padding: EdgeInsets.all(10),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final imageHeight = constraints.maxHeight * 0.5;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: imageHeight,
                  child: Image.network(
                    product['imageUrl'],
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => Icon(
                      Icons.broken_image,
                      size: imageHeight * 0.6,
                      color: Colors.grey[400],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                AutoFadeOverflowText(
                  text: product['name'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                if (product['country'] != '')
                  Text(
                    '${product['country']}, ${product['weight']}',
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                if (product['country'] == '')
                  Text(
                    product['weight'],
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                SizedBox(height: 4),
                Text(
                  product['price'],
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  product['pricePerKg'],
                  style: TextStyle(color: Colors.grey),
                ),
                Spacer(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 16,
                    child: Icon(Icons.add, color: Colors.white, size: 20),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
