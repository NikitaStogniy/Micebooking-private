import '/auth/base_auth_user_provider.dart';
import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (loggedIn == true) {
        _model.role = await UsersTable().queryRows(
          queryFn: (q) => q.eqOrNull(
            'uid',
            currentUserUid,
          ),
        );
        if (_model.role?.first?.role == 'CLIENT') {
          context.goNamedAuth('Home', context.mounted);
        } else if (_model.role?.first?.role == 'HOTEL') {
          context.goNamedAuth('HOTEL_HOME', context.mounted);
        } else if (_model.role?.first?.role == 'SUPERUSER') {
          context.goNamedAuth('SUPER_Home', context.mounted);
        } else if (loggedIn == false) {
          context.pushNamedAuth('Home', context.mounted);
        } else {
          GoRouter.of(context).prepareAuthEvent();
          await authManager.signOut();
          GoRouter.of(context).clearRedirectLocation();
        }
      } else {
        context.goNamedAuth('Home', context.mounted);
      }
    });

    animationsMap.addAll({
      'imageOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: Color(0x80FFFFFF),
            angle: 0.524,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsets.all(30.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: SvgPicture.asset(
                  'assets/images/logo.svg',
                  width: 200.0,
                  height: 24.0,
                  fit: BoxFit.contain,
                  alignment: Alignment(0.0, 0.0),
                ),
              ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation']!),
            ),
          ),
        ),
      ),
    );
  }
}
