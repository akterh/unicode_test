

import '../../core/app/flavors.dart';

class ApiUrls {
  static String baseUrl = getServerUrl();
  static const String liveUrl = 'https://unicode_test_app.com/wp-json/'; //live server
  static const String devUrl =
      'https://unicode_test_app.dinnova.at/wp-json/'; // dev server
  static const String testUrl =
      'https://unicode_test_app.dinnova.at/wp-json/'; // test server

  // get current flavor url
  static String getServerUrl() {
    if (AppFlavor.getFlavor == FlavorStatus.production) {
      return liveUrl;
    } else if (AppFlavor.getFlavor == FlavorStatus.development) {
      return devUrl;
    } else if (AppFlavor.getFlavor == FlavorStatus.staging) {
      return testUrl;
    } else {
      return liveUrl;
    }
  }

  // shop module
  static const String login = 'jwt-auth/v1/token';
  static const String products = 'wc/v3/products';
  static const String register = 'wc/v3/customers';
  static const String orders = 'wc/v3/orders';
  static const String category = 'wc/v3/products/categories';
  static const String userProfile = 'wc/v3/customers';
  static const String userProfileUpdate = 'wc/v3/customers';
  static const String cartItems = 'cocart/v2/cart';
  static const String removeCartItems = 'cocart/v2/cart/item/';
  static const String clearCartItems = 'cocart/v2/cart/clear';
  static const String updateCartItems = 'cocart/v2/cart/item/';
  static const String atToCartItems = 'cocart/v2/cart/add-item';
  static const String order = 'wc/v3/orders';
  static const String resetPassword = '/bdpwr/v1/reset-password';
  static const String validateOTPCode = '/bdpwr/v1/validate-code';
  static const String setPassword = 'bdpwr/v1/set-password';
  static const String payLink = 'Invoice/?instance=dinnova';

  static String deliveryCharge(id) {
    return 'wc/v3/shipping/zones/$id/methods';
  }

  static String orderDetails(id) {
    return 'wc/v3/orders/$id';
  }
}
