import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? HomeWidget() : HomePageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? HomeWidget() : HomePageWidget(),
        ),
        FFRoute(
          name: 'HomePage',
          path: '/homePage',
          builder: (context, params) => HomePageWidget(),
        ),
        FFRoute(
          name: 'Home',
          path: '/home',
          builder: (context, params) => HomeWidget(),
        ),
        FFRoute(
          name: 'HOTEL_HOME',
          path: '/hotelHome',
          builder: (context, params) => HotelHomeWidget(),
        ),
        FFRoute(
          name: 'SUPER_Home',
          path: '/sUPERHome',
          builder: (context, params) => SUPERHomeWidget(),
        ),
        FFRoute(
          name: 'Client_home',
          path: '/clientHome',
          builder: (context, params) => ClientHomeWidget(),
        ),
        FFRoute(
          name: 'PC_LoginCopy',
          path: '/pCLoginCopy',
          builder: (context, params) => PCLoginCopyWidget(),
        ),
        FFRoute(
          name: 'HotelSearchPage',
          path: '/hotelSearch',
          builder: (context, params) => HotelSearchPageWidget(
            startDate: params.getParam(
              'startDate',
              ParamType.DateTime,
            ),
            duration: params.getParam(
              'duration',
              ParamType.double,
            ),
            city: params.getParam<CityRow>(
              'city',
              ParamType.SupabaseRow,
            ),
            visitors: params.getParam(
              'visitors',
              ParamType.int,
            ),
            user: params.getParam<UsersRow>(
              'user',
              ParamType.SupabaseRow,
            ),
            backRequestId: params.getParam(
              'backRequestId',
              ParamType.int,
            ),
            hallFilter1: params.getParam(
              'hallFilter1',
              ParamType.DataStruct,
              isList: false,
              structBuilder: HotelSeatingStruct.fromSerializableMap,
            ),
            hallFilter2: params.getParam(
              'hallFilter2',
              ParamType.DataStruct,
              isList: false,
              structBuilder: HotelSeatingStruct.fromSerializableMap,
            ),
            hallFilter3: params.getParam(
              'hallFilter3',
              ParamType.DataStruct,
              isList: false,
              structBuilder: HotelSeatingStruct.fromSerializableMap,
            ),
            dayEnd: params.getParam(
              'dayEnd',
              ParamType.DateTime,
            ),
          ),
        ),
        FFRoute(
          name: 'Request',
          path: '/request',
          builder: (context, params) => RequestWidget(
            requestWrapper: params.getParam<RequestWrapperRow>(
              'requestWrapper',
              ParamType.SupabaseRow,
            ),
            lastRequest: params.getParam<RequestsRow>(
              'lastRequest',
              ParamType.SupabaseRow,
            ),
            wasEdited: params.getParam(
              'wasEdited',
              ParamType.bool,
            ),
            startDate: params.getParam(
              'startDate',
              ParamType.DateTime,
            ),
            duration: params.getParam(
              'duration',
              ParamType.double,
            ),
            city: params.getParam<CityRow>(
              'city',
              ParamType.SupabaseRow,
            ),
            visitors: params.getParam(
              'visitors',
              ParamType.int,
            ),
            hallFilter1: params.getParam(
              'hallFilter1',
              ParamType.DataStruct,
              isList: false,
              structBuilder: HotelSeatingStruct.fromSerializableMap,
            ),
            hallFilter2: params.getParam(
              'hallFilter2',
              ParamType.DataStruct,
              isList: false,
              structBuilder: HotelSeatingStruct.fromSerializableMap,
            ),
            hallFilter3: params.getParam(
              'hallFilter3',
              ParamType.DataStruct,
              isList: false,
              structBuilder: HotelSeatingStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: 'aboutservice',
          path: '/aboutservice',
          builder: (context, params) => AboutserviceWidget(),
        ),
        FFRoute(
          name: 'why',
          path: '/why',
          builder: (context, params) => WhyWidget(),
        ),
        FFRoute(
          name: 'EditRequestPage',
          path: '/editrequestpage',
          builder: (context, params) => EditRequestPageWidget(
            hotel: params.getParam(
              'hotel',
              ParamType.int,
            ),
            request: params.getParam<RequestsRow>(
              'request',
              ParamType.SupabaseRow,
            ),
            hallRequests: params.getParam<int>(
              'hallRequests',
              ParamType.int,
              isList: true,
            ),
            hotelName: params.getParam(
              'hotelName',
              ParamType.String,
            ),
            wrapper: params.getParam<RequestWrapperRow>(
              'wrapper',
              ParamType.SupabaseRow,
            ),
            chosenHalls: params.getParam<int>(
              'chosenHalls',
              ParamType.int,
              isList: true,
            ),
            foodRequests: params.getParam<int>(
              'foodRequests',
              ParamType.int,
              isList: true,
            ),
            chosenFood: params.getParam<int>(
              'chosenFood',
              ParamType.int,
              isList: true,
            ),
            roomRequests: params.getParam<int>(
              'roomRequests',
              ParamType.int,
              isList: true,
            ),
            chosenRoom: params.getParam<int>(
              'chosenRoom',
              ParamType.int,
              isList: true,
            ),
            dayStart: params.getParam(
              'dayStart',
              ParamType.DateTime,
            ),
            duration: params.getParam(
              'duration',
              ParamType.double,
            ),
            visitors: params.getParam(
              'visitors',
              ParamType.int,
            ),
            city: params.getParam<CityRow>(
              'city',
              ParamType.SupabaseRow,
            ),
            hallFilter1: params.getParam(
              'hallFilter1',
              ParamType.DataStruct,
              isList: false,
              structBuilder: HotelSeatingStruct.fromSerializableMap,
            ),
            hallFilter2: params.getParam(
              'hallFilter2',
              ParamType.DataStruct,
              isList: false,
              structBuilder: HotelSeatingStruct.fromSerializableMap,
            ),
            hallFilter3: params.getParam(
              'hallFilter3',
              ParamType.DataStruct,
              isList: false,
              structBuilder: HotelSeatingStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: 'AboutUs',
          path: '/aboutUs',
          builder: (context, params) => AboutUsWidget(),
        ),
        FFRoute(
          name: 'QA',
          path: '/qa',
          builder: (context, params) => QaWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/homePage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(
        hasTransition: true,
        transitionType: PageTransitionType.fade,
        duration: Duration(milliseconds: 0),
      );
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
