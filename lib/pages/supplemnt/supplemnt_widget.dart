import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math' as math;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'supplemnt_model.dart';
export 'supplemnt_model.dart';

class SupplemntWidget extends StatefulWidget {
  const SupplemntWidget({
    Key? key,
    required this.supref,
  }) : super(key: key);

  final DocumentReference? supref;

  @override
  _SupplemntWidgetState createState() => _SupplemntWidgetState();
}

class _SupplemntWidgetState extends State<SupplemntWidget> {
  late SupplemntModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SupplemntModel());

    _model.textController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<ContentsRecord>>(
      stream: queryContentsRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<ContentsRecord> supplemntContentsRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final supplemntContentsRecord = supplemntContentsRecordList.isNotEmpty
            ? supplemntContentsRecordList.first
            : null;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondary,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                fillColor: Color(0x0000000E),
                icon: Icon(
                  Icons.arrow_back_sharp,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.safePop();
                },
              ),
              title: Text(
                'Supplement',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Merriweather',
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 4.0,
            ),
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5.0,
                              color: Color(0x430F1113),
                              offset: Offset(0.0, 2.0),
                            )
                          ],
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8.0),
                            bottomRight: Radius.circular(8.0),
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(0.0),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 5.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 5.0),
                                child: Text(
                                  'What did you take?',
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FlutterFlowDropDown<String>(
                                    controller:
                                        _model.supplementListValueController ??=
                                            FormFieldController<String>(null),
                                    options: [
                                      'Caffeine',
                                      'VitaminC',
                                      'VitaminD3',
                                      'Alcohol',
                                      'Zinc',
                                      'Glucose',
                                      'Melatonin'
                                    ],
                                    onChanged: (val) => setState(
                                        () => _model.supplementListValue = val),
                                    width: 300.0,
                                    height: 50.0,
                                    textStyle:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    hintText: 'Please select...',
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor: Color(0xFFF1F4F8),
                                    borderWidth: 3.0,
                                    borderRadius: 8.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 4.0, 16.0, 4.0),
                                    hidesUnderline: true,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Text(
                                  'How much did you take?',
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    40.0, 0.0, 40.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Stack(
                                        children: [
                                          Container(
                                            width: 200.0,
                                            child: TextFormField(
                                              controller: _model.textController,
                                              autofocus: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText: 'how much',
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium,
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFF1F4F8),
                                                    width: 3.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFF1F4F8),
                                                    width: 3.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 3.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 3.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                              keyboardType:
                                                  TextInputType.number,
                                              validator: _model
                                                  .textControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    FlutterFlowDropDown<String>(
                                      controller:
                                          _model.dropDownValueController ??=
                                              FormFieldController<String>(
                                        _model.dropDownValue ??= 'g',
                                      ),
                                      options: ['g', 'mg', 'μg'],
                                      onChanged: (val) => setState(
                                          () => _model.dropDownValue = val),
                                      width: 100.0,
                                      height: 50.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 15.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 2.0,
                                      borderColor: Color(0xFFF1F4F8),
                                      borderWidth: 3.0,
                                      borderRadius: 10.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 4.0, 16.0, 4.0),
                                      hidesUnderline: true,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 20.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 5.0),
                                      child: Text(
                                        'When did you take supplement?',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        final _datePickedDate =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: getCurrentTimestamp,
                                          firstDate: DateTime(1900),
                                          lastDate: DateTime(2050),
                                        );

                                        TimeOfDay? _datePickedTime;
                                        if (_datePickedDate != null) {
                                          _datePickedTime =
                                              await showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.fromDateTime(
                                                getCurrentTimestamp),
                                          );
                                        }

                                        if (_datePickedDate != null &&
                                            _datePickedTime != null) {
                                          setState(() {
                                            _model.datePicked = DateTime(
                                              _datePickedDate.year,
                                              _datePickedDate.month,
                                              _datePickedDate.day,
                                              _datePickedTime!.hour,
                                              _datePickedTime.minute,
                                            );
                                          });
                                        }
                                      },
                                      text: 'Select Time',
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Merriweather',
                                              color: Colors.white,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 1.0,
                                color: FlutterFlowTheme.of(context).accent4,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 12.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    context.pushNamed('Main');

                                    await supplemntContentsRecord!.reference
                                        .update(createContentsRecordData(
                                      cafTime: valueOrDefault<int>(
                                        _model.datePicked?.secondsSinceEpoch,
                                        0,
                                      ),
                                      vitaminCTime: valueOrDefault<int>(
                                        getCurrentTimestamp.secondsSinceEpoch,
                                        0,
                                      ),
                                      vitaminD3Time: valueOrDefault<int>(
                                        getCurrentTimestamp.secondsSinceEpoch,
                                        0,
                                      ),
                                      alcoholTime: valueOrDefault<int>(
                                        getCurrentTimestamp.secondsSinceEpoch,
                                        0,
                                      ),
                                      zincTime: valueOrDefault<int>(
                                        getCurrentTimestamp.secondsSinceEpoch,
                                        0,
                                      ),
                                      melatoninTime: valueOrDefault<int>(
                                        getCurrentTimestamp.secondsSinceEpoch,
                                        0,
                                      ),
                                      glucoseTime: valueOrDefault<int>(
                                        getCurrentTimestamp.secondsSinceEpoch,
                                        0,
                                      ),
                                    ));
                                    if (_model.supplementListValue ==
                                        'Caffeine') {
                                      if (_model.dropDownValue == 'g') {
                                        await supplemntContentsRecord!.reference
                                            .update({
                                          'value_caf': FieldValue.increment(
                                              math.max(
                                                  int.parse(_model
                                                              .textController
                                                              .text) *
                                                          8 *
                                                          60 *
                                                          60 ~/
                                                          100 +
                                                      _model.datePicked!
                                                          .secondsSinceEpoch -
                                                      getCurrentTimestamp
                                                          .secondsSinceEpoch,
                                                  0)),
                                        });
                                      } else {
                                        if (_model.dropDownValue == 'mg') {
                                          await supplemntContentsRecord!
                                              .reference
                                              .update({
                                            'value_caf': FieldValue
                                                .increment(math.max(
                                                    int.parse(_model
                                                                .textController
                                                                .text) *
                                                            8 *
                                                            60 *
                                                            60 ~/
                                                            100000 +
                                                        _model.datePicked!
                                                            .secondsSinceEpoch -
                                                        getCurrentTimestamp
                                                            .secondsSinceEpoch,
                                                    0)),
                                          });
                                        } else {
                                          await supplemntContentsRecord!
                                              .reference
                                              .update({
                                            'value_caf': FieldValue
                                                .increment(math.max(
                                                    int.parse(_model
                                                                .textController
                                                                .text) *
                                                            8 *
                                                            60 *
                                                            60 ~/
                                                            100000000 +
                                                        _model.datePicked!
                                                            .secondsSinceEpoch -
                                                        getCurrentTimestamp
                                                            .secondsSinceEpoch,
                                                    0)),
                                          });
                                        }
                                      }
                                    }
                                    if (_model.supplementListValue ==
                                        'VitaminC') {
                                      if (_model.dropDownValue == 'g') {
                                        await supplemntContentsRecord!.reference
                                            .update({
                                          'value_vitaminC':
                                              FieldValue.increment(
                                                  valueOrDefault<int>(
                                            math.max(
                                                int.parse(_model.textController
                                                            .text) *
                                                        24 *
                                                        60 *
                                                        60 *
                                                        10 +
                                                    _model.datePicked!
                                                        .secondsSinceEpoch -
                                                    getCurrentTimestamp
                                                        .secondsSinceEpoch,
                                                0),
                                            0,
                                          )),
                                        });
                                      } else {
                                        if (_model.dropDownValue == 'mg') {
                                          await supplemntContentsRecord!
                                              .reference
                                              .update({
                                            'value_vitaminC':
                                                FieldValue.increment(
                                                    valueOrDefault<int>(
                                              math.max(
                                                  int.parse(_model
                                                              .textController
                                                              .text) *
                                                          24 *
                                                          60 *
                                                          60 ~/
                                                          100 +
                                                      _model.datePicked!
                                                          .secondsSinceEpoch -
                                                      getCurrentTimestamp
                                                          .secondsSinceEpoch,
                                                  0),
                                              0,
                                            )),
                                          });
                                        } else {
                                          await supplemntContentsRecord!
                                              .reference
                                              .update({
                                            'value_vitaminC':
                                                FieldValue.increment(
                                                    valueOrDefault<int>(
                                              math.max(
                                                  int.parse(_model
                                                              .textController
                                                              .text) *
                                                          8 *
                                                          60 *
                                                          60 ~/
                                                          100000 +
                                                      _model.datePicked!
                                                          .secondsSinceEpoch -
                                                      getCurrentTimestamp
                                                          .secondsSinceEpoch,
                                                  0),
                                              0,
                                            )),
                                          });
                                        }
                                      }
                                    }
                                    if (_model.supplementListValue ==
                                        'VitaminD3') {
                                      if (_model.dropDownValue == 'g') {
                                        await supplemntContentsRecord!.reference
                                            .update({
                                          'value_vitaminD3':
                                              FieldValue.increment(
                                                  valueOrDefault<int>(
                                            math.max(
                                                int.parse(_model.textController
                                                            .text) *
                                                        24 *
                                                        60 *
                                                        60 ~/
                                                        8.9 *
                                                        1000000 +
                                                    _model.datePicked!
                                                        .secondsSinceEpoch -
                                                    getCurrentTimestamp
                                                        .secondsSinceEpoch,
                                                0),
                                            0,
                                          )),
                                        });
                                      } else {
                                        if (_model.dropDownValue == 'mg') {
                                          await supplemntContentsRecord!
                                              .reference
                                              .update({
                                            'value_vitaminD3':
                                                FieldValue.increment(
                                                    valueOrDefault<int>(
                                              math.max(
                                                  int.parse(_model
                                                              .textController
                                                              .text) *
                                                          24 *
                                                          60 *
                                                          60 ~/
                                                          8.9 *
                                                          1000 +
                                                      _model.datePicked!
                                                          .secondsSinceEpoch -
                                                      getCurrentTimestamp
                                                          .secondsSinceEpoch,
                                                  0),
                                              0,
                                            )),
                                          });
                                        } else {
                                          await supplemntContentsRecord!
                                              .reference
                                              .update({
                                            'value_vitaminD3':
                                                FieldValue.increment(
                                                    valueOrDefault<int>(
                                              math.max(
                                                  int.parse(_model
                                                              .textController
                                                              .text) *
                                                          24 *
                                                          60 *
                                                          60 ~/
                                                          8.9 +
                                                      _model.datePicked!
                                                          .secondsSinceEpoch -
                                                      getCurrentTimestamp
                                                          .secondsSinceEpoch,
                                                  0),
                                              0,
                                            )),
                                          });
                                        }
                                      }
                                    }
                                    if (_model.supplementListValue ==
                                        'Alcohol') {
                                      if (_model.dropDownValue == 'g') {
                                        await supplemntContentsRecord!.reference
                                            .update({
                                          'value_alcohol': FieldValue.increment(
                                              valueOrDefault<int>(
                                            math.max(
                                                int.parse(_model.textController
                                                            .text) *
                                                        5 *
                                                        60 *
                                                        60 ~/
                                                        30 +
                                                    _model.datePicked!
                                                        .secondsSinceEpoch -
                                                    getCurrentTimestamp
                                                        .secondsSinceEpoch,
                                                0),
                                            0,
                                          )),
                                        });
                                      } else {
                                        if (_model.dropDownValue == 'mg') {
                                          await supplemntContentsRecord!
                                              .reference
                                              .update({
                                            'value_alcohol':
                                                FieldValue.increment(
                                                    valueOrDefault<int>(
                                              math.max(
                                                  int.parse(_model
                                                              .textController
                                                              .text) *
                                                          5 *
                                                          60 *
                                                          60 ~/
                                                          30000 +
                                                      _model.datePicked!
                                                          .secondsSinceEpoch -
                                                      getCurrentTimestamp
                                                          .secondsSinceEpoch,
                                                  0),
                                              0,
                                            )),
                                          });
                                        } else {
                                          await supplemntContentsRecord!
                                              .reference
                                              .update({
                                            'value_alcohol':
                                                FieldValue.increment(
                                                    valueOrDefault<int>(
                                              math.max(
                                                  int.parse(_model
                                                              .textController
                                                              .text) *
                                                          5 *
                                                          60 *
                                                          60 ~/
                                                          30000000 +
                                                      _model.datePicked!
                                                          .secondsSinceEpoch -
                                                      getCurrentTimestamp
                                                          .secondsSinceEpoch,
                                                  0),
                                              0,
                                            )),
                                          });
                                        }
                                      }
                                    }
                                    if (_model.supplementListValue == 'Zinc') {
                                      if (_model.dropDownValue == 'g') {
                                        await supplemntContentsRecord!.reference
                                            .update({
                                          'value_zinc': FieldValue.increment(
                                              valueOrDefault<int>(
                                            math.max(
                                                int.parse(_model.textController
                                                            .text) *
                                                        24 *
                                                        60 *
                                                        60 *
                                                        100 +
                                                    _model.datePicked!
                                                        .secondsSinceEpoch -
                                                    getCurrentTimestamp
                                                        .secondsSinceEpoch,
                                                0),
                                            0,
                                          )),
                                        });
                                      } else {
                                        if (_model.dropDownValue == 'mg') {
                                          await supplemntContentsRecord!
                                              .reference
                                              .update({
                                            'value_zinc': FieldValue.increment(
                                                valueOrDefault<int>(
                                              math.max(
                                                  int.parse(_model
                                                              .textController
                                                              .text) *
                                                          24 *
                                                          60 *
                                                          60 ~/
                                                          10 +
                                                      _model.datePicked!
                                                          .secondsSinceEpoch -
                                                      getCurrentTimestamp
                                                          .secondsSinceEpoch,
                                                  0),
                                              0,
                                            )),
                                          });
                                        } else {
                                          await supplemntContentsRecord!
                                              .reference
                                              .update({
                                            'value_zinc': FieldValue.increment(
                                                valueOrDefault<int>(
                                              math.max(
                                                  int.parse(_model
                                                              .textController
                                                              .text) *
                                                          24 *
                                                          60 *
                                                          60 ~/
                                                          10000 +
                                                      _model.datePicked!
                                                          .secondsSinceEpoch -
                                                      getCurrentTimestamp
                                                          .secondsSinceEpoch,
                                                  0),
                                              0,
                                            )),
                                          });
                                        }
                                      }
                                    }
                                    if (_model.supplementListValue ==
                                        'Glucose') {
                                      if (_model.dropDownValue == 'g') {
                                        await supplemntContentsRecord!.reference
                                            .update({
                                          'value_glucose': FieldValue.increment(
                                              valueOrDefault<int>(
                                            math.max(
                                                int.parse(_model.textController
                                                            .text) *
                                                        24 *
                                                        60 *
                                                        60 ~/
                                                        150 +
                                                    _model.datePicked!
                                                        .secondsSinceEpoch -
                                                    getCurrentTimestamp
                                                        .secondsSinceEpoch,
                                                0),
                                            0,
                                          )),
                                        });
                                      } else {
                                        if (_model.dropDownValue == 'mg') {
                                          await supplemntContentsRecord!
                                              .reference
                                              .update({
                                            'value_glucose':
                                                FieldValue.increment(
                                                    valueOrDefault<int>(
                                              math.max(
                                                  int.parse(_model
                                                              .textController
                                                              .text) *
                                                          24 *
                                                          60 *
                                                          60 ~/
                                                          150000 +
                                                      _model.datePicked!
                                                          .secondsSinceEpoch -
                                                      getCurrentTimestamp
                                                          .secondsSinceEpoch,
                                                  0),
                                              0,
                                            )),
                                          });
                                        } else {
                                          await supplemntContentsRecord!
                                              .reference
                                              .update({
                                            'value_glucose':
                                                FieldValue.increment(
                                                    valueOrDefault<int>(
                                              math.max(
                                                  int.parse(_model
                                                              .textController
                                                              .text) *
                                                          24 *
                                                          60 *
                                                          60 ~/
                                                          150000000 +
                                                      _model.datePicked!
                                                          .secondsSinceEpoch -
                                                      getCurrentTimestamp
                                                          .secondsSinceEpoch,
                                                  0),
                                              0,
                                            )),
                                          });
                                        }
                                      }
                                    }
                                    if (_model.supplementListValue ==
                                        'Melatonin') {
                                      if (_model.dropDownValue == 'g') {
                                        await supplemntContentsRecord!.reference
                                            .update({
                                          'value_melatonin':
                                              FieldValue.increment(
                                                  valueOrDefault<int>(
                                            math.max(
                                                int.parse(_model.textController
                                                            .text) *
                                                        6 *
                                                        60 *
                                                        60 ~/
                                                        3 *
                                                        1000 +
                                                    _model.datePicked!
                                                        .secondsSinceEpoch -
                                                    getCurrentTimestamp
                                                        .secondsSinceEpoch,
                                                0),
                                            0,
                                          )),
                                        });
                                      } else {
                                        if (_model.dropDownValue == 'mg') {
                                          await supplemntContentsRecord!
                                              .reference
                                              .update({
                                            'value_melatonin':
                                                FieldValue.increment(
                                                    valueOrDefault<int>(
                                              math.max(
                                                  int.parse(_model
                                                              .textController
                                                              .text) *
                                                          6 *
                                                          60 *
                                                          60 ~/
                                                          3 +
                                                      _model.datePicked!
                                                          .secondsSinceEpoch -
                                                      getCurrentTimestamp
                                                          .secondsSinceEpoch,
                                                  0),
                                              0,
                                            )),
                                          });
                                        } else {
                                          await supplemntContentsRecord!
                                              .reference
                                              .update({
                                            'value_melatonin':
                                                FieldValue.increment(
                                                    valueOrDefault<int>(
                                              math.max(
                                                  int.parse(_model
                                                              .textController
                                                              .text) *
                                                          6 *
                                                          60 *
                                                          60 ~/
                                                          3000 +
                                                      _model.datePicked!
                                                          .secondsSinceEpoch -
                                                      getCurrentTimestamp
                                                          .secondsSinceEpoch,
                                                  0),
                                              0,
                                            )),
                                          });
                                        }
                                      }
                                    }
                                  },
                                  text: 'Save Changes',
                                  options: FFButtonOptions(
                                    width: 230.0,
                                    height: 50.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Merriweather',
                                          color: Colors.white,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
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
          ),
        );
      },
    );
  }
}
