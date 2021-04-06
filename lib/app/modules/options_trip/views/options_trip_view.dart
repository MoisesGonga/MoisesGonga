import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:app_driver/app/modules/home/views/home_view.dart';
//import 'package:wigoo_design_tips/app/ui/android/client/home/pages/search-driver.dart';
import 'package:app_driver/app/utils/components/CustomSVGIcons.dart';
import 'package:app_driver/app/utils/components/DrawerMenu.dart';
import 'package:app_driver/app/utils/config/setting_cli.dart';
import 'package:app_driver/app/modules/search_driver/views/search_driver_view.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';

import '../controllers/options_trip_controller.dart';

class OptionsTripView extends GetView<OptionsTripController> {
  final List<String> _carType = ['Económico', 'Conforto', 'VIP'];

  var _carTypePrice = [1000, 2500, 7500];
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> _payment_type = [
    'Multicaixa',
    'Carteira',
    'Transferência Bancária'
  ];
  String _paymentTypeSelected = '';

  ChooseTaxiPage() {
    controller.getDrawPlaceTrip();
  }

  @override
  Widget build(BuildContext context) {
    // print(controller.sourceAddress.mainText);

    return Scaffold(
      key: _scaffoldKey,
      drawer: Container(width: 300, color: Colors.white, child: DrawerMenu()),
      drawerEnableOpenDragGesture: true,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
              padding: EdgeInsets.only(top: 179),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x29000000),
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Obx(() => GoogleMap(
                    markers: Set.of(controller.markers),
                    initialCameraPosition: CameraPosition(
                      target: controller.center.value,
                      zoom: 14.0,
                    ),
                    polylines: controller.polylines,
                    onMapCreated: controller.onMapCreated,
                    zoomGesturesEnabled: true,
                    onCameraMove: controller.onCameraMove,
                    myLocationEnabled: true,
                    compassEnabled: false,
                    myLocationButtonEnabled: true,
                    mapToolbarEnabled: false,
                    //onTap: ,
                  ))),

          Positioned(
            top: 44,
            left: 15,
            right: 0,
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x29000000),
                          offset: Offset(0, 2),
                          blurRadius: 9,
                        ),
                      ],
                    ),
                    child: RaisedButton(
                        elevation: 0,
                        color: Colors.black,
                        child: Container(
                          width: 50,
                          child: SizedBox(
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        shape: CircleBorder(),
                        onPressed: () {
                          Get.offAll(HomeView(),
                              transition: Transition.leftToRight);
                        }),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Container(
                        //color: const Color(0xfff4b503),
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
                              height: 1.1666666666666667,
                            ),
                            children: [
                              TextSpan(
                                text: 'Ola, ',
                              ),
                              TextSpan(
                                text: '$CURRENT_USER\n',
                                style: TextStyle(
                                  color: const Color(0xfff4b503),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              TextSpan(
                                text: 'Escolha o tipo de taxi!',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
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

          //Search bar

          Positioned(
            top: 120,
            left: 20,
            right: 20,
            child: Container(
              width: 0,
              height: 130,
              padding: EdgeInsets.only(left: 5, top: 15, bottom: 15, right: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: const Color(0xffffffff),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x33303030),
                    offset: Offset(0, 5),
                    blurRadius: 15,
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 73,
                      child: SvgPicture.asset(
                        CustomSVGIcons.POINT_DIRECTION,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 9,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${SOURCE_ADDRESS_USER?.secondaryText ?? ""}',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 11,
                                color: const Color(0xff707070),
                                fontWeight: FontWeight.w300,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              ' ${SOURCE_ADDRESS_USER?.mainText ?? ""}',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                color: const Color(0xff303030),
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(
                              height: 0,
                            ),
                            Center(
                              child: Container(
                                height: 3,
                                decoration: BoxDecoration(
                                  color: const Color(0xfff6f6f6),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                            ),
                            Text(
                              '${DESTINATION_ADDRESS_USER?.secondaryText ?? ""}',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 11,
                                color: const Color(0xff707070),
                                fontWeight: FontWeight.w300,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              '${DESTINATION_ADDRESS_USER?.mainText ?? ""}',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                color: const Color(0xff303030),
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.left,
                            )
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ),

          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.30,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: const Color(0x33303030),
                            offset: Offset(0.7, 0.7),
                            blurRadius: 50,
                            spreadRadius: 0.5),
                      ],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  child: Padding(
                    padding: EdgeInsets.only(left: 0, top: 15, bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            height: 3,
                            width: 134,
                            decoration: BoxDecoration(
                              color: const Color(0xffC3CDD6),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            'Opções da Viagem:',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              color: const Color(0xff303030),
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 0.0),
                            height: MediaQuery.of(context).size.height * 0.105,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: _carType.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Container(
                                        width: 166.0,
                                        height: 72.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          color: index == 0
                                              ? const Color(0xfff4b503)
                                              : Colors.black45,
                                          boxShadow: [
                                            BoxShadow(
                                              color: const Color(0x33303030),
                                              offset: Offset(0, 5),
                                              blurRadius: 15,
                                            ),
                                          ],
                                        ),
                                        child: Stack(
                                          children: [
                                            Positioned(
                                                left: 10,
                                                top: 15,
                                                child: Text.rich(
                                                  TextSpan(
                                                    style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      fontSize: 12,
                                                      color: const Color(
                                                          0xffffffff),
                                                    ),
                                                    children: [
                                                      TextSpan(
                                                        text:
                                                            '${_carType[index].toString()}\n',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            'Kz ${_carTypePrice[index].toString()}\n',
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        style: TextStyle(
                                                          fontSize: 8,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                        text:
                                                            'Preço estimado \n',
                                                      ),
                                                    ],
                                                  ),
                                                  textAlign: TextAlign.left,
                                                )),
                                            Positioned(
                                                right: -140,
                                                top: 0,
                                                bottom: 0,
                                                left: 0,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/images/car-static.png"),
                                                      fit: BoxFit.scaleDown,
                                                    ),
                                                  ),
                                                ))
                                          ],
                                        )),
                                  );
                                })),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: SvgPicture.asset(
                                CustomSVGIcons.PAYMENT,
                                allowDrawingOutsideViewBox: true,
                                fit: BoxFit.cover,
                                height: 28,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 3,
                              child: GetBuilder(builder: (controller) {
                                return DropdownButton<String>(
                                  hint: Text("Forma Pagamento"),
                                  isExpanded: true,
                                  items: _payment_type
                                      .map((String dropDownStringItem) {
                                    return DropdownMenuItem<String>(
                                      value: dropDownStringItem,
                                      child: Text(dropDownStringItem),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    _paymentTypeSelected = value;
                                  },
                                );
                              }),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: RaisedButton(
                                onPressed: () {
                                  Get.to(SearchDriverView(),
                                      transition: Transition.fadeIn);
                                },
                                color: Color(0xfff4b503),
                                child: Text(
                                  'Confirmar',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 13,
                                    color: const Color(0xffffffff),
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                textColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(12.0),
                                ),
                                padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
