import 'package:get/get.dart';

import 'package:app_driver/app/modules/home/bindings/home_binding.dart';
import 'package:app_driver/app/modules/home/views/home_view.dart';

import 'package:app_driver/app/modules/finish_trip/views/finish_trip_view.dart';
import 'package:app_driver/app/modules/finish_trip/bindings/finish_trip_binding.dart';

import 'package:app_driver/app/modules/options_trip/bindings/options_trip_binding.dart';
import 'package:app_driver/app/modules/options_trip/views/options_trip_view.dart';

import 'package:app_driver/app/modules/search_place/bindings/search_place_binding.dart';
import 'package:app_driver/app/modules/search_place/views/search_place_view.dart';


import 'package:app_driver/app/modules/payment/bindings/payment_binding.dart';
import 'package:app_driver/app/modules/payment/views/payment_view.dart';
import 'package:app_driver/app/modules/places/bindings/places_binding.dart';
import 'package:app_driver/app/modules/places/views/places_view.dart';
import 'package:app_driver/app/modules/profile/bindings/profile_binding.dart';
import 'package:app_driver/app/modules/profile/views/profile_view.dart';
import 'package:app_driver/app/modules/trip/bindings/trip_binding.dart';
import 'package:app_driver/app/modules/trip/views/trip_view.dart';
import 'package:app_driver/app/modules/wallet/bindings/wallet_binding.dart';
import 'package:app_driver/app/modules/wallet/views/wallet_view.dart';
import 'package:app_driver/app/modules/welcome/pages/basic_info/bindings/basic_info_binding.dart';
import 'package:app_driver/app/modules/welcome/pages/basic_info/views/basic_info_view.dart';
import 'package:app_driver/app/modules/welcome/bindings/welcome_binding.dart';
import 'package:app_driver/app/modules/welcome/pages/check_telephone/bindings/welcome_check_telephone_binding.dart';
import 'package:app_driver/app/modules/welcome/pages/check_telephone/views/check_telephone_view.dart';
import 'package:app_driver/app/modules/welcome/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.WELCOME;

  static final routes = [
    GetPage(
        name: _Paths.HOME,
        page: () => HomeView(),
        binding: HomeBinding(),
        children: [
          /*GetPage(
            name: _Paths.HOME_SEARCH_PLACES,
            page: () => SearchPlacesView(),
            binding: SearchPlacesBindings(),
          ),
          GetPage(
            name: _Paths.HOME_CHOOSE_TAXI,
            page: () => ChooseTaxiPage(),
            binding: ChooseTaxiBindings(),
          )*/
        ]),
    GetPage(
      name: _Paths.WELCOME,
      page: () => WelcomeView(),
      binding: WelcomeBinding(),
      children: [
        GetPage(
          name: _Paths.WELCOME_CHECK_TELEPHONE,
          page: () => CheckTelephoneView(),
          binding: CheckTelephoneBinding(),
        ),
        GetPage(
          name: _Paths.WELCOME_BASIC_INFO,
          page: () => BasicInfoView(),
          binding: WelcomeBasicInfoBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.TRIP,
      page: () => TripView(),
      binding: TripBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.WALLET,
      page: () => WalletView(),
      binding: WalletBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT,
      page: () => PaymentView(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: _Paths.PLACES,
      page: () => PlacesView(),
      binding: PlacesBinding(),
    ),
    GetPage(
      name: _Paths.FINISH_TRIP,
      page: () => FinishTripView(),
      binding: FinishTripBinding(),
    ),
    GetPage(
      name: _Paths.OPTIONS_TRIP,
      page: () => OptionsTripView(),
      binding: OptionsTripBinding(),
    ),
    
    GetPage(
      name: _Paths.SEARCH_PLACE,
      page: () => SearchPlaceView(),
      binding: SearchPlaceBinding(),
    )
  ];
}
