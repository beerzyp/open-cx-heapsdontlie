import 'package:communio/model/app_state.dart';
import 'package:communio/redux/reducers.dart';
import 'package:communio/view/navigation_service.dart';
import 'package:communio/view/Pages/homepage_view.dart';
import 'package:communio/controller/middleware.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'view/theme.dart';
import 'model/app_state.dart';
import 'package:redux/redux.dart';
import 'redux/reducers.dart';

final Store<AppState> state = Store<AppState>(appReducers,
    /* Function defined in the reducers file */
    initialState: new AppState(null),
    middleware: [generalMiddleware]);

void main() {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  WidgetsBindingObserver lifeCycleEventHandler;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return StoreProvider(
      store: state,
      child: MaterialApp(
          title: 'Communio',
          theme: applicationTheme,
          home: HomePageView(),
          navigatorKey: NavigationService.navigatorKey,
          // ignore: missing_return
          onGenerateRoute: (RouteSettings settings) {
            switch (settings.name) {
              case '/Homepage':
                return MaterialPageRoute(
                    builder: (context) => HomePageView(), settings: settings);
            }
          }),
    );
  }
}