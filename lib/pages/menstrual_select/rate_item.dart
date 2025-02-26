
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class RateItem extends StatelessWidget {
  final double value;
  final Function(double) onChange;
  final double? starSize;
  const RateItem({
    super.key,
    required this.value,
    required this.onChange,
    this.starSize,
  });

  @override
  Widget build(BuildContext context) {
    return RatingStars(
      value: value,
      onValueChanged: (v) {
        onChange.call(v);
      },
      starBuilder: (index, color) {
        if (color == const Color(0xfff21e1e)) {
          return Image.asset('assets/iconLight.webp',width: 17,height: 26,fit: BoxFit.contain,);
        }
        return Image.asset('assets/iconGrey.webp',width: 17,height: 26,fit: BoxFit.contain,);
      },
      starCount: 5,
      starSize: starSize ?? 26,
      maxValue: 5,
      starSpacing: 0,
      maxValueVisibility: false,
      valueLabelVisibility: false,
      animationDuration: const Duration(milliseconds: 1000),
      starOffColor: Colors.transparent,
      starColor:const Color(0xfff21e1e),
    );
  }
}
