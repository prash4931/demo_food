import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';

CustomProgressDialog loadingDialog({required BuildContext context}) {
  final CustomProgressDialog progressDialog =
      CustomProgressDialog(context, blur: 10);

  ///You can set Loading Widget using this function
  progressDialog.setLoadingWidget(const CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Colors.red)));

  return progressDialog;
}

CustomProgressDialog loadingPleaseWaitDialog(
    {required BuildContext context, String? loadingText}) {
  final CustomProgressDialog progressDialog = CustomProgressDialog(
    context,
    blur: 10,
    dismissable: false,
  );

  ///You can set Loading Widget using this function
  progressDialog.setLoadingWidget(Card(
    child: Row(
      children: [
        const Padding(
          padding: EdgeInsets.all(18.0),
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.black)),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(loadingText ?? 'Please wait....'),
          ),
        ),
      ],
    ),
  ));

  return progressDialog;
}
