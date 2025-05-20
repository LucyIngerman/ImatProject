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
  bool _isButtonHovered = false;

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
            width: 160, // Fixed width
            height: 300, // Fixed height
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    widget.product['imageUrl'],
                    fit: BoxFit.contain,
                    height: 150, // Fixed height for the image
                    width: double.infinity,
                    errorBuilder: (context, error, stackTrace) => Icon(
                      Icons.broken_image,
                      size: 90, // Fixed size for the error icon
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
                  child: MouseRegion(
                    onEnter: (_) => setState(() => _isButtonHovered = true),
                    onExit: (_) => setState(() => _isButtonHovered = false),
                    child: Material(
                      color: Colors.transparent,
                      shape: CircleBorder(),
                      child: InkWell(
                        onTap: () {
                          Provider.of<CartProvider>(context, listen: false).addToCart(widget.product);
                        },
                        borderRadius: BorderRadius.circular(100),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          decoration: BoxDecoration(
                            color: _isButtonHovered ? Colors.red[700] : Colors.red,
                            shape: BoxShape.circle,
                          ),
                          padding: EdgeInsets.all(8),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
