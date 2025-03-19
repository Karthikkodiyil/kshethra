import 'package:flutter/material.dart';
import 'package:kshethra_mini/utils/app_color.dart';
import 'package:kshethra_mini/utils/app_styles.dart';
import 'package:kshethra_mini/utils/components/qr_code_component.dart';
import 'package:kshethra_mini/utils/components/size_config.dart';
import 'package:kshethra_mini/view_model/donation_viewmodel.dart';
import 'package:provider/provider.dart';

class DonationDialogWidget extends StatelessWidget {
  const DonationDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AppStyles styles = AppStyles();
    SizeConfig().init(context);
    return AlertDialog(
      title: Consumer<DonationViewmodel>(
        builder:
            (context, donationViewmodel, child) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  "Enter the amount to Donate",
                  style: styles.blackRegular18,
                ),
                10.kH,
                TextField(
                  controller: donationViewmodel.donationAmountController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: donationViewmodel.clearDonationAmount,
                      icon: Icon(Icons.close),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                10.kH,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        donationViewmodel.popFunction(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => QrScannerComponent(
                                  amount:
                                      donationViewmodel
                                          .donationAmountController
                                          .text
                                          .trim(),
                                  noOfScreen: 3,
                                  title: 'Donation',
                                ),
                          ),
                        );
                      },
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: kDullPrimaryColor, width: 2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text("Pay"),
                    ),
                    MaterialButton(
                      onPressed: () {
                        donationViewmodel.popFunction(context);
                        donationViewmodel.clearDonationAmount();
                      },
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: kDullPrimaryColor, width: 2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text("Cancel"),
                    ),
                  ],
                ),
              ],
            ),
      ),
    );
  }
}
