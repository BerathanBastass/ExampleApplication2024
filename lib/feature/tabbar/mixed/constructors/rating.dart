import 'package:examplaapplication2024/core/utils/customcolors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FSRating extends StatelessWidget {
  double rating = 0.0;

  FSRating({
    super.key,
    this.rating = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return _buildStarts(rating);
  }
}

Widget _buildStarts(double rating) {
  List<Widget> _list = [];

  for (double i = 1; i <= 5; i++) {
    if (rating >= i) {
      _list.add(
        const Icon(
          Icons.star,
          color: Colors.yellow,
        ),
      );
    } else if (rating >= i - 0.1 && rating <= (i + 1) - 0.9) {
      _list.add(
        const Icon(
          Icons.star,
          color: Colors.yellow,
        ),
      );
    } else {
      _list.add(
        const Icon(
          Icons.star_half,
          color: Colors.yellow,
        ),
      );
    }
  }

  if (_list.isNotEmpty) {
    return Row(children: _list);
  }

  return const Row(
    children: [
      Icon(Icons.star),
      Icon(Icons.star),
      Icon(Icons.star),
      Icon(Icons.star),
      Icon(Icons.star),
    ],
  );
}
