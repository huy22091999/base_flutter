import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:timesheet/controller/scan_qr_controller.dart';

import '../../utils/color_resources.dart';

class InfoAssetScreen extends StatefulWidget {
  final String code;

  const InfoAssetScreen({Key? key, required this.code}) : super(key: key);

  @override
  State<InfoAssetScreen> createState() => _InfoAssetScreenState();
}

class _InfoAssetScreenState extends State<InfoAssetScreen> {
  FToast fToast = FToast();

  @override
  void initState() {
    Get.find<QrController>().getInfoAsset(widget.code);
    print(widget.code);
    fToast.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: const EdgeInsets.only(top: 8, left: 8),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: ColorResources.getMainColor())),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: ColorResources.getMainColor(),
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
          backgroundColor: Colors.white,
          title: const Text('Thông tin tài sản',
              style:
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          centerTitle: true,
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: ColorResources.getMainColor(),
          onPressed: () {
            showDialogNote(context);
          },
          child: const Icon(Icons.note_alt_outlined,color: Colors.white,),
        ),
        body: GetBuilder<QrController>(
          builder: (controller) {
            return Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  controller: ScrollController(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      textInfo(
                          "Mã hệ thống: ", controller.assetInfo?.code ?? "-"),
                      textInfo(
                          "Tên tài sản: ", controller.assetInfo?.name ?? "-"),
                      textInfo("Mã quản lý: ",
                          controller.assetInfo?.managementCode ?? "-"),
                      textInfo("Trạng thái: ",
                          controller.assetInfo?.status?.name ?? "-"),
                      textInfo("Nguyên giá: ",
                          "${controller.assetInfo?.originalCost ?? "-"}",
                          isPrice: true),
                      textInfo("Giá trị còn lại: ",
                          "${controller.assetInfo?.unitPrice ?? "-"}",
                          isPrice: true),
                      textInfo("Ngày tiếp nhận: ",
                          "${controller.assetInfo?.dateOfReception ?? "-"}"),
                      textInfo("Đơn vị tính: ",
                          controller.assetInfo?.unit?.name ?? "-"),
                      textInfo(
                          "Model: ", controller.assetInfo?.serialNumber ?? "-"),
                      textInfo("Seri: ", controller.assetInfo?.name ?? "-"),
                      textInfo("Ngày hết hạn bảo hành: ",
                          controller.assetInfo?.depreciationDate ?? "-"),
                      textInfo(
                          "Phòng quản lý: ",
                          controller.assetInfo?.managementDepartment?.name ??
                              "-"),
                      textInfo("Khoa/Phòng sử dụng: ",
                          controller.assetInfo?.useDepartment?.name ?? "-"),
                      textInfo("Người sử dụng: ",
                          controller.assetInfo?.usePerson?.displayName ?? "-"),
                      textInfo("Hình thức mua sắm: ",
                          controller.assetInfo?.shoppingForm?.name ?? "-"),
                      textInfo(
                          "Phân loại rủi ro: ",
                          controller.assetInfo?.createdBy ??
                              "Loại A- Trang thiết bị có mức độ rủi do thấp"),
                      textInfo("Phân nhóm gói thầu: ",
                          controller.assetInfo?.createdBy ?? "Nhóm 4"),
                      textInfo("Số lưu hành: ",
                          controller.assetInfo?.circulationNumber ?? "-"),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }

  Widget textInfo(String title, String content, {bool? isPrice}) {
    String value = "";
    try {
      value = getAmount(double.parse(content));
    } catch (e) {
      value = content;
    }
    return Container(
        margin: const EdgeInsets.only(top: 8),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: Colors.grey.shade200),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                title,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                isPrice != null && isPrice ? value : content,
                style: TextStyle(
                    color: ColorResources.getPrimaryTextColor(), fontSize: 16),
                maxLines: 3,
                softWrap: true,
              )
            ],
          ),
        ));
  }

  String getAmount(double? price){
    String formattedAmount = NumberFormat.currency(locale: 'vi_VN', symbol: '₫').format(price);
    return formattedAmount;
  }

  void showDialogNote(BuildContext context){
    TextEditingController _noteController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Wrap(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Center(
                  child: Column(
                    children: [
                      const Text(
                        'Ghi chú',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _noteController,
                        maxLines: null,
                        decoration: const InputDecoration(
                            hintText: 'Nội dung',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            )),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Đóng',
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            flex: 1,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      ColorResources.getMainColor()),
                              onPressed: () {
                                Get.find<QrController>()
                                    .saveNoteAsset(_noteController.text)
                                    .then((value) => {
                                          showToast(value.statusCode == 200
                                              ? "Thêm ghi chú thành công!"
                                              : "Đã xảy ra lỗi khi lưu dữ liệu!")
                                        });
                                Navigator.pop(context);
                              },
                              child: const Text('Lưu'),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  void showToast(String content) {
    fToast.showToast(
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Colors.green,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
          child: Text(
            content,
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(milliseconds: 1500),
    );
  }
}
