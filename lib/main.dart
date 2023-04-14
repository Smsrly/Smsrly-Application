import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smsrly/data/repository/realestate_respository_imp.dart';
import 'package:smsrly/data/repository/user_repository_imp.dart';
import 'package:smsrly/utils/provider_setup.dart';
import 'package:smsrly/utils/routes/routes.dart';
import 'package:smsrly/viewmodel/app_view_model.dart';

import 'data/local/local_service.dart';



UserRepositoryImp? userRepository;
RealEstateRepositoryImp? realEstateRepository;
LocalService? localService;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  userRepository = UserRepositoryImp();
  localService = LocalService();
  await localService?.initSharedPref();
  userRepository!.setLocalService(localService!);
  realEstateRepository = RealEstateRepositoryImp(localService!);
  runApp(const App());
}
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderSetup(userRepository!,realEstateRepository!).providers,
      child: ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return Application();
        },
      ),
    );
  }
}

class Application extends StatelessWidget{

  Application({super.key});


  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AppViewModel>(context,listen: false);
    return MaterialApp(
      initialRoute: viewModel.getStartScreen(),
      routes: routes,
      debugShowCheckedModeBanner: false,
    );
  }

}

