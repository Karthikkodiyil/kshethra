import 'package:flutter/material.dart';
import 'package:kshethra_mini/utils/app_color.dart';
import 'package:kshethra_mini/utils/app_styles.dart';
import 'package:kshethra_mini/utils/asset/assets.gen.dart';
import 'package:kshethra_mini/utils/components/app_bar_widget.dart';
import 'package:kshethra_mini/utils/components/qr_code_component.dart';
import 'package:kshethra_mini/utils/components/responsive_layout.dart';
import 'package:kshethra_mini/utils/components/size_config.dart';
import 'package:kshethra_mini/view_model/booking_viewmodel.dart';
import 'package:provider/provider.dart';

class BookingPreviewView extends StatelessWidget {
  const BookingPreviewView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      floatingActionButton: ResponsiveLayout(
        pinelabDevice: FloatButtonWidget(),
        mediumDevice: FloatButtonWidget(height: 65),
        largeDevice: FloatButtonWidget(height: 75),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [AppBarWidget(title: "Booking"), PreViewWidget()],
        ),
      ),
    );
  }
}

class PreViewWidget extends StatelessWidget {
  const PreViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AppStyles styles = AppStyles();
    SizeConfig().init(context);
    return Consumer<BookingViewmodel>(
      builder: (context, bookingViewmodel, child) {
        final vazhipaduList = bookingViewmodel.vazhipaduBookingList;
        return SizedBox(
          height: SizeConfig.screenHeight * 0.8,
          width: SizeConfig.screenWidth,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: ListView.builder(
              itemCount: vazhipaduList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 4.0, top: 4.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: kLightPrimaryColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Text(
                          vazhipaduList[index].name,
                          style: styles.blackRegular15,
                        ),
                        Text(
                          vazhipaduList[index].star,
                          style: styles.blackRegular13,
                        ),
                        Container(
                          color: kWhite,
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: vazhipaduList[index].vazhiPad.length,
                            itemBuilder: (context, inde) {
                              final poojaList = vazhipaduList[index].vazhiPad;
                              return Padding(
                                padding: const EdgeInsets.only(
                                  top: 2.0,
                                  bottom: 2,
                                  left: 5,
                                  right: 5,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(poojaList[inde]["vazhipadu"]),
                                        Text(poojaList[inde]["godName"]),
                                      ],
                                    ),
                                    Spacer(),
                                    Text("(${poojaList[inde]["rep"]})"),
                                    25.kW,
                                    SizedBox(
                                      width: 60,
                                      //    color: kGreen,
                                      child: Text(
                                        "₹ ${poojaList[inde]["tPrize"]}",
                                      ),
                                    ),
                                    10.kW,
                                    IconButton(
                                      color: kRed,
                                      onPressed: () {
                                        bookingViewmodel.vazhipaduDelete(
                                          index,
                                          inde,
                                        );
                                      },
                                      icon: Icon(Icons.delete),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class FloatButtonWidget extends StatelessWidget {
  final double? height;
  final double? width;
  const FloatButtonWidget({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    AppStyles styles = AppStyles();
    SizeConfig().init(context);
    return Consumer<BookingViewmodel>(
      builder:
          (context, bookingViewmodel, child) => Padding(
            padding: const EdgeInsets.only(left: 35.0, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    //  homepageViewmodel.navigateBookingPreviewView(context);
                  },
                  child: Container(
                    height: height ?? SizeConfig.screenWidth * 0.135,
                    width: width ?? SizeConfig.screenWidth * 0.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage(Assets.images.homeBackground.path),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "₹ ${bookingViewmodel.totalVazhipaduAmt}",
                        style: styles.whiteRegular20,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => QrScannerComponent(
                              amount: "${bookingViewmodel.totalVazhipaduAmt}",
                              noOfScreen: 4,
                              title: 'Booking',
                            ),
                      ),
                    );
                  },
                  child: Container(
                    height: height ?? SizeConfig.screenWidth * 0.135,
                    width: width ?? SizeConfig.screenWidth * 0.15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage(Assets.images.homeBackground.path),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: kWhite,
                        ),
                        child: Icon(
                          Icons.arrow_forward,
                          color: kDullPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
