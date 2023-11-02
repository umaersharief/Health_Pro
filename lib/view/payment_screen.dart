import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

import 'BottomNavbar/bottom_navbar.dart';
import 'Cardregistration/Provider/cardregister_provider.dart';
import 'Cardregistration/user_plan_registration.dart';

class PaymentScreen extends StatefulWidget {
  UserPlanRegistration? data;

  PaymentScreen(this.data, {super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

 final CareCardRegiterProvider _provider = CareCardRegiterProvider();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  double progress = 0;

  String Tid = '';
  bool enable = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xFF343a40), //or set color with: Color(0xFF0000FF)
    ));
    return Scaffold(
//         bottomNavigationBar: Visibility(
//           visible: enable,
//           child: InkWell(
//             onTap: () {
//               Get.offAll(() => const BottomNavbar());
// //               // The JSON string from your message
// //               String jsonString = '{ "message": "Tid-0ce770ab-f4dd-4823-91a6-cc061992b76e McsId-1_7252ab57-a284-494f-ae7b-39d06df7cc3c ReferenceId- OrgUnitId-5ed3644ebe828c53f495a253 TxnId- Collect - Post Message Triggered: \\"{\\"MessageType\\":\\"profile.complete\\",\\"Source\\":\\"browser\\",\\"Type\\":\\"DF\\",\\"Nonce\\":\\"8d3178b7-690e-481e-9e29-07406443398e\\",\\"Results\\":[{\\"DataSource\\":\\"CardinalData\\",\\"Status\\":true,\\"ElapsedTime\\":1007}]}", "messageLevel": 0 }';
// //
// //
// //
// //
// // // // Parse the JSON string to a Map
// //               Map<String, dynamic> jsonMap = json.decode(jsonString);
// // //
// // // // Access the MessageType
// // //             String messageType = jsonMap['message'] != null ? jsonMap['message']['MessageType'] : null;
// //               String messageType = jsonMap['message'];
// // //
// // // // Print the MessageType
// // //             print('MessageType: ${messageType}');
// // //             print('MessageType: ${messageType.split('Post Message Triggered: "').last}');
// // //             print('MessageType: ${messageType.split('Post Message Triggered: "').first}');
// //               print('MessageType: ${messageType.split('McsId').first}');
// //
// //               var a = messageType.split('Post Message Triggered: "').last;
// //               // debugPrint(jsonEncode(a));
// //
// //               Map<String, dynamic> b = json.decode(a);
// //
// //               debugPrint('b b :: ${b['Results'][0]['Status']}');
//             },
//             child: Container(
//               height: 40,
//               color: Colors.green,
//               child: const Center(
//                   child: Text(
//                 'Home',
//                 style: TextStyle(color: Colors.white),
//               )),
//             ),
//           ),
//         ),
      body: SafeArea(
        child: Stack(
          children: [
            InAppWebView(
              initialUrlRequest: URLRequest(url: Uri.parse(widget.data?.payurl??'')),
              onWebViewCreated: (controller) async {},
              onLoadStart: (controller, url) async {
                debugPrint('onLoadStart ::$url');
              },
              shouldOverrideUrlLoading: (controller, navigationAction) async {
                return NavigationActionPolicy.ALLOW;
              },
              onLoadStop: (controller, url) async {},
              onProgressChanged: (controller, progress) {
                debugPrint('onProgressChanged ::$progress');
                setState(() {
                  this.progress = progress / 100;
                  // urlController.text = this.url;
                });
              },
              onUpdateVisitedHistory: (controller, url, isReload) {},
              onConsoleMessage: (controller, consoleMessage) {
                debugPrint('onConsoleMessage ::${consoleMessage.message}');

                if (jsonEncode(consoleMessage.message.toString())
                    .contains('Post Message Triggered')) {
                  String messageType = consoleMessage.message;
                  setState(() {
                    Tid = messageType.split('McsId').first;
                  });
                }

                if (jsonEncode(consoleMessage.message.toString())
                        .contains('Status') &&
                    jsonEncode(consoleMessage.message.toString())
                        .contains('true')) {
                  Future.delayed(const Duration(seconds: 5), () {
                    _provider.onSuccess(data: widget.data);
                    Get.offAll(() =>  BottomNavbar(2));
                    setState(() {
                      enable = true;
                    });
                  });
                }
              },
            ),
            progress < 1.0
                ? Center(child: CircularProgressIndicator(value: progress))
                : Container(),
          ],
        ),
      ),
    );
  }
}
