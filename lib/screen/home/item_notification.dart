import 'package:flutter/material.dart';

class ItemNotification extends StatelessWidget{
  final String title;
  final String content;
  const ItemNotification({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w700),),
        const SizedBox(height: 8,),
        Text(content,style: TextStyle(color: Colors.grey.shade800),)
      ],
    );
  }
}