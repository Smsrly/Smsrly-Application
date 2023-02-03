import 'package:flutter/material.dart';

import 'requested.dart';
import 'save.dart';
import 'uploaded.dart';

class MyAdds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 70,
            backgroundColor: Colors.blue[800],
            title: const Text("My Adds"),
            bottom: TabBar(
              indicatorWeight: 2,
              indicatorColor: Colors.white,
              tabs: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  child: const Text(
                    "UPLOADED",
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'IBMPlexSans',
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  child: const Text(
                    "REQUESTED",
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'IBMPlexSans',
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    child: const Text(
                      "SAVED",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'IBMPlexSans',
                          fontWeight: FontWeight.w400),
                    )),
              ],
            ),
          ),
          body: TabBarView(
            children: [Uploaded(), Requested(), Saved()],
          ),
        ));
  }
}
