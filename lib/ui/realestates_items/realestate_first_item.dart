import 'package:flutter/material.dart';

import '../../models/realestate.dart';
class FirstItem extends StatelessWidget {
  late bool hasSaved;
  late RealEstate item;
  VoidCallback? onSaveIconSelected;
  FirstItem({Key? key, required this.item, required this.hasSaved,required this.onSaveIconSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.all(5),
      height: 235,
      width: 261,
      margin: const EdgeInsets.only(top: 10,left: 5,right: 5),
      child: Container(
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                blurRadius: 5.0,
              )
            ],
            borderRadius: BorderRadius.circular(37.0)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        height: 235,
        width: 261,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Image(image: NetworkImage(item.imageUrl),
              fit: BoxFit.cover
              ,
              height: 235,
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment(0.8, -4),
                  colors: <Color>[
                    Color.fromRGBO(0, 0, 0, 0.6),
                    Color.fromRGBO(0, 0, 0, 0.5),
                    Color.fromRGBO(0, 0, 0, 0.4),
                    Color.fromRGBO(0, 0, 0, 0.3),
                    Color.fromRGBO(0, 0, 0, 0.2),
                    Color.fromRGBO(0, 0, 0, 0.1),
                  ],
                  tileMode: TileMode.mirror,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10,bottom: 8,right: 5,top: 8),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Expanded(flex: 1,child: SizedBox()),
                      InkWell(
                        onTap: (){
                          onSaveIconSelected!();
                        },
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          width: 25,
                            height: 30,
                            child: Image.asset(hasSaved?"images/saved_btn.png":"images/save_btn.png")),
                      )
                    ],
                  ),
                  const Expanded(flex: 1,child: SizedBox()),
                  Row(
                    children: [
                      Text(item.title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w300
                        ),
                      ),
                      const Expanded(flex: 1,child: SizedBox()),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children:  [
                      const Icon(Icons.location_on_outlined,color: Color.fromARGB(
                          255, 188, 188, 188),
                      ),
                      Text(item.locationText??"",style: const TextStyle(
                        color:
                        Color.fromARGB(
                            255, 188, 188, 188
                        ),
                        fontWeight: FontWeight.w300,
                      ),)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
