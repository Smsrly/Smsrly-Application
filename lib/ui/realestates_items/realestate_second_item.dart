import 'package:flutter/material.dart';
import 'package:smsrly/models/realestate.dart';

class SecondItem extends StatelessWidget {
  late RealEstate item;
  late bool hasSaved;
  VoidCallback? onSaveBtn;
  SecondItem({Key? key, required this.item, required this.hasSaved, required this.onSaveBtn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      height: 130,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        color: Colors.white,
        elevation: 25,
        child: SizedBox(
          height: 130,
          child: Row(
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(25.0)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image(
                  width: 120,
                  height: 130,
                  fit: BoxFit.cover,
                  image: NetworkImage(item.imageUrl),
                ),
              ),
              const Expanded(flex: 2, child: SizedBox()),

              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.title,
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w400)),
                  Row(
                    children: [
                      SizedBox(
                          width: 12,
                          height: 16,
                          child: Image.asset("images/black_location_icon.png")),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(item.locationText ?? "",
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(103, 103, 103, 1))),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: 20,
                          height: 20,
                          child: Image.asset("images/area_icon.png")),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        "${item.area} m²",
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(103, 103, 103, 1)),
                      ),
                    ],
                  ),
                  Text("${item.price} EGP",
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(14, 82, 137, 1))),
                ],
              ),
              const Expanded(flex: 5, child: SizedBox()),
              Column(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    margin: const EdgeInsets.all(5),
                      child: InkWell(
                        child: Image.asset(hasSaved?"images/saved_icon_blue.png":"images/save_icon_blue.png"),
                        onTap:(){
                          onSaveBtn!();
                        },
                      )
                  ),
                  const Expanded(flex: 1, child: SizedBox()),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
