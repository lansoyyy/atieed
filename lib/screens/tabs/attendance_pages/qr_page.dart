import 'package:atieed/screens/tabs/attendance_pages/checked_page.dart';
import 'package:atieed/utlis/colors.dart';
import 'package:atieed/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class QRPage extends StatefulWidget {
  const QRPage({super.key});

  @override
  State<QRPage> createState() => _QRPageState();
}

class _QRPageState extends State<QRPage> {
  String qrCode = 'Unknown';
  String name = '';
  int persons = 0;
  String ride = '';

  Future<void> scanQRCode() async {
    String status = '';
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return const AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
              ],
            ),
          );
        },
      );
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const CheckedPage()));

      if (!mounted) return;

      setState(() {
        this.qrCode = qrCode;
      });
    } on PlatformException {
      qrCode = 'Failed to get platform version.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                      ),
                    ),
                    TextWidget(
                      text: 'QR Code',
                      fontSize: 32,
                      fontFamily: 'Bold',
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            color: primary,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
                          child: Icon(
                            Icons.refresh,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 200,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                      child: Center(
                        child: TextWidget(
                          text: 'November 26, 2030',
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: 'Medium',
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 150,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                      child: Center(
                        child: TextWidget(
                          text: '10:55 am',
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: 'Medium',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: GestureDetector(
                    onTap: () {
                      scanQRCode();
                    },
                    child: Container(
                      width: double.infinity,
                      height: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.qr_code,
                            color: Colors.black,
                            size: 150,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextWidget(
                            text: 'Click to Scan',
                            fontSize: 14,
                            fontFamily: 'Regular',
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        text: 'Results',
                        fontSize: 22,
                        fontFamily: 'Bold',
                      ),
                      Container(
                        width: 115,
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(
                            5,
                          ),
                        ),
                        child: Center(
                          child: TextWidget(
                            text: '6:00 - 7:00',
                            fontSize: 12,
                            color: Colors.black,
                            fontFamily: 'Medium',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Container(
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 115,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: green,
                                  borderRadius: BorderRadius.circular(
                                    20,
                                  ),
                                ),
                                child: Center(
                                  child: TextWidget(
                                    text: 'Active',
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontFamily: 'Medium',
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 150,
                                height: 30,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    20,
                                  ),
                                ),
                                child: Center(
                                  child: TextWidget(
                                    text: 'November 26, 2030',
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontFamily: 'Medium',
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 75,
                                height: 30,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    20,
                                  ),
                                ),
                                child: Center(
                                  child: TextWidget(
                                    text: 'Thu',
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontFamily: 'Medium',
                                  ),
                                ),
                              ),
                              const Expanded(
                                child: SizedBox(
                                  width: 20,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextWidget(
                            text: '1st Semester',
                            fontSize: 12,
                          ),
                          TextWidget(
                            align: TextAlign.start,
                            maxLines: 2,
                            text:
                                'Contemporary Philippine Arts from the Regions',
                            fontSize: 18,
                            fontFamily: 'Bold',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 115,
                                height: 30,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    20,
                                  ),
                                ),
                                child: Center(
                                  child: TextWidget(
                                    text: 'November',
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontFamily: 'Medium',
                                  ),
                                ),
                              ),
                              Container(
                                width: 115,
                                height: 30,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    5,
                                  ),
                                ),
                                child: Center(
                                  child: TextWidget(
                                    text: '6:00 - 7:00',
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontFamily: 'Medium',
                                  ),
                                ),
                              ),
                              Container(
                                width: 115,
                                height: 30,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    5,
                                  ),
                                ),
                                child: Center(
                                  child: TextWidget(
                                    text: '12STEMA2',
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontFamily: 'Medium',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 100,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: green,
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(
                                      20,
                                    ),
                                  ),
                                  child: Center(
                                    child: TextWidget(
                                      text: 'Tue',
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontFamily: 'Medium',
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 100,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: green,
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(
                                      20,
                                    ),
                                  ),
                                  child: Center(
                                    child: TextWidget(
                                      text: 'Wed',
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontFamily: 'Medium',
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 100,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: green,
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(
                                      20,
                                    ),
                                  ),
                                  child: Center(
                                    child: TextWidget(
                                      text: 'Thu',
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontFamily: 'Medium',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
