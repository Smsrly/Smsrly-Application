import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smsrly/ui/widgets/others/d_progress_bar.dart';
import 'package:smsrly/ui/widgets/realestates_items/realestate_third_item.dart';
import 'package:smsrly/utils/helpers/extensions.dart';
import 'package:smsrly/viewmodel/ads_viewmodel.dart';

import '../../models/realestate.dart';
import '../../res/colors.dart';
import '../../res/strings.dart';
import '../../utils/routes/route_name.dart';

class Uploaded extends StatelessWidget{
  const Uploaded({super.key});


/*
                  InkWell(
                        child: Container(
                            margin: const EdgeInsets.all(5),
                            width: 25,
                            height: 30,
                            child: Image.asset(hasSaved?"assets/images/saved_btn.png":"assets/images/save_btn.png")
                        ),
                        onTap: (){
                          onSaveIconSelected!();
                        },
                      ),
 */


  void navigateToShowDetail(BuildContext context){

  }


  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AdsViewModel>(context,listen: false);
    Future.delayed(Duration.zero,(){
      viewModel.getUploadedItems(false);
    });
    return Scaffold(
      body: RefreshIndicator(
        color: primaryColor,
        onRefresh: ()async{
          viewModel.getUploadedItems(true);
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Consumer<AdsViewModel>(
            builder: (_,viewModel,__){
              if(viewModel.isLoading || viewModel.uploadedItems == null){
                return const Center(
                  child: DefaultProgressBar(),
                );
              } else{
                return ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: viewModel.uploadedItems?.length,
                    itemBuilder: (context,index){
                      return ThirdItem(
                          realEstate: viewModel.uploadedItems![index],
                          saveButton: const SizedBox(),);
                    }
                );
              }
            },
          ),
        ),
      )
    );
  }
}