import 'package:flutter/material.dart';
import 'package:timesheet/data/model/response/asset_info.dart';
import 'package:timesheet/utils/color_resources.dart';
import 'package:intl/intl.dart';

class Item extends StatelessWidget{
  final AssetInfo asset;
  const Item({super.key, required this.asset});

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
                    child: Text('${asset.code}',style: style,),
                ),
                const SizedBox(height: 14,),
                Text('${asset.name}',style: style,),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    RichText(text: TextSpan(
                      children: [
                        const TextSpan(text: 'Nguyên giá: ',style: TextStyle(color: Colors.black)),
                        TextSpan(text: getAmount(asset.originalCost),style: const TextStyle(color: Colors.deepOrange))
                      ]
                    )),
                    const Spacer(),
                    RichText(text: TextSpan(
                        children: [
                          const TextSpan(text: 'GTCL: ',style: TextStyle(color: Colors.black)),
                          TextSpan(text: getAmount(asset.unitPrice),style: const TextStyle(color: Colors.deepOrange))
                        ]
                    )),
                  ],
                ),
                const SizedBox(height: 10,),
                RichText(text: TextSpan(
                    children: [
                      const TextSpan(text: 'Mã quản lý: ',style: TextStyle(color: Colors.black)),
                      TextSpan(text: '${asset.managementCode}',style: const TextStyle(color: Colors.deepOrange))
                    ]
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
  String getAmount(double? price){
    String formattedAmount = NumberFormat.currency(locale: 'vi_VN', symbol: '₫').format(price);
    return formattedAmount;
  }
}