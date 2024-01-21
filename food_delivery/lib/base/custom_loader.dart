import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';
import '../utils/colors.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: Dimentions.height20*5,
        width: Dimentions.height20*5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimentions.height20*5/2),
          color:  AppColors.mainColor
        ),
        alignment: Alignment.center,
        child: const CircularProgressIndicator(color: Colors.white,),
      ),
    );
  }
}