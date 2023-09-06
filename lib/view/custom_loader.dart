import 'package:flutter/material.dart';

import '../utils/dimensions.dart';
class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(
      height: 100, width: 100,
      decoration: BoxDecoration(color: Theme.of(context).cardColor, borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL)),
      alignment: Alignment.center,
      child: const CircularProgressIndicator(),
    ));
  }
}
