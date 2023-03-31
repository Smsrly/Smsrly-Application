import 'package:flutter/foundation.dart';

import '../models/user.dart';

class AppViewModel with ChangeNotifier{
  User? currUser;
}