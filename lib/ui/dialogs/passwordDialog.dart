import 'package:flutter/material.dart';

class PasswordDialog extends StatefulWidget {
  const PasswordDialog({super.key});

  @override
  State<PasswordDialog> createState() => _PasswordDialogState();
}

class _PasswordDialogState extends State<PasswordDialog> {
  bool currentPasswordIsHide = true;
  bool newPasswordIsHide = true;
  bool confirmPasswordIsHide = true;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 390,
        width: 300,
        child: Column(children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 26),
                child: Container(
                  alignment: Alignment.center,
                  child: const Text("Privacy Information",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'IBMPlexSans',
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                child: IconButton(
                    alignment: AlignmentDirectional.topEnd,
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close)),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Container(
              alignment: Alignment.topLeft,
              child: const Text("Current Password",
                  style: TextStyle(fontSize: 16, color: Colors.black)),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: SizedBox(
                height: 50,
                child: TextField(
                  obscureText: currentPasswordIsHide,
                  decoration: InputDecoration(
                      suffixIcon: InkWell(
                          onTap: () => setState(() {
                                currentPasswordIsHide = !currentPasswordIsHide;
                              }),
                          child: currentPasswordIsHide == true
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off)),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(14)))),
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 5),
            child: Container(
              alignment: Alignment.topLeft,
              child: const Text("New Password",
                  style: TextStyle(fontSize: 16, color: Colors.black)),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: SizedBox(
                height: 50,
                child: TextField(
                  obscureText: newPasswordIsHide,
                  decoration: InputDecoration(
                      suffixIcon: InkWell(
                          onTap: () => setState(() {
                                newPasswordIsHide = !newPasswordIsHide;
                              }),
                          child: newPasswordIsHide == true
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off)),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(14)))),
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 5),
            child: Container(
              alignment: Alignment.topLeft,
              child: const Text("Confirm Password",
                  style: TextStyle(fontSize: 16, color: Colors.black)),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: SizedBox(
                height: 50,
                child: TextField(
                  obscureText: confirmPasswordIsHide,
                  decoration: InputDecoration(
                      suffixIcon: InkWell(
                          onTap: () => setState(() {
                                confirmPasswordIsHide = !confirmPasswordIsHide;
                              }),
                          child: confirmPasswordIsHide == true
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off)),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(14)))),
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 14),
            child: ElevatedButton(
              onPressed: () => print("Submitted"),
              style: const ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
                  backgroundColor: MaterialStatePropertyAll(Color(0xFF0E5289)),
                  fixedSize: MaterialStatePropertyAll(Size(150, 45))),
              child: const Text("Submit"),
            ),
          )
        ]),
      ),
    );
  }
}
