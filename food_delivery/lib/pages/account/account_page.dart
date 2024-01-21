import 'package:flutter/material.dart';
import 'package:food_delivery/base/custom_loader.dart';
import 'package:food_delivery/data/controllers/auth_controller.dart';
import 'package:food_delivery/data/controllers/cart_controller.dart';
import 'package:food_delivery/data/controllers/user_controller.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/account_widget.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool _userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if (_userLoggedIn) {
      Get.find<UserController>().getUserInfo();
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          title: BigText(
            text: "Profile",
            size: 24,
            color: Colors.white,
          ),
        ),
        body: GetBuilder<UserController>(builder: (userController) {
          return _userLoggedIn
              ? (userController.isLoading
                  ? Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(top: Dimentions.height20),
                      child: Column(children: [
                        //profile icon
                        AppIcon(
                          icon: Icons.person,
                          backgroundColor: AppColors.mainColor,
                          iconColor: Colors.white,
                          iconSize: Dimentions.height45 + Dimentions.height30,
                          size: Dimentions.height20 * 10,
                        ),
                        SizedBox(
                          height: Dimentions.height30,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                //name
                                AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.person,
                                      backgroundColor: AppColors.mainColor,
                                      iconColor: Colors.white,
                                      iconSize: Dimentions.height10 * 5 / 2,
                                      size: Dimentions.height10 * 5,
                                    ),
                                    bigText: BigText(
                                        text: userController.userModel.name)),
                                SizedBox(
                                  height: Dimentions.height20,
                                ),
                                //phone
                                AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.phone,
                                      backgroundColor: AppColors.yellowColor,
                                      iconColor: Colors.white,
                                      iconSize: Dimentions.height10 * 5 / 2,
                                      size: Dimentions.height10 * 5,
                                    ),
                                    bigText: BigText(
                                        text: userController.userModel.phone)),
                                SizedBox(
                                  height: Dimentions.height20,
                                ),
                                //email
                                AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.email,
                                      backgroundColor: AppColors.yellowColor,
                                      iconColor: Colors.white,
                                      iconSize: Dimentions.height10 * 5 / 2,
                                      size: Dimentions.height10 * 5,
                                    ),
                                    bigText: BigText(
                                        text: userController.userModel.email)),
                                SizedBox(
                                  height: Dimentions.height20,
                                ),
                                //address
                                AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.location_on,
                                      backgroundColor: AppColors.yellowColor,
                                      iconColor: Colors.white,
                                      iconSize: Dimentions.height10 * 5 / 2,
                                      size: Dimentions.height10 * 5,
                                    ),
                                    bigText:
                                        BigText(text: "fill in your address")),
                                SizedBox(
                                  height: Dimentions.height20,
                                ),
                                //message
                                AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.message_outlined,
                                      backgroundColor: Colors.redAccent,
                                      iconColor: Colors.white,
                                      iconSize: Dimentions.height10 * 5 / 2,
                                      size: Dimentions.height10 * 5,
                                    ),
                                    bigText: BigText(text: "Messages")),
                                SizedBox(
                                  height: Dimentions.height20,
                                ),
                                //message
                                GestureDetector(
                                  onTap: () {
                                    if (Get.find<AuthController>()
                                        .userLoggedIn()) {
                                      Get.find<AuthController>()
                                          .clearSharedData();
                                      Get.find<CartController>().clear();
                                      Get.find<CartController>()
                                          .clearCartHistory();
                                      Get.offNamed(RouteHelper.getSignInPage());
                                    }
                                  },
                                  child: AccountWidget(
                                      appIcon: AppIcon(
                                        icon: Icons.logout,
                                        backgroundColor: Colors.redAccent,
                                        iconColor: Colors.white,
                                        iconSize: Dimentions.height10 * 5 / 2,
                                        size: Dimentions.height10 * 5,
                                      ),
                                      bigText: BigText(text: "Logout")),
                                ),
                                SizedBox(
                                  height: Dimentions.height20,
                                ),
                              ],
                            ),
                          ),
                        )
                      ]),
                    )
                  : const CustomLoader())
              : Container(
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: double.maxFinite,
                        height: Dimentions.height20 * 8,
                        margin: EdgeInsets.only(
                            left: Dimentions.width20,
                            right: Dimentions.width20),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimentions.radius20),
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    "assets/image/signintocountinue.png"))),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteHelper.getSignInPage());
                        },
                        child: Container(
                          width: double.maxFinite,
                          height: Dimentions.height20 * 5,
                          margin: EdgeInsets.only(
                              left: Dimentions.width20,
                              right: Dimentions.width20),
                          decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            borderRadius:
                                BorderRadius.circular(Dimentions.radius20),
                          ),
                          child: Center(
                            child: BigText(
                              text: "Sign in",
                              color: Colors.white,
                              size: Dimentions.font26,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
                );
        }));
  }
}
