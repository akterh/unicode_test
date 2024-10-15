
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/app/flavors.dart';

late SharedPreferences prefs;

class AppError {
  //final slack = SlackLogger.instance;
  String line = "===================================================";

  void logError(Object error, StackTrace stackTrace) {
    // Log to console
    print('Caught error: $error\n$stackTrace ');
    print(stackTrace);
    // Send to an external logging service (e.g., Sentry, Firebase Crashlytics)
  }

  Future<void> allAppError(
      {error, message, from = "app", color, requestParams}) async {
    prefs = await SharedPreferences.getInstance();

    /* SlackLogger.instance.sendTextAsAttachment(
      message:
          "error from Zytrack : $from\n$line\nemail : ${prefs.getString("prepsUserEmail")}\ndate & time : ${DateTime.now()}\n$line\nApi Request params :\n${requestParams ?? "No Request"}\n$line\n $error \n $message",
      color: color ?? getColor(), // Red color for error messages
      // Red color for error messages
    );*/
  }

  String getColor() {
    if (AppFlavor.getFlavor == FlavorStatus.production) {
      return "FF0000";
    } else if (AppFlavor.getFlavor == FlavorStatus.development) {
      return "#DFFF00";
    } else {
      return "#FF69B4";
    }
  }
}
