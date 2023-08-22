import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math' as math;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'main_model.dart';
export 'main_model.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> with TickerProviderStateMixin {
  late MainModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 500.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'transformOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 300.ms,
          duration: 600.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(40.0, 0.0),
        ),
      ],
    ),
    'iconOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 300.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondary,
          automaticallyImplyLeading: true,
          title: Text(
            'Status Visualizer',
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: 'Merriweather',
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 4.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0.0),
                  shape: BoxShape.rectangle,
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 15.0, 15.0, 15.0),
                        child: StreamBuilder<List<ContentsRecord>>(
                          stream: queryContentsRecord(
                            singleRecord: true,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<ContentsRecord> appViewContentsRecordList =
                                snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final appViewContentsRecord =
                                appViewContentsRecordList.isNotEmpty
                                    ? appViewContentsRecordList.first
                                    : null;
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  width: 120.0,
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            setState(() {});

                                            await appViewContentsRecord!
                                                .reference
                                                .update(
                                                    createContentsRecordData(
                                              valueCaf: math.max(
                                                  valueOrDefault<int>(
                                                        appViewContentsRecord
                                                            ?.valueCaf,
                                                        0,
                                                      ) +
                                                      valueOrDefault<int>(
                                                        appViewContentsRecord
                                                            ?.cafTime,
                                                        0,
                                                      ) -
                                                      getCurrentTimestamp
                                                          .secondsSinceEpoch,
                                                  0),
                                              cafTime: getCurrentTimestamp
                                                  .secondsSinceEpoch,
                                              valueVitaminC: math.max(
                                                  valueOrDefault<int>(
                                                        appViewContentsRecord
                                                            ?.valueVitaminC,
                                                        0,
                                                      ) +
                                                      valueOrDefault<int>(
                                                        appViewContentsRecord
                                                            ?.vitaminCTime,
                                                        0,
                                                      ) -
                                                      getCurrentTimestamp
                                                          .secondsSinceEpoch,
                                                  0),
                                              vitaminCTime: valueOrDefault<int>(
                                                getCurrentTimestamp
                                                    .secondsSinceEpoch,
                                                0,
                                              ),
                                              valueVitaminD3: math.max(
                                                  valueOrDefault<int>(
                                                        appViewContentsRecord
                                                            ?.valueVitaminD3,
                                                        0,
                                                      ) +
                                                      valueOrDefault<int>(
                                                        appViewContentsRecord
                                                            ?.vitaminD3Time,
                                                        0,
                                                      ) -
                                                      getCurrentTimestamp
                                                          .secondsSinceEpoch,
                                                  0),
                                              vitaminD3Time:
                                                  valueOrDefault<int>(
                                                getCurrentTimestamp
                                                    .secondsSinceEpoch,
                                                0,
                                              ),
                                              valueAlcohol: math.max(
                                                  valueOrDefault<int>(
                                                        appViewContentsRecord
                                                            ?.valueAlcohol,
                                                        0,
                                                      ) +
                                                      valueOrDefault<int>(
                                                        appViewContentsRecord
                                                            ?.alcoholTime,
                                                        0,
                                                      ) -
                                                      getCurrentTimestamp
                                                          .secondsSinceEpoch,
                                                  0),
                                              alcoholTime: valueOrDefault<int>(
                                                getCurrentTimestamp
                                                    .secondsSinceEpoch,
                                                0,
                                              ),
                                              valueZinc: math.max(
                                                  valueOrDefault<int>(
                                                        appViewContentsRecord
                                                            ?.valueZinc,
                                                        0,
                                                      ) +
                                                      valueOrDefault<int>(
                                                        appViewContentsRecord
                                                            ?.zincTime,
                                                        0,
                                                      ) -
                                                      getCurrentTimestamp
                                                          .secondsSinceEpoch,
                                                  0),
                                              zincTime: valueOrDefault<int>(
                                                getCurrentTimestamp
                                                    .secondsSinceEpoch,
                                                0,
                                              ),
                                              valueMelatonin: math.max(
                                                  valueOrDefault<int>(
                                                        appViewContentsRecord
                                                            ?.valueMelatonin,
                                                        0,
                                                      ) +
                                                      valueOrDefault<int>(
                                                        appViewContentsRecord
                                                            ?.melatoninTime,
                                                        0,
                                                      ) -
                                                      getCurrentTimestamp
                                                          .secondsSinceEpoch,
                                                  0),
                                              melatoninTime:
                                                  valueOrDefault<int>(
                                                getCurrentTimestamp
                                                    .secondsSinceEpoch,
                                                0,
                                              ),
                                              valueGlucose: math.max(
                                                  valueOrDefault<int>(
                                                        appViewContentsRecord
                                                            ?.valueGlucose,
                                                        0,
                                                      ) +
                                                      valueOrDefault<int>(
                                                        appViewContentsRecord
                                                            ?.glucoseTime,
                                                        0,
                                                      ) -
                                                      getCurrentTimestamp
                                                          .secondsSinceEpoch,
                                                  0),
                                              glucoseTime: valueOrDefault<int>(
                                                getCurrentTimestamp
                                                    .secondsSinceEpoch,
                                                0,
                                              ),
                                            ));
                                          },
                                          child: Container(
                                            width: 120.0,
                                            height: 25.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            child: Icon(
                                              Icons.replay,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Player',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ],
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'EditProfile',
                                      queryParameters: {
                                        'bioref': serializeParam(
                                          appViewContentsRecord?.reference,
                                          ParamType.DocumentReference,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.86,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: StreamBuilder<
                                              List<ContentsRecord>>(
                                            stream: queryContentsRecord(
                                              singleRecord: true,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<ContentsRecord>
                                                  imageContentsRecordList =
                                                  snapshot.data!;
                                              // Return an empty Container when the item does not exist.
                                              if (snapshot.data!.isEmpty) {
                                                return Container();
                                              }
                                              final imageContentsRecord =
                                                  imageContentsRecordList
                                                          .isNotEmpty
                                                      ? imageContentsRecordList
                                                          .first
                                                      : null;
                                              return ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(90.0),
                                                child: Image.network(
                                                  valueOrDefault<String>(
                                                    imageContentsRecord
                                                        ?.iconPhoto,
                                                    'https://i.gyazo.com/2286301b885129a0cf97c9227d2b99db.png',
                                                  ),
                                                  width: 90.0,
                                                  height: 90.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  30.0, 0.0, 0.0, 0.0),
                                          child: StreamBuilder<
                                              List<ContentsRecord>>(
                                            stream: queryContentsRecord(
                                              singleRecord: true,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<ContentsRecord>
                                                  textContentsRecordList =
                                                  snapshot.data!;
                                              // Return an empty Container when the item does not exist.
                                              if (snapshot.data!.isEmpty) {
                                                return Container();
                                              }
                                              final textContentsRecord =
                                                  textContentsRecordList
                                                          .isNotEmpty
                                                      ? textContentsRecordList
                                                          .first
                                                      : null;
                                              return Text(
                                                valueOrDefault<String>(
                                                  textContentsRecord
                                                      ?.displayname,
                                                  '青髪の女の子',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Status',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ],
                                ),
                                Container(
                                  width: 100.0,
                                  height: 314.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: GridView(
                                          padding: EdgeInsets.zero,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 10.0,
                                            mainAxisSpacing: 10.0,
                                            childAspectRatio: 1.77,
                                          ),
                                          scrollDirection: Axis.vertical,
                                          children: [
                                            Container(
                                              width: 100.0,
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF3F3F3),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    5.0,
                                                                    0.0),
                                                        child: Icon(
                                                          Icons.remove_red_eye,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    15.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Awakening',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            (appViewContentsRecord!
                                                                        .valueCaf ~/
                                                                    3600)
                                                                .toString(),
                                                            '0',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Text(
                                                          ':',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            (appViewContentsRecord!
                                                                            .valueCaf ~/
                                                                        60 -
                                                                    appViewContentsRecord!
                                                                            .valueCaf ~/
                                                                        3600 *
                                                                        60)
                                                                .toString(),
                                                            '0',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Text(
                                                          ':',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            (appViewContentsRecord!
                                                                        .valueCaf -
                                                                    appViewContentsRecord!
                                                                            .valueCaf ~/
                                                                        60 *
                                                                        60)
                                                                .toString(),
                                                            '0',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: 100.0,
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF3F3F3),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      30.0,
                                                                      0.0),
                                                          child: FaIcon(
                                                            FontAwesomeIcons
                                                                .lemon,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Text(
                                                            'Vitamin C',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          (appViewContentsRecord!
                                                                      .valueVitaminC ~/
                                                                  3600)
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Text(
                                                          ':',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Text(
                                                          (appViewContentsRecord!
                                                                          .valueVitaminC ~/
                                                                      60 -
                                                                  appViewContentsRecord!
                                                                          .valueVitaminC ~/
                                                                      3600 *
                                                                      60)
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Text(
                                                          ':',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Text(
                                                          (appViewContentsRecord!
                                                                      .valueVitaminC -
                                                                  appViewContentsRecord!
                                                                          .valueVitaminC ~/
                                                                      60 *
                                                                      60)
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 100.0,
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF3F3F3),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      5.0,
                                                                      0.0),
                                                          child: Icon(
                                                            Icons.report,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Text(
                                                            'Concentration Up',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          (valueOrDefault<int>(
                                                                    appViewContentsRecord
                                                                        ?.valueGlucose,
                                                                    0,
                                                                  ) ~/
                                                                  3600)
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Text(
                                                          ':',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Text(
                                                          (valueOrDefault<int>(
                                                                        appViewContentsRecord
                                                                            ?.valueGlucose,
                                                                        0,
                                                                      ) ~/
                                                                      60 -
                                                                  valueOrDefault<
                                                                          int>(
                                                                        appViewContentsRecord
                                                                            ?.valueGlucose,
                                                                        0,
                                                                      ) ~/
                                                                      3600 *
                                                                      60)
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Text(
                                                          ':',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Text(
                                                          (valueOrDefault<int>(
                                                                    appViewContentsRecord
                                                                        ?.valueGlucose,
                                                                    0,
                                                                  ) -
                                                                  valueOrDefault<
                                                                          int>(
                                                                        appViewContentsRecord
                                                                            ?.valueGlucose,
                                                                        0,
                                                                      ) ~/
                                                                      60 *
                                                                      60)
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 100.0,
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF3F3F3),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      20.0,
                                                                      0.0),
                                                          child: Icon(
                                                            Icons
                                                                .bedtime_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Text(
                                                            'Good Sleep',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          (valueOrDefault<int>(
                                                                    appViewContentsRecord
                                                                        ?.valueMelatonin,
                                                                    0,
                                                                  ) ~/
                                                                  3600)
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Text(
                                                          ':',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Text(
                                                          (valueOrDefault<int>(
                                                                        appViewContentsRecord
                                                                            ?.valueMelatonin,
                                                                        0,
                                                                      ) ~/
                                                                      60 -
                                                                  valueOrDefault<
                                                                          int>(
                                                                        appViewContentsRecord
                                                                            ?.valueMelatonin,
                                                                        0,
                                                                      ) ~/
                                                                      3600 *
                                                                      60)
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Text(
                                                          ':',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Text(
                                                          (valueOrDefault<int>(
                                                                    appViewContentsRecord
                                                                        ?.valueMelatonin,
                                                                    0,
                                                                  ) -
                                                                  valueOrDefault<
                                                                          int>(
                                                                        appViewContentsRecord
                                                                            ?.valueMelatonin,
                                                                        0,
                                                                      ) ~/
                                                                      60 *
                                                                      60)
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 100.0,
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF3F3F3),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      30.0,
                                                                      0.0),
                                                          child: Icon(
                                                            Icons
                                                                .mood_bad_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Text(
                                                            'Fatigue',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          appViewContentsRecord
                                                              ?.valueFatigue
                                                              ?.toString(),
                                                          '0',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 100.0,
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF3F3F3),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      30.0,
                                                                      0.0),
                                                          child: FaIcon(
                                                            FontAwesomeIcons
                                                                .beer,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Text(
                                                            'Drunk',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          (valueOrDefault<int>(
                                                                    appViewContentsRecord
                                                                        ?.valueAlcohol,
                                                                    0,
                                                                  ) ~/
                                                                  3600)
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Text(
                                                          ':',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Text(
                                                          (valueOrDefault<int>(
                                                                        appViewContentsRecord
                                                                            ?.valueAlcohol,
                                                                        0,
                                                                      ) ~/
                                                                      60 -
                                                                  valueOrDefault<
                                                                          int>(
                                                                        appViewContentsRecord
                                                                            ?.valueAlcohol,
                                                                        0,
                                                                      ) ~/
                                                                      3600 *
                                                                      60)
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Text(
                                                          ':',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Text(
                                                          (valueOrDefault<int>(
                                                                    appViewContentsRecord
                                                                        ?.valueAlcohol,
                                                                    0,
                                                                  ) -
                                                                  valueOrDefault<
                                                                          int>(
                                                                        appViewContentsRecord
                                                                            ?.valueAlcohol,
                                                                        0,
                                                                      ) ~/
                                                                      60 *
                                                                      60)
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 100.0,
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF3F3F3),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        'VitaminD3',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          (valueOrDefault<int>(
                                                                    appViewContentsRecord
                                                                        ?.valueVitaminD3,
                                                                    0,
                                                                  ) ~/
                                                                  3600)
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Text(
                                                          ':',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Text(
                                                          (valueOrDefault<int>(
                                                                        appViewContentsRecord
                                                                            ?.valueVitaminD3,
                                                                        0,
                                                                      ) ~/
                                                                      60 -
                                                                  valueOrDefault<
                                                                          int>(
                                                                        appViewContentsRecord
                                                                            ?.valueVitaminD3,
                                                                        0,
                                                                      ) ~/
                                                                      3600 *
                                                                      60)
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Text(
                                                          ':',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Text(
                                                          (valueOrDefault<int>(
                                                                    appViewContentsRecord
                                                                        ?.valueVitaminD3,
                                                                    0,
                                                                  ) -
                                                                  valueOrDefault<
                                                                          int>(
                                                                        appViewContentsRecord
                                                                            ?.valueVitaminD3,
                                                                        0,
                                                                      ) ~/
                                                                      60 *
                                                                      60)
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 100.0,
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF3F3F3),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        'Zinc',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          (valueOrDefault<int>(
                                                                    appViewContentsRecord
                                                                        ?.valueZinc,
                                                                    0,
                                                                  ) ~/
                                                                  3600)
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Text(
                                                          ':',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Text(
                                                          (valueOrDefault<int>(
                                                                        appViewContentsRecord
                                                                            ?.valueZinc,
                                                                        0,
                                                                      ) ~/
                                                                      60 -
                                                                  valueOrDefault<
                                                                          int>(
                                                                        appViewContentsRecord
                                                                            ?.valueZinc,
                                                                        0,
                                                                      ) ~/
                                                                      3600 *
                                                                      60)
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Text(
                                                          ':',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Text(
                                                          (valueOrDefault<int>(
                                                                    appViewContentsRecord
                                                                        ?.valueZinc,
                                                                    0,
                                                                  ) -
                                                                  valueOrDefault<
                                                                          int>(
                                                                        appViewContentsRecord
                                                                            ?.valueZinc,
                                                                        0,
                                                                      ) ~/
                                                                      60 *
                                                                      60)
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(1.0, 1.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, 1.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            child: Container(
                                              width: 200.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 8.0, 0.0, 8.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      width: double.infinity,
                                                      height: 50.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    0.0,
                                                                    20.0,
                                                                    0.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              'Work',
                                                              queryParameters: {
                                                                'workref':
                                                                    serializeParam(
                                                                  appViewContentsRecord
                                                                      ?.reference,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .king_bed_rounded,
                                                                color: Colors
                                                                    .black,
                                                                size: 26.0,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    context
                                                                        .pushNamed(
                                                                      'GoToBed',
                                                                      queryParameters:
                                                                          {
                                                                        'sleepref':
                                                                            serializeParam(
                                                                          appViewContentsRecord
                                                                              ?.reference,
                                                                          ParamType
                                                                              .DocumentReference,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  },
                                                                  child: Text(
                                                                    'Sleep',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: double.infinity,
                                                      height: 50.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    0.0,
                                                                    20.0,
                                                                    0.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              'Work',
                                                              queryParameters: {
                                                                'workref':
                                                                    serializeParam(
                                                                  appViewContentsRecord
                                                                      ?.reference,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .personal_video,
                                                                color: Colors
                                                                    .black,
                                                                size: 26.0,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    context
                                                                        .pushNamed(
                                                                      'Work',
                                                                      queryParameters:
                                                                          {
                                                                        'workref':
                                                                            serializeParam(
                                                                          appViewContentsRecord
                                                                              ?.reference,
                                                                          ParamType
                                                                              .DocumentReference,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  },
                                                                  child: Text(
                                                                    'Task',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: double.infinity,
                                                      height: 50.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    0.0,
                                                                    20.0,
                                                                    0.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              'Supplemnt',
                                                              queryParameters: {
                                                                'supref':
                                                                    serializeParam(
                                                                  appViewContentsRecord
                                                                      ?.reference,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                              }.withoutNulls,
                                                            );

                                                            await appViewContentsRecord!
                                                                .reference
                                                                .update(
                                                                    createContentsRecordData(
                                                              valueCaf: math.max(
                                                                  valueOrDefault<int>(
                                                                        appViewContentsRecord
                                                                            ?.valueCaf,
                                                                        0,
                                                                      ) +
                                                                      valueOrDefault<int>(
                                                                        appViewContentsRecord
                                                                            ?.cafTime,
                                                                        0,
                                                                      ) -
                                                                      getCurrentTimestamp.secondsSinceEpoch,
                                                                  0),
                                                              cafTime:
                                                                  getCurrentTimestamp
                                                                      .secondsSinceEpoch,
                                                              valueVitaminC: math.max(
                                                                  valueOrDefault<int>(
                                                                        appViewContentsRecord
                                                                            ?.valueVitaminC,
                                                                        0,
                                                                      ) +
                                                                      valueOrDefault<int>(
                                                                        appViewContentsRecord
                                                                            ?.vitaminCTime,
                                                                        0,
                                                                      ) -
                                                                      getCurrentTimestamp.secondsSinceEpoch,
                                                                  0),
                                                              vitaminCTime:
                                                                  valueOrDefault<
                                                                      int>(
                                                                getCurrentTimestamp
                                                                    .secondsSinceEpoch,
                                                                0,
                                                              ),
                                                              valueVitaminD3:
                                                                  math.max(
                                                                      valueOrDefault<
                                                                              int>(
                                                                            appViewContentsRecord?.valueVitaminD3,
                                                                            0,
                                                                          ) +
                                                                          valueOrDefault<
                                                                              int>(
                                                                            appViewContentsRecord?.vitaminD3Time,
                                                                            0,
                                                                          ) -
                                                                          getCurrentTimestamp
                                                                              .secondsSinceEpoch,
                                                                      0),
                                                              vitaminD3Time:
                                                                  valueOrDefault<
                                                                      int>(
                                                                getCurrentTimestamp
                                                                    .secondsSinceEpoch,
                                                                0,
                                                              ),
                                                              valueAlcohol: math.max(
                                                                  valueOrDefault<int>(
                                                                        appViewContentsRecord
                                                                            ?.valueAlcohol,
                                                                        0,
                                                                      ) +
                                                                      valueOrDefault<int>(
                                                                        appViewContentsRecord
                                                                            ?.alcoholTime,
                                                                        0,
                                                                      ) -
                                                                      getCurrentTimestamp.secondsSinceEpoch,
                                                                  0),
                                                              alcoholTime:
                                                                  valueOrDefault<
                                                                      int>(
                                                                getCurrentTimestamp
                                                                    .secondsSinceEpoch,
                                                                0,
                                                              ),
                                                              valueZinc: math.max(
                                                                  valueOrDefault<int>(
                                                                        appViewContentsRecord
                                                                            ?.valueZinc,
                                                                        0,
                                                                      ) +
                                                                      valueOrDefault<int>(
                                                                        appViewContentsRecord
                                                                            ?.zincTime,
                                                                        0,
                                                                      ) -
                                                                      getCurrentTimestamp.secondsSinceEpoch,
                                                                  0),
                                                              zincTime:
                                                                  valueOrDefault<
                                                                      int>(
                                                                getCurrentTimestamp
                                                                    .secondsSinceEpoch,
                                                                0,
                                                              ),
                                                              valueMelatonin:
                                                                  math.max(
                                                                      valueOrDefault<
                                                                              int>(
                                                                            appViewContentsRecord?.valueMelatonin,
                                                                            0,
                                                                          ) +
                                                                          valueOrDefault<
                                                                              int>(
                                                                            appViewContentsRecord?.melatoninTime,
                                                                            0,
                                                                          ) -
                                                                          getCurrentTimestamp
                                                                              .secondsSinceEpoch,
                                                                      0),
                                                              melatoninTime:
                                                                  valueOrDefault<
                                                                      int>(
                                                                getCurrentTimestamp
                                                                    .secondsSinceEpoch,
                                                                0,
                                                              ),
                                                              valueGlucose: math.max(
                                                                  valueOrDefault<int>(
                                                                        appViewContentsRecord
                                                                            ?.valueGlucose,
                                                                        0,
                                                                      ) +
                                                                      valueOrDefault<int>(
                                                                        appViewContentsRecord
                                                                            ?.glucoseTime,
                                                                        0,
                                                                      ) -
                                                                      getCurrentTimestamp.secondsSinceEpoch,
                                                                  0),
                                                              glucoseTime:
                                                                  valueOrDefault<
                                                                      int>(
                                                                getCurrentTimestamp
                                                                    .secondsSinceEpoch,
                                                                0,
                                                              ),
                                                            ));
                                                          },
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            4.0,
                                                                            0.0),
                                                                child: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .capsules,
                                                                  color: Colors
                                                                      .black,
                                                                  size: 26.0,
                                                                ),
                                                              ),
                                                              Text(
                                                                'Supplement',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ).animateOnActionTrigger(
                                            animationsMap[
                                                'containerOnActionTriggerAnimation']!,
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (FFAppState().asdafasd) {
                                                  if (animationsMap[
                                                          'transformOnActionTriggerAnimation'] !=
                                                      null) {
                                                    animationsMap[
                                                            'transformOnActionTriggerAnimation']!
                                                        .controller
                                                        .reverse();
                                                  }
                                                  if (animationsMap[
                                                          'iconOnActionTriggerAnimation'] !=
                                                      null) {
                                                    animationsMap[
                                                            'iconOnActionTriggerAnimation']!
                                                        .controller
                                                        .reverse();
                                                  }
                                                  if (animationsMap[
                                                          'containerOnActionTriggerAnimation'] !=
                                                      null) {
                                                    animationsMap[
                                                            'containerOnActionTriggerAnimation']!
                                                        .controller
                                                        .reverse();
                                                  }
                                                  FFAppState().asdafasd = false;
                                                } else {
                                                  if (animationsMap[
                                                          'transformOnActionTriggerAnimation'] !=
                                                      null) {
                                                    animationsMap[
                                                            'transformOnActionTriggerAnimation']!
                                                        .controller
                                                        .forward(from: 0.0);
                                                  }
                                                  if (animationsMap[
                                                          'iconOnActionTriggerAnimation'] !=
                                                      null) {
                                                    animationsMap[
                                                            'iconOnActionTriggerAnimation']!
                                                        .controller
                                                        .forward(from: 0.0);
                                                  }
                                                  if (animationsMap[
                                                          'containerOnActionTriggerAnimation'] !=
                                                      null) {
                                                    animationsMap[
                                                            'containerOnActionTriggerAnimation']!
                                                        .controller
                                                        .forward(from: 0.0);
                                                  }
                                                  FFAppState().asdafasd = true;
                                                }
                                              },
                                              child: ClipOval(
                                                child: Container(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondary,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondary
                                                      ],
                                                      stops: [0.0, 1.0],
                                                      begin:
                                                          AlignmentDirectional(
                                                              0.87, -1.0),
                                                      end: AlignmentDirectional(
                                                          -0.87, 1.0),
                                                    ),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Stack(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    children: [
                                                      Icon(
                                                        Icons.send,
                                                        color: Colors.white,
                                                        size: 24.0,
                                                      ).animateOnActionTrigger(
                                                        animationsMap[
                                                            'transformOnActionTriggerAnimation']!,
                                                      ),
                                                      Icon(
                                                        Icons.clear,
                                                        color: Colors.white,
                                                        size: 26.0,
                                                      ).animateOnActionTrigger(
                                                        animationsMap[
                                                            'iconOnActionTriggerAnimation']!,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
