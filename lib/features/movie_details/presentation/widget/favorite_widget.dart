import 'package:flutter/material.dart';

class FavoriteWidget extends StatefulWidget {
  final bool isFav;
  final VoidCallback onFavTap;

  const FavoriteWidget({
    super.key,
    required this.isFav,
    required this.onFavTap,
  });

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool isFav = false;

  @override
  void initState() {
    super.initState();
    isFav = widget.isFav;
  }

  void _onFavTap() {
    setState(() {
      isFav = !isFav;
    });
    widget.onFavTap.call();
  }

  @override
  Widget build(BuildContext context) {
    if (isFav) {
      return TextButton(
        onPressed: _onFavTap,
        child: Icon(Icons.favorite, color: Colors.red),
      );
    }

    return TextButton(
      onPressed: _onFavTap,
      child: Row(
        children: [
          Icon(Icons.favorite_border, color: Colors.red),
          Text(
            "Add to Favorite",
            style: TextStyle(fontSize: 12, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
