import 'package:flutter/material.dart';
import 'package:kshethra_mini/utils/app_color.dart';
import 'package:kshethra_mini/utils/app_styles.dart';
import 'package:kshethra_mini/utils/asset/assets.gen.dart';
import 'package:kshethra_mini/utils/components/responsive_layout.dart';
import 'package:kshethra_mini/utils/components/size_config.dart';
import 'package:kshethra_mini/view_model/home_page_viewmodel.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.images.backgroundImg.path),
            fit: BoxFit.fill,
          ),
        ),
        child: ResponsiveLayout(
          pinelabDevice: Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: LoginWidget(),
          ),
          mediumDevice: Padding(
            padding: EdgeInsets.only(
              left: SizeConfig.screenWidth * 0.15,
              right: SizeConfig.screenWidth * 0.15,
            ),
            child: LoginWidget(),
          ),
          largeDevice: Padding(
            padding: EdgeInsets.only(
              left: SizeConfig.screenWidth * 0.25,
              right: SizeConfig.screenWidth * 0.25,
            ),
            child: LoginWidget(),
          ),
        ),
      ),
    );
  }
}

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AppStyles styles = AppStyles();
    SizeConfig().init(context);
    return Center(
      child: Consumer<HomePageViewmodel>(
        builder:
            (context, homepageViewmodel, child) => SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    style: styles.whiteRegular18,
                    decoration: InputDecoration(
                      hintText: "User Name",
                      hintStyle: styles.whiteRegular18,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  25.kH,
                  TextField(
                    style: styles.whiteRegular18,
                    obscureText: !homepageViewmodel.isPassVissible,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: homepageViewmodel.tooglePass,
                        icon:
                            homepageViewmodel.isPassVissible
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off),
                      ),
                      hintText: "Password",
                      hintStyle: styles.whiteRegular18,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  55.kH,
                  MaterialButton(
                    onPressed: () {
                      homepageViewmodel.selectLanguagePageNavigate(context);
                    },
                    minWidth: 150,
                    height: 45,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    color: kWhite,
                    child: Text("LOGIN", style: styles.blackRegular18),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
