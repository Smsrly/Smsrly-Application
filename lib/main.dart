import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smsrly/data/repository/repository_imp.dart';
import 'package:smsrly/utils/routes/routes.dart';
import 'package:smsrly/viewmodel/app_view_model.dart';
import 'package:smsrly/viewmodel/login_view_model.dart';
import 'package:smsrly/viewmodel/sign_up_view_model.dart';

import 'data/local/local_service.dart';



RepositoryImp? repository;
LocalService? localService;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  repository = RepositoryImp();
  localService = LocalService();
  await localService?.initSharedPref();
  repository!.setLocalService(localService!);
  runApp(const App());
}
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => AppViewModel(),
        ),
        ChangeNotifierProvider(
            create: (BuildContext context)=> LoginViewModel()
        ),
        ChangeNotifierProvider(
            create: (BuildContext context)=> SignUpViewModel()
        )
      ],
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

