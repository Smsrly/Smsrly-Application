import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static getToast(String msg, int i) {
    Fluttertoast.showToast(
      msg: msg ,
      toastLength: i == 0 ? Toast.LENGTH_SHORT : Toast.LENGTH_LONG,
      // gravity: ToastGravity.BOTTOM,
    );
  }
}
