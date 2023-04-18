import 'package:flutter/foundation.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smsrly/res/strings.dart';
import 'package:smsrly/utils/utils.dart';

class ContactUsViewModel with ChangeNotifier{
  final problems = ["Problem 1", "Problem 2", "Problem 3"];
  String message = "";
  Object? _value;
  Object? get value => _value;
  set value(Object? newValue){
    _value = newValue;
    notifyListeners();
  }
  PickedFile? image;

  void sendMessage()async{
    if(value == null){
      Utils.showToast(StringManager.fieldsCannotBeEmpty, 1);
      return;
    }
    if(message.isEmpty){
      Utils.showToast(StringManager.fieldsCannotBeEmpty, 1);
      return;
    }
    if(image == null){

      final Email email = Email(
        body:  message,
        isHTML: false,
        subject: value as String,
        recipients: ["smsrly2023@gmail.com"],

      );
      await FlutterEmailSender.send(email);

    } else {

      final Email email = Email(
          body:  message,
          isHTML: false,
          subject: value as String,
          recipients: ["smsrly2023@gmail.com"],
          attachmentPaths: [image!.path]
      );
      await FlutterEmailSender.send(email);

    }
  }
}