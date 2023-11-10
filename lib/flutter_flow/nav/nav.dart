import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';

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

  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => appStateNotifier.showSplashImage
          ? Builder(
              builder: (context) => Container(
                color: FlutterFlowTheme.of(context).primaryBackground,
                child: Center(
                  child: Image.asset(
                    'assets/images/Molaqat_Logo_Source_file-01.gif',
                    width: 700.0,
                    height: 80.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
          : NavBarPage(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.showSplashImage
              ? Builder(
                  builder: (context) => Container(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    child: Center(
                      child: Image.asset(
                        'assets/images/Molaqat_Logo_Source_file-01.gif',
                        width: 700.0,
                        height: 80.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              : NavBarPage(),
          routes: [
            FFRoute(
              name: 'Get_Started',
              path: 'getStarted',
              builder: (context, params) => GetStartedWidget(),
            ),
            FFRoute(
              name: 'Login',
              path: 'login',
              builder: (context, params) => LoginWidget(),
            ),
            FFRoute(
              name: 'Phone_authen',
              path: 'phoneAuthen',
              builder: (context, params) => PhoneAuthenWidget(),
            ),
            FFRoute(
              name: 'Code_verification',
              path: 'codeVerification',
              builder: (context, params) => CodeVerificationWidget(),
            ),
            FFRoute(
              name: 'viewProfile',
              path: 'viewProfile',
              builder: (context, params) => ViewProfileWidget(
                useRiD: params.getParam('useRiD', ParamType.String),
                peopleDate: params.getParam('peopleDate', ParamType.JSON),
              ),
            ),
            FFRoute(
              name: 'EditProfile',
              path: 'editProfile',
              builder: (context, params) => EditProfileWidget(),
            ),
            FFRoute(
              name: 'Home',
              path: 'home',
              builder: (context, params) => HomeWidget(),
            ),
            FFRoute(
              name: 'edit',
              path: 'edit',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'edit')
                  : EditWidget(
                      firstName: params.getParam('firstName', ParamType.String),
                      gender: params.getParam('gender', ParamType.String),
                      specifyGender:
                          params.getParam('specifyGender', ParamType.String),
                      marStatus: params.getParam('marStatus', ParamType.String),
                      city: params.getParam('city', ParamType.String),
                      country: params.getParam('country', ParamType.String),
                      height: params.getParam('height', ParamType.String),
                      weight: params.getParam('weight', ParamType.String),
                      degree: params.getParam('degree', ParamType.String),
                      institution:
                          params.getParam('institution', ParamType.String),
                      profession:
                          params.getParam('profession', ParamType.String),
                      income: params.getParam('income', ParamType.String),
                      religion: params.getParam('religion', ParamType.String),
                      caste: params.getParam('caste', ParamType.String),
                      fatherName:
                          params.getParam('fatherName', ParamType.String),
                      motherName:
                          params.getParam('motherName', ParamType.String),
                      fatherProfession:
                          params.getParam('fatherProfession', ParamType.String),
                      motherProfession:
                          params.getParam('motherProfession', ParamType.String),
                      partnerCaste:
                          params.getParam('partnerCaste', ParamType.String),
                      partnerReligion:
                          params.getParam('partnerReligion', ParamType.String),
                      partnerCity:
                          params.getParam('partnerCity', ParamType.String),
                      partnerAge:
                          params.getParam('partnerAge', ParamType.String),
                      familyValue:
                          params.getParam('familyValue', ParamType.String),
                      partnerProfession: params.getParam(
                          'partnerProfession', ParamType.String),
                      partnerCasteSect:
                          params.getParam('partnerCasteSect', ParamType.String),
                      partnerHeight:
                          params.getParam('partnerHeight', ParamType.String),
                      partnerWeight:
                          params.getParam('partnerWeight', ParamType.String),
                      partnerMarStatus:
                          params.getParam('partnerMarStatus', ParamType.String),
                      profileImage: params.getParam(
                          'profileImage', ParamType.FFUploadedFile),
                      myAge: params.getParam('myAge', ParamType.String),
                      lastname: params.getParam('lastname', ParamType.String),
                      motherTongue:
                          params.getParam('motherTongue', ParamType.String),
                      sinlings: params.getParam('sinlings', ParamType.String),
                      martialStatusOfallSiblings: params.getParam<String>(
                          'martialStatusOfallSiblings', ParamType.String, true),
                      siblingProfession: params.getParam(
                          'siblingProfession', ParamType.String),
                      siblingEducation: params.getParam<String>(
                          'siblingEducation', ParamType.String, true),
                    ),
            ),
            FFRoute(
              name: 'HomeAfterLogin',
              path: 'homeAfterLogin',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'HomeAfterLogin')
                  : HomeAfterLoginWidget(),
            ),
            FFRoute(
              name: 'AllChats',
              path: 'allChats',
              builder: (context, params) => AllChatsWidget(),
            ),
            FFRoute(
              name: 'MolaqatChat',
              path: 'molaqatChat',
              builder: (context, params) => MolaqatChatWidget(),
            ),
            FFRoute(
              name: 'audioChatDemo',
              path: 'audioChatDemo',
              builder: (context, params) => AudioChatDemoWidget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
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

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
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
      (state.extraMap.length == 1 &&
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
    ParamType type, [
    bool isList = false,
  ]) {
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
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
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

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
