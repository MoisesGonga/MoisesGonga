import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/components/CustomSVGIcons.dart';
import '../../utils/style/style.dart';

import 'package:app_driver/app/modules/payment/views/payment_view.dart';
import 'package:app_driver/app/modules/trip/views/trip_view.dart';
import 'package:app_driver/app/modules/profile/views/profile_view.dart';
import 'package:app_driver/app/modules/wallet/views/wallet_view.dart';
import 'package:app_driver/app/modules/places/views/places_view.dart';

import 'package:hive/hive.dart';
import 'package:app_driver/app/utils/config/setting_cli.dart';

class DrawerMenu extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const DrawerMenu({Key key, this.scaffoldKey}) : super(key: key);

  loadUserName() async {
    print(CURRENT_USER);
    if (CURRENT_USER == null) {
      var hiveDB = Hive.box(APP_DB);
      CURRENT_USER = await hiveDB.get(CLI_USERNAME);
    }
    print(CURRENT_USER);
  }

  @override
  Widget build(BuildContext context) {
    loadUserName();

    return Container(
      child: Drawer(
        elevation: 10,
        child: ListView(
          padding: EdgeInsets.all(0),
          children: [
            Container(
              height: 132,
              child: DrawerHeader(
                decoration: BoxDecoration(color: Colors.white),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: const Color(0xfff4b503),
                          borderRadius: BorderRadius.all(
                              Radius.elliptical(9999.0, 9999.0)),
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/images/user/profile_client.png"),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x29000000),
                              offset: Offset(0, 5),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      flex: 9,
                      child: Container(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                color: const Color(0xff303030),
                                height: 1.4,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Olá, ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextSpan(
                                  text: '',
                                  style: TextStyle(
                                    color: const Color(0xff000000),
                                  ),
                                ),
                                TextSpan(
                                  text: ' \n',
                                  style: TextStyle(
                                    color: const Color(0xfff4b503),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextSpan(
                                  text: '$CURRENT_USER',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: const Color(0xfff4b503),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                          )
                        ],
                      )),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xEFEFEF),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // PROFILE PAGE
            ListTile(
              onTap: () {
                Get.to( ()=>ProfileView(), transition: Transition.leftToRight);
                toggleDrawer();
              },
              leading: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                width: 50,
                child: SvgPicture.asset(
                  CustomSVGIcons.USER_PROFILE,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
              ),
              title: Text(
                'Perfil',
                style: DrawerItemStyle,
                textAlign: TextAlign.left,
              ),
            ),
            // TRIP PAGE
            ListTile(
              onTap: () {
                Get.to( ()=>TripView(), transition: Transition.leftToRight);
                toggleDrawer();
              },
              leading: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                width: 50,
                child: SvgPicture.asset(
                  CustomSVGIcons.TRIP,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
              ),
              title: Text(
                'Viagens',
                style: DrawerItemStyle,
                textAlign: TextAlign.left,
              ),
            ),
            //PLACE PAGE
            ListTile(
              onTap: () {
                Get.to( ()=> PlacesView(), transition: Transition.leftToRight);
                toggleDrawer();
              },
              leading: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                width: 50,
                child: SvgPicture.asset(
                  CustomSVGIcons.PLACE,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
              ),
              title: Text(
                'Locais',
                style: DrawerItemStyle,
                textAlign: TextAlign.left,
              ),
            ),
            ListTile(
              onTap: () {
                Get.to( ()=>WalletView(), transition: Transition.leftToRight);
                toggleDrawer();
              },
              leading: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                width: 50,
                child: SvgPicture.asset(
                  CustomSVGIcons.INCOME,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
              ),
              title: Text(
                'Carteira',
                style: DrawerItemStyle,
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    );
  }

  toggleDrawer() async {
    if (scaffoldKey.currentState.isDrawerOpen) {
      scaffoldKey.currentState.openEndDrawer();
    } else {
      scaffoldKey.currentState.openDrawer();
    }
  }
}
