import 'package:flutter/cupertino.dart';
import 'package:food_delivery/utils/dimensions.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overFlow;
  BigText(
      {super.key,
      this.color = const Color(0xFF332d2d),
      required this.text,
      this.size = 0,
      this.overFlow = TextOverflow.ellipsis});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overFlow,
      style: TextStyle(
        color: color,
        fontSize: size == 0 ? Dimentions.font20 : size,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}