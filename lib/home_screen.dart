import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:picolo/common/route_list.dart';

class HomeScreen extends StatelessWidget {
  late String barcodeScanRes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Picolo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildListTile(context, 'Enter pallet number', () {
              showAlertDialogForPalletInsertion(context);
            }, trailingIcon: Icon(Icons.airline_seat_flat_angled)),
            SizedBox(height: 45),
            buildListTile(context, 'Scan Barcode', () async {
              try {
                barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                    '#ff6666', 'Cancel', true, ScanMode.QR);
                Get.toNamed(RouteList.textEntryList);
                print(barcodeScanRes);
              } on PlatformException {
                barcodeScanRes = 'Failed to get platform version.';
                print(barcodeScanRes);
              }
            }, trailingIcon: Icon(Icons.add_box)),
          ],
        ),
      ),
    );
  }

  Widget buildListTile(BuildContext context, String text, void Function() onTap,
      {required Icon trailingIcon}) {
    return Center(
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 25),
        tileColor: Colors.grey[200],
        title: Text(text),
        onTap: onTap,
        trailing: trailingIcon,
      ),
    );
  }

  showAlertDialogForPalletInsertion(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            InkWell(
                onTap: () {
                  Get.back();
                  Get.toNamed(RouteList.textEntryList);
                },
                child: Text("Ok")),
          ],
          title: Text("Enter pallet number"),
          content: TextFormField(),
        );
      },
    );
  }
}
