import 'package:flutter/material.dart';

class OptionsDialog extends StatelessWidget {
  late BuildContext context;
  OptionsDialog({Key? key,required this.context}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
      ),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              Navigator.pop(context,false);
            }, child: const Text("Cancel")
            )
          ],
        ),
      ),
    );;
  }
}
