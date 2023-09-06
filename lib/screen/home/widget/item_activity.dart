import 'package:flutter/material.dart';
import 'package:timesheet/data/model/body/activity.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ItemActivity extends StatelessWidget {
  final Activity activity;
  const ItemActivity({super.key, required this.activity,});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: activity.colorParent
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: activity.colorChild
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                      style: GoogleFonts.nunitoSans(
                        fontSize: 12,fontWeight: FontWeight.w700
                      ),
                      children: [
                        TextSpan(text: 'Tháng ${activity.dateTime.month}'),
                        TextSpan(text: '\n${activity.dateTime.day}',style: GoogleFonts.nunitoSans(
                            fontSize: 18,fontWeight: FontWeight.w800
                        )),
                        TextSpan(text: '\n${getDayOfWeek(activity.dateTime.weekday)}'),
                      ]
                    ),)
                  ),
                ),
                const SizedBox(width: 20,),
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                      style: GoogleFonts.nunitoSans(
                          fontSize: 14,fontWeight: FontWeight.w400
                      ),
                      children: [
                        TextSpan(text: DateFormat('h:mm a').format(activity.dateTime)),
                        TextSpan(text: '\n${activity.title}',style: GoogleFonts.nunitoSans(
                            fontSize: 18,fontWeight: FontWeight.w800
                        )),
                        TextSpan(text: '\n${activity.content}'),
                      ]
                  ),),
              ],
            ),
            const Positioned(
              top: 0,
                right: 0,
                child: InkWell(
              child: Icon(Icons.more_horiz,color: Colors.white,),
            ))
          ],
        ),
      ),
    );
  }
  String getDayOfWeek(int value){
    switch (value) {
      case 1: return 'Thứ 2';
      case 2: return 'Thứ 3';
      case 3: return 'Thứ 4';
      case 4: return 'Thứ 5';
      case 5: return 'Thứ 6';
      case 6: return 'Thứ bảy';
      case 7: return 'Chủ nhật';
      default: return 'Invalid weekday';
    }
  }
}
