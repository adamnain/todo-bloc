//
//class NavigatorBloc extends Bloc<NavigatorAction, dynamic>{
//
//  final GlobalKey<NavigatorState> navigatorKey;
//  NavigatorBloc({this.navigatorKey});
//
//  @override
//  dynamic get initialState => 0;
//
//  @override
//  Stream<dynamic> mapEventToState(NavigatorAction event) async* {
//    if(event is NavigatorActionPop){
//      navigatorKey.currentState.pop();
//
//    }else if(event is NavigateToHomeEvent){
//      navigatorKey.currentState.pushNamed('/home');
//
//    }
//  }
//}