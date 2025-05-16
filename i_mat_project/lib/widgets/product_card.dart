import 'package:flutter/material.dart';
import 'package:i_mat_project/providers/cart_provider.dart';
import 'package:provider/provider.dart';
import 'auto_fade_overflow_text.dart';

class ProductCard extends StatefulWidget {
  final Map<String, dynamic> product;
  final VoidCallback onAddToCart;

  const ProductCard(this.product, {required this.onAddToCart, super.key});


  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedScale(
        scale: _isHovered ? 1.05 : 1.0,
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          margin: EdgeInsets.symmetric(horizontal: 10),
          elevation: _isHovered ? 8 : 4,
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
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        widget.product['imageUrl'],
                        fit: BoxFit.contain,
                        height: imageHeight,
                        width: double.infinity,
                        errorBuilder: (context, error, stackTrace) => Icon(
                          Icons.broken_image,
                          size: imageHeight * 0.6,
                          color: Colors.grey[400],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    AutoFadeOverflowText(
                      text: widget.product['name'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    if (widget.product['country'] != '')
                      Text(
                        '${widget.product['country']}, ${widget.product['weight']}',
                        style: TextStyle(fontSize: 12, color: Colors.black54),
                      )
                    else
                      Text(
                        widget.product['weight'],
                        style: TextStyle(fontSize: 12, color: Colors.black54),
                      ),
                    SizedBox(height: 4),
                    Text(
                      widget.product['price'],
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.product['pricePerKg'],
                      style: TextStyle(color: Colors.grey),
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () {
                          Provider.of<CartProvider>(context, listen: false).addToCart(widget.product);
                        },
                        borderRadius: BorderRadius.circular(20),
                        child: CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 16,
                          child: Icon(Icons.add, color: Colors.white, size: 20),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
