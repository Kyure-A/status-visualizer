import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ContentsRecord extends FirestoreRecord {
  ContentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "displayname" field.
  String? _displayname;
  String get displayname => _displayname ?? '';
  bool hasDisplayname() => _displayname != null;

  // "icon_photo" field.
  String? _iconPhoto;
  String get iconPhoto => _iconPhoto ?? '';
  bool hasIconPhoto() => _iconPhoto != null;

  // "post_user" field.
  DocumentReference? _postUser;
  DocumentReference? get postUser => _postUser;
  bool hasPostUser() => _postUser != null;

  // "value_fatigue" field.
  int? _valueFatigue;
  int get valueFatigue => _valueFatigue ?? 0;
  bool hasValueFatigue() => _valueFatigue != null;

  // "value_caf" field.
  int? _valueCaf;
  int get valueCaf => _valueCaf ?? 0;
  bool hasValueCaf() => _valueCaf != null;

  // "caf_time" field.
  int? _cafTime;
  int get cafTime => _cafTime ?? 0;
  bool hasCafTime() => _cafTime != null;

  // "value_vitaminC" field.
  int? _valueVitaminC;
  int get valueVitaminC => _valueVitaminC ?? 0;
  bool hasValueVitaminC() => _valueVitaminC != null;

  // "vitaminC_time" field.
  int? _vitaminCTime;
  int get vitaminCTime => _vitaminCTime ?? 0;
  bool hasVitaminCTime() => _vitaminCTime != null;

  // "value_vitaminD3" field.
  int? _valueVitaminD3;
  int get valueVitaminD3 => _valueVitaminD3 ?? 0;
  bool hasValueVitaminD3() => _valueVitaminD3 != null;

  // "vitaminD3_time" field.
  int? _vitaminD3Time;
  int get vitaminD3Time => _vitaminD3Time ?? 0;
  bool hasVitaminD3Time() => _vitaminD3Time != null;

  // "value_alcohol" field.
  int? _valueAlcohol;
  int get valueAlcohol => _valueAlcohol ?? 0;
  bool hasValueAlcohol() => _valueAlcohol != null;

  // "alcohol_time" field.
  int? _alcoholTime;
  int get alcoholTime => _alcoholTime ?? 0;
  bool hasAlcoholTime() => _alcoholTime != null;

  // "value_zinc" field.
  int? _valueZinc;
  int get valueZinc => _valueZinc ?? 0;
  bool hasValueZinc() => _valueZinc != null;

  // "zinc_time" field.
  int? _zincTime;
  int get zincTime => _zincTime ?? 0;
  bool hasZincTime() => _zincTime != null;

  // "value_melatonin" field.
  int? _valueMelatonin;
  int get valueMelatonin => _valueMelatonin ?? 0;
  bool hasValueMelatonin() => _valueMelatonin != null;

  // "melatonin_time" field.
  int? _melatoninTime;
  int get melatoninTime => _melatoninTime ?? 0;
  bool hasMelatoninTime() => _melatoninTime != null;

  // "value_glucose" field.
  int? _valueGlucose;
  int get valueGlucose => _valueGlucose ?? 0;
  bool hasValueGlucose() => _valueGlucose != null;

  // "glucose_time" field.
  int? _glucoseTime;
  int get glucoseTime => _glucoseTime ?? 0;
  bool hasGlucoseTime() => _glucoseTime != null;

  void _initializeFields() {
    _displayname = snapshotData['displayname'] as String?;
    _iconPhoto = snapshotData['icon_photo'] as String?;
    _postUser = snapshotData['post_user'] as DocumentReference?;
    _valueFatigue = castToType<int>(snapshotData['value_fatigue']);
    _valueCaf = castToType<int>(snapshotData['value_caf']);
    _cafTime = castToType<int>(snapshotData['caf_time']);
    _valueVitaminC = castToType<int>(snapshotData['value_vitaminC']);
    _vitaminCTime = castToType<int>(snapshotData['vitaminC_time']);
    _valueVitaminD3 = castToType<int>(snapshotData['value_vitaminD3']);
    _vitaminD3Time = castToType<int>(snapshotData['vitaminD3_time']);
    _valueAlcohol = castToType<int>(snapshotData['value_alcohol']);
    _alcoholTime = castToType<int>(snapshotData['alcohol_time']);
    _valueZinc = castToType<int>(snapshotData['value_zinc']);
    _zincTime = castToType<int>(snapshotData['zinc_time']);
    _valueMelatonin = castToType<int>(snapshotData['value_melatonin']);
    _melatoninTime = castToType<int>(snapshotData['melatonin_time']);
    _valueGlucose = castToType<int>(snapshotData['value_glucose']);
    _glucoseTime = castToType<int>(snapshotData['glucose_time']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('contents');

  static Stream<ContentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ContentsRecord.fromSnapshot(s));

  static Future<ContentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ContentsRecord.fromSnapshot(s));

  static ContentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ContentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ContentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ContentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ContentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ContentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createContentsRecordData({
  String? displayname,
  String? iconPhoto,
  DocumentReference? postUser,
  int? valueFatigue,
  int? valueCaf,
  int? cafTime,
  int? valueVitaminC,
  int? vitaminCTime,
  int? valueVitaminD3,
  int? vitaminD3Time,
  int? valueAlcohol,
  int? alcoholTime,
  int? valueZinc,
  int? zincTime,
  int? valueMelatonin,
  int? melatoninTime,
  int? valueGlucose,
  int? glucoseTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'displayname': displayname,
      'icon_photo': iconPhoto,
      'post_user': postUser,
      'value_fatigue': valueFatigue,
      'value_caf': valueCaf,
      'caf_time': cafTime,
      'value_vitaminC': valueVitaminC,
      'vitaminC_time': vitaminCTime,
      'value_vitaminD3': valueVitaminD3,
      'vitaminD3_time': vitaminD3Time,
      'value_alcohol': valueAlcohol,
      'alcohol_time': alcoholTime,
      'value_zinc': valueZinc,
      'zinc_time': zincTime,
      'value_melatonin': valueMelatonin,
      'melatonin_time': melatoninTime,
      'value_glucose': valueGlucose,
      'glucose_time': glucoseTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class ContentsRecordDocumentEquality implements Equality<ContentsRecord> {
  const ContentsRecordDocumentEquality();

  @override
  bool equals(ContentsRecord? e1, ContentsRecord? e2) {
    return e1?.displayname == e2?.displayname &&
        e1?.iconPhoto == e2?.iconPhoto &&
        e1?.postUser == e2?.postUser &&
        e1?.valueFatigue == e2?.valueFatigue &&
        e1?.valueCaf == e2?.valueCaf &&
        e1?.cafTime == e2?.cafTime &&
        e1?.valueVitaminC == e2?.valueVitaminC &&
        e1?.vitaminCTime == e2?.vitaminCTime &&
        e1?.valueVitaminD3 == e2?.valueVitaminD3 &&
        e1?.vitaminD3Time == e2?.vitaminD3Time &&
        e1?.valueAlcohol == e2?.valueAlcohol &&
        e1?.alcoholTime == e2?.alcoholTime &&
        e1?.valueZinc == e2?.valueZinc &&
        e1?.zincTime == e2?.zincTime &&
        e1?.valueMelatonin == e2?.valueMelatonin &&
        e1?.melatoninTime == e2?.melatoninTime &&
        e1?.valueGlucose == e2?.valueGlucose &&
        e1?.glucoseTime == e2?.glucoseTime;
  }

  @override
  int hash(ContentsRecord? e) => const ListEquality().hash([
        e?.displayname,
        e?.iconPhoto,
        e?.postUser,
        e?.valueFatigue,
        e?.valueCaf,
        e?.cafTime,
        e?.valueVitaminC,
        e?.vitaminCTime,
        e?.valueVitaminD3,
        e?.vitaminD3Time,
        e?.valueAlcohol,
        e?.alcoholTime,
        e?.valueZinc,
        e?.zincTime,
        e?.valueMelatonin,
        e?.melatoninTime,
        e?.valueGlucose,
        e?.glucoseTime
      ]);

  @override
  bool isValidKey(Object? o) => o is ContentsRecord;
}
