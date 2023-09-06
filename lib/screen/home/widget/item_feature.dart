import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemFeature extends StatelessWidget {
  final String imgPath;
  final String title;
  final Color colorBackground;
  final VoidCallback nextPage;

  const ItemFeature({
    super.key,
    required this.imgPath,
    required this.title,
    required this.colorBackground,
    required this.nextPage,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: nextPage,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              spreadRadius: 0.2,
              blurRadius: 3,
              color: Colors.grey.shade300
            )
          ]
        ),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: colorBackground
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset(imgPath),
                ),
              ),
              const SizedBox(width: 8,),
              Text(title,style: GoogleFonts.nunitoSans(
                fontWeight: FontWeight.w700,
                fontSize: 14
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
