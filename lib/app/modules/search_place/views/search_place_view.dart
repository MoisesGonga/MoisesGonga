import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../controllers/search_place_controller.dart';
import 'package:app_driver/app/data/model/place_model.dart';
import 'package:app_driver/app/global/widgets/place-tile.dart';

class SearchPlaceView extends GetView<SearchPlaceController> {
  @override
  final TextEditingController sourceTextEditingController =
      new TextEditingController();
  final TextEditingController destinationTextEditingController =
      new TextEditingController();

  final sourceFocusNode = new FocusNode();
  final destinationFocusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        top: true,
        child: Scaffold(
            floatingActionButton: FloatingActionButton.extended(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              onPressed: () {
                //  Get.to(() => ChooseTaxiPage());
              },
              icon: Icon(
                Icons.check,
                color: Colors.white,
              ),
              label: Text(
                "Confirmar",
                style: TextStyle(fontSize: 16),
              ),
            ),
            appBar: AppBar(
              leading: Padding(
                padding: const EdgeInsets.only(left: 0),
                child: Container(
                  width: 0,
                  height: 0,
                  child: Center(
                    child: RaisedButton(
                        elevation: 0,
                        color: Colors.white,
                        child: Container(
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                        ),
                        shape: CircleBorder(),
                        onPressed: () {
                          Navigator.of(context).pop();
                          // Get.to(WelcomePage(), transition: Transition.rightToLeftWithFade);
                        }),
                  ),
                ),
              ),
              title: Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    color: Colors.black,
                    height: 1.1666666666666667,
                  ),
                  children: [
                    TextSpan(
                      text: 'Defina o destino',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.left,
              ),
              backgroundColor: Colors.white,
              elevation: 1,
            ),
            body: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Column(
                children: [
                  Container(
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
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              child: Icon(
                                Icons.location_pin,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 9,
                              child: Container(
                                padding: EdgeInsets.only(left: 5, right: 20),
                                child: Column(
                                  children: [
                                    TextField(
                                      focusNode: sourceFocusNode,
                                      controller: sourceTextEditingController,
                                      onChanged: (val) {
                                        searchSourcePlace(val);
                                      },
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 18,
                                        color: const Color(0xff000000),
                                        fontWeight: FontWeight.w400,
                                      ),
                                      decoration: InputDecoration(
                                          hintText: "Digite a origem",
                                          hintStyle: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 18,
                                            color: const Color(0xffcccccc),
                                            fontWeight: FontWeight.w500,
                                          ),
                                          border: InputBorder.none),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 3,
                          decoration: BoxDecoration(
                            color: const Color(0xfff6f6f6),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              child: Icon(
                                Icons.location_pin,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 9,
                              child: Container(
                                padding: EdgeInsets.only(left: 5, right: 20),
                                child: Column(
                                  children: [
                                    TextField(
                                      focusNode: destinationFocusNode,
                                      controller:
                                          destinationTextEditingController,
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 18,
                                        color: const Color(0xff000000),
                                        fontWeight: FontWeight.w400,
                                      ),
                                      onChanged: (val) {
                                        searchDestinationPlace(val);
                                      },
                                      decoration: InputDecoration(
                                          hintText: "Digite o destino...",
                                          hintStyle: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 18,
                                            color: const Color(0xffcccccc),
                                            fontWeight: FontWeight.w500,
                                          ),
                                          border: InputBorder.none),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x33303030),
                              offset: Offset(0, 3),
                              blurRadius: 15,
                            ),
                          ],
                        ),
                        child: controller.obx(
                            (state) => state.length > 0
                                ? ListView.separated(
                                    separatorBuilder: (context, index) =>
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Divider(
                                            color: Color(0xffc3dcd6),
                                          ),
                                        ),
                                    itemCount: state.length,
                                    itemBuilder: (context, index) {
                                      return FlatButton(
                                          onPressed: () {
                                            //  String placeId = state.elementAt(index)?.placeId;
                                            //  String placeName = state.elementAt(index)?.mainText;

                                            updateTextField(
                                                state.elementAt(index));
                                          },
                                          child: PlaceTile(
                                              index: index,
                                              place: state.elementAt(index)));
                                    })
                                : Center(
                                    child: Text("Nenhum registo..."),
                                  ),
                            onError: (error) => Center(child: Text(error)))),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  void searchSourcePlace(String placeName) async {
    if (placeName.length > 1) {
      await controller.searchPlace(placeName);
      controller.setCheckTyping(true);
    }
  }

  void searchDestinationPlace(String placeName) async {
    if (placeName.length > 1) {
      await controller.searchPlace(placeName);
      controller.setCheckTyping(false);
    }
  }

  void updateTextField(Place place) {
    if (this.controller.getCheckTyping()) {
      sourceTextEditingController.text = place?.mainText;
      controller.setSourcePlace(place);
    } else {
      destinationTextEditingController.text = place?.mainText;
      controller.setDestinationPlace(place);
    }
  }
}
