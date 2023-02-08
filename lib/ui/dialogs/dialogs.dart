import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:smsrly/ui/dialogs/password_dialog.dart';


class Dialog extends StatelessWidget {
  const Dialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Dialogs(),
    );
  }
}

class Dialogs extends StatefulWidget {
  const Dialogs({Key? key}) : super(key: key);

  @override
  State<Dialogs> createState() => _DialogsState();
}

class _DialogsState extends State<Dialogs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () => AwesomeDialog(
                    context: context,
                    dialogType: DialogType.warning,
                    animType: AnimType.topSlide,
                    title: "Delete Account !",
                    desc: "Are you sure that you want to delete your account ?",
                    btnCancelOnPress: () => print("Canceled"),
                    btnOkOnPress: () => print("Ok"),
                  ).show(),
              child: const Text("Click")),
          ElevatedButton(
              onPressed: () => showDialog(
                    context: context,
                    builder: (context) {
                      return PasswordDialog(onSubmit: (){
                        print('Okay');
                        },);
                    },
                  ),
              child: const Text("Click"))
        ],
      ),
    );
  }
}
