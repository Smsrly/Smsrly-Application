import 'package:flutter/material.dart';
import 'package:smsrly/res/strings.dart';
import 'package:smsrly/utils/helpers/extensions.dart';

import '../../../models/realestate.dart';


class ThirdItem extends StatelessWidget {
  late RealEstate realEstate;
  Widget saveButton;
  ThirdItem({Key? key, required this.realEstate,required this.saveButton}) : super(key: key);


  Widget infoRow(String image , String value){
    return Row(
      children: [
        SizedBox(
            width: 20,
            height: 20,
            child: Image.asset(image)
        ),
        3.wi,
        Text(value,style: const TextStyle(
          color:
          Color.fromRGBO(
              213, 213, 213, 1
          ),
          fontFamily: StringManager.ibmPlexSans,
          fontWeight: FontWeight.w400,
        ),)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.symmetric(vertical: 6,horizontal: 10),
      width: double.infinity,
      height: 220,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              blurRadius: 5.0,
            )
          ],
        borderRadius: BorderRadius.circular(32)
      ),
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: 220,
            child: Image.network(realEstate.imageUrl![0],
            fit: BoxFit.cover,
            ),

          ),

          Container(
            width: double.infinity,
            decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(begin: Alignment.centerLeft, stops: const [
                  0.1,
                  0.9
                ], colors: [
                  Colors.black.withOpacity(.7),
                  Colors.black.withOpacity(.1)
                ])),
          ),
          Container(
            width: double.infinity,
            height: 220,
            padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(realEstate.title,style: const TextStyle(color: Colors.white,fontSize: 18,fontFamily: 'IBMPlexSans',fontWeight: FontWeight.w400),),
                      saveButton,
                    ],
                  ),
                ),
                const Expanded(flex: 2,child: SizedBox()),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined,color: Color.fromRGBO(
                        213, 213, 213, 1),
                    ),
                    Text(realEstate.city != null && realEstate.country!= null?
                    "${realEstate.country}, ${realEstate.city}"
                        :"${realEstate.latitude}, ${realEstate.longitude}",style: const TextStyle(
                      color:
                      Color.fromARGB(
                          255, 188, 188, 188
                      ),
                      fontFamily: StringManager.ibmPlexSans,
                      fontWeight: FontWeight.w400,
                    ),)
                  ],
                ),
                const Expanded(flex: 1,child: SizedBox()),
                infoRow(StringManager.areaWhite, "${realEstate.area}"),
                const Expanded(flex: 1,child: SizedBox()),
                infoRow(StringManager.stairsWhite, "${realEstate.floor}"),
                const Expanded(flex: 1,child: SizedBox()),
                infoRow(StringManager.bathtubWhite, "${realEstate.bathroomsNo}"),
                const Expanded(flex: 1,child: SizedBox()),
                infoRow(StringManager.bathtubWhite, "${realEstate.roomsNo}"),
                const Expanded(flex: 1,child: SizedBox()),

              ],
            ),
          )
        ],
      ),
    );
  }
}
