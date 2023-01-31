import 'package:flutter/material.dart';

class Uploaded extends StatefulWidget{
  @override
  State<Uploaded> createState() => _UploadedState();
}

class _UploadedState extends State<Uploaded> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
       ListView(
         children: [
           Column(
             children: [
              const SizedBox(height: 10,),
               Container(margin:const EdgeInsets.only(left: 10,right: 10),
                 width: double.infinity,
                 child:
                 Container(
                   child: Card(elevation: 15,shape:RoundedRectangleBorder(
                     side:const BorderSide(
                       color: Colors.black,
                     ),
                     borderRadius: BorderRadius.circular(20.0),
                   ),
                     child: Container(
                       decoration: const BoxDecoration(
                       borderRadius:   BorderRadius.all(Radius.circular(23)),
                       image: DecorationImage(
                           image: NetworkImage(
                               "https://user-images.githubusercontent.com/108674357/214273636-b338f7d4-a9fa-45da-9526-60b76271d25c.jpg",
                             scale: 15
                           ),

                           fit: BoxFit.cover),

                     ),
                       child: Padding(
                         padding: const EdgeInsets.only(left: 12.0,top: 12),
                         child:
                         Column(mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Row(
                               children: [
                                 const Text("Royal Sea house",
                                   style: TextStyle(
                                       color: Colors.white,
                                       fontSize: 17
                                   ),
                                 ),
                                 const SizedBox(width: 140,),
                                 Container(width: 50,
                                   padding:  const EdgeInsets.only(left: 2),
                                   decoration:const BoxDecoration(
                                       color:Color.fromRGBO(135, 169, 197, 0.6),
                                       borderRadius: BorderRadius.all(Radius.circular(20))
                                   ),
                                   child: Row(
                                     children: [
                                       const Expanded(child: SizedBox(),flex: 1,),
                                       IconButton(
                                           onPressed: () {},
                                           icon: const Icon(Icons.arrow_forward_ios,color: Colors.white,size:16,)),
                                       const Expanded(child: SizedBox(),flex: 1,),
                                     ],
                                   ),
                                 )
                               ],
                             ),
                             const SizedBox(height: 1,),
                             Row(
                               children: const [
                                 Icon(Icons.location_on_outlined,color: Colors.white,),
                                 Text("Egypt,Alex", style: TextStyle(
                                     color: Colors.white
                                 ),)
                               ],
                             ),
                             const SizedBox(height: 10,),
                             Row(
                               children: const [
                                 Icon(Icons.area_chart,color: Colors.white,),
                                 Text("150m^2", style: TextStyle(
                                     color: Colors.white
                                 ),)
                               ],
                             ),
                             const SizedBox(height: 10,),
                             Row(
                               children: const [
                                 Icon(Icons.stairs,color: Colors.white,),
                                 Text("4", style: TextStyle(
                                     color: Colors.white
                                 ),)
                               ],
                             ),
                             const SizedBox(height: 10,),
                             Row(
                               children: const [
                                 Icon(Icons.bathtub,color: Colors.white,),
                                 SizedBox(width: 0,),
                                 Text("4", style: TextStyle(
                                     color: Colors.white
                                 ),)
                               ],
                             ),
                         const SizedBox(height: 10,),
                             Row(
                               children: const [
                                 Icon(Icons.bed,color: Colors.white,),
                                 SizedBox(width: 0,),
                                 Text("4", style:  TextStyle(
                                     color: Colors.white
                                 ),)
                               ],
                             )
                           ],
                         ),
                       ),
                     ),

                   ),
                 ),
               ),

             ],
           ),

         ],
       )
    );
  }
}