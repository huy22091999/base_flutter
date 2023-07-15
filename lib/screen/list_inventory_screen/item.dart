import 'package:flutter/material.dart';
import 'package:timesheet/utils/color_resources.dart';

import '../../data/model/body/model_ccdc/ccdc.dart';

class Item extends StatelessWidget{
  final CCDC ccdc;
  const Item({super.key, required this.ccdc});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    TextStyle style = TextStyle(color: ColorResources.getMainColor(),fontWeight: FontWeight.bold);
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(7)),
        border: Border.all(width: 1,color: ColorResources.getPrimaryColor())
      ),
      width: width,
      child: Wrap(
        children: [
          Padding(
              padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                    alignment: Alignment.topCenter,
                    child: Text('TS-00000001',style: style,),
                ),
                const SizedBox(height: 14,),
                Text('Bàn vi tính hòa phát (0,6x1,2)m',style: style,),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    RichText(text: TextSpan(
                      children: [
                        const TextSpan(text: 'Nguyên giá: ',style: TextStyle(color: Colors.black)),
                        TextSpan(text: '${ccdc.message}',style: const TextStyle(color: Colors.deepOrange))
                      ]
                    )),
                    const Spacer(),
                    RichText(text: TextSpan(
                        children: [
                          const TextSpan(text: 'GTCL: ',style: TextStyle(color: Colors.black)),
                          TextSpan(text: '${ccdc.timestamp}',style: const TextStyle(color: Colors.deepOrange))
                        ]
                    )),
                  ],
                ),
                const SizedBox(height: 10,),
                RichText(text: TextSpan(
                    children: [
                      const TextSpan(text: 'Mã quản lý: ',style: TextStyle(color: Colors.black)),
                      TextSpan(text: '${ccdc.apiSubErrors}',style: const TextStyle(color: Colors.deepOrange))
                    ]
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}