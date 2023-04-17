import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/realestate.dart';
import '../../res/colors.dart';
import '../../res/strings.dart';
import '../../res/styles.dart';
import '../../utils/routes/route_name.dart';
import '../../viewmodel/ads_viewmodel.dart';
import '../../viewmodel/app_view_model.dart';
import '../../viewmodel/save_realestate_viewmodel.dart';
import '../widgets/others/d_progress_bar.dart';
import '../widgets/realestates_items/realestate_third_item.dart';

class Saved extends StatelessWidget{
  const Saved({super.key});

  @override
  Widget build(BuildContext context) {

    final viewModel = Provider.of<AdsViewModel>(context,listen: false);
    final appViewModel = Provider.of<AppViewModel>(context,listen: false);

    Future.delayed(Duration.zero,(){
      viewModel.getSavedItems(false);
    });

    return Scaffold(
        body: RefreshIndicator(
          color: primaryColor,
          onRefresh: () async {
            viewModel.getSavedItems(true);
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Consumer<AdsViewModel>(
              builder: (_,viewModel,__){
                if(viewModel.isSavedLoading || viewModel.savedItemsList == null){
                  return const Center(
                    child: DefaultProgressBar(),
                  );
                } else{
                  if(viewModel.savedItemsList != null && viewModel.savedItemsList!.isNotEmpty){
                    return ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: viewModel.savedItemsList?.length,
                        itemBuilder: (context,index){
                          RealEstate currItem = viewModel.savedItemsList![index];
                          if(appViewModel.realEstateItemsMap[currItem.realEstateId] != null){
                            currItem = appViewModel.realEstateItemsMap[currItem.realEstateId]!;
                          }
                          return InkWell(
                            child: ThirdItem(
                              realEstate: viewModel.savedItemsList![index],
                              saveButton: Consumer<SaveViewModel>(
                                builder: (_,viewModel,__){
                                  return InkWell(
                                    onTap: () {
                                      viewModel.toggleRealEstate(currItem);
                                    },
                                    child: Container(
                                        margin: const EdgeInsets.all(5),
                                        width: 25,
                                        height: 30,
                                        child: Image.asset(currItem.hasSaved ?? false
                                            ? StringManager.saveForRealEstateItem1
                                            : StringManager.unSaveFroRealEstateItem1)),
                                  );
                                },
                              ),
                            ),
                            onTap: (){
                              Navigator.of(context).pushNamed(RouteName.showDetailsRoute,arguments: {
                                StringManager.item : currItem,
                              });
                            },
                          );
                        }
                    );
                  } else {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            StringManager.didNotSave,
                            style: AppStyles.headline2,
                          ),
                        ],
                      ),
                    );
                  }
                }
              },
            ),
          ),
        )
    );
  }
}