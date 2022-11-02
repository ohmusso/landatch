// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'webland.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TradeInfo _$TradeInfoFromJson(Map<String, dynamic> json) {
  return _TradeInfo.fromJson(json);
}

/// @nodoc
mixin _$TradeInfo {
  String? get status => throw _privateConstructorUsedError;
  List<TradeData>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TradeInfoCopyWith<TradeInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TradeInfoCopyWith<$Res> {
  factory $TradeInfoCopyWith(TradeInfo value, $Res Function(TradeInfo) then) =
      _$TradeInfoCopyWithImpl<$Res, TradeInfo>;
  @useResult
  $Res call({String? status, List<TradeData>? data});
}

/// @nodoc
class _$TradeInfoCopyWithImpl<$Res, $Val extends TradeInfo>
    implements $TradeInfoCopyWith<$Res> {
  _$TradeInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TradeData>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TradeInfoCopyWith<$Res> implements $TradeInfoCopyWith<$Res> {
  factory _$$_TradeInfoCopyWith(
          _$_TradeInfo value, $Res Function(_$_TradeInfo) then) =
      __$$_TradeInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? status, List<TradeData>? data});
}

/// @nodoc
class __$$_TradeInfoCopyWithImpl<$Res>
    extends _$TradeInfoCopyWithImpl<$Res, _$_TradeInfo>
    implements _$$_TradeInfoCopyWith<$Res> {
  __$$_TradeInfoCopyWithImpl(
      _$_TradeInfo _value, $Res Function(_$_TradeInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_TradeInfo(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TradeData>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TradeInfo implements _TradeInfo {
  const _$_TradeInfo({this.status, final List<TradeData>? data}) : _data = data;

  factory _$_TradeInfo.fromJson(Map<String, dynamic> json) =>
      _$$_TradeInfoFromJson(json);

  @override
  final String? status;
  final List<TradeData>? _data;
  @override
  List<TradeData>? get data {
    final value = _data;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TradeInfo(status: $status, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TradeInfo &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TradeInfoCopyWith<_$_TradeInfo> get copyWith =>
      __$$_TradeInfoCopyWithImpl<_$_TradeInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TradeInfoToJson(
      this,
    );
  }
}

abstract class _TradeInfo implements TradeInfo {
  const factory _TradeInfo(
      {final String? status, final List<TradeData>? data}) = _$_TradeInfo;

  factory _TradeInfo.fromJson(Map<String, dynamic> json) =
      _$_TradeInfo.fromJson;

  @override
  String? get status;
  @override
  List<TradeData>? get data;
  @override
  @JsonKey(ignore: true)
  _$$_TradeInfoCopyWith<_$_TradeInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

TradeData _$TradeDataFromJson(Map<String, dynamic> json) {
  return _TradeData.fromJson(json);
}

/// @nodoc
mixin _$TradeData {
  String? get type => throw _privateConstructorUsedError;
  String? get region => throw _privateConstructorUsedError;
  String? get municipalityCode => throw _privateConstructorUsedError;
  String? get prefecture => throw _privateConstructorUsedError;
  String? get municipality => throw _privateConstructorUsedError;
  String? get districtName => throw _privateConstructorUsedError;
  String? get tradePrice => throw _privateConstructorUsedError;
  String? get pricePerUnit => throw _privateConstructorUsedError;
  String? get floorPlan => throw _privateConstructorUsedError;
  String? get area => throw _privateConstructorUsedError;
  String? get unitPrice => throw _privateConstructorUsedError;
  String? get landShape => throw _privateConstructorUsedError;
  String? get frontage => throw _privateConstructorUsedError;
  String? get totalFloorArea => throw _privateConstructorUsedError;
  String? get buildingYear => throw _privateConstructorUsedError;
  String? get structure => throw _privateConstructorUsedError;
  String? get use => throw _privateConstructorUsedError;
  String? get purpose => throw _privateConstructorUsedError;
  String? get direction => throw _privateConstructorUsedError;
  String? get classification => throw _privateConstructorUsedError;
  String? get breadth => throw _privateConstructorUsedError;
  String? get cityPlanning => throw _privateConstructorUsedError;
  String? get coverageRatio => throw _privateConstructorUsedError;
  String? get floorAreaRatio => throw _privateConstructorUsedError;
  String? get period => throw _privateConstructorUsedError;
  String? get renovation => throw _privateConstructorUsedError;
  String? get remarks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TradeDataCopyWith<TradeData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TradeDataCopyWith<$Res> {
  factory $TradeDataCopyWith(TradeData value, $Res Function(TradeData) then) =
      _$TradeDataCopyWithImpl<$Res, TradeData>;
  @useResult
  $Res call(
      {String? type,
      String? region,
      String? municipalityCode,
      String? prefecture,
      String? municipality,
      String? districtName,
      String? tradePrice,
      String? pricePerUnit,
      String? floorPlan,
      String? area,
      String? unitPrice,
      String? landShape,
      String? frontage,
      String? totalFloorArea,
      String? buildingYear,
      String? structure,
      String? use,
      String? purpose,
      String? direction,
      String? classification,
      String? breadth,
      String? cityPlanning,
      String? coverageRatio,
      String? floorAreaRatio,
      String? period,
      String? renovation,
      String? remarks});
}

/// @nodoc
class _$TradeDataCopyWithImpl<$Res, $Val extends TradeData>
    implements $TradeDataCopyWith<$Res> {
  _$TradeDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? region = freezed,
    Object? municipalityCode = freezed,
    Object? prefecture = freezed,
    Object? municipality = freezed,
    Object? districtName = freezed,
    Object? tradePrice = freezed,
    Object? pricePerUnit = freezed,
    Object? floorPlan = freezed,
    Object? area = freezed,
    Object? unitPrice = freezed,
    Object? landShape = freezed,
    Object? frontage = freezed,
    Object? totalFloorArea = freezed,
    Object? buildingYear = freezed,
    Object? structure = freezed,
    Object? use = freezed,
    Object? purpose = freezed,
    Object? direction = freezed,
    Object? classification = freezed,
    Object? breadth = freezed,
    Object? cityPlanning = freezed,
    Object? coverageRatio = freezed,
    Object? floorAreaRatio = freezed,
    Object? period = freezed,
    Object? renovation = freezed,
    Object? remarks = freezed,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      region: freezed == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String?,
      municipalityCode: freezed == municipalityCode
          ? _value.municipalityCode
          : municipalityCode // ignore: cast_nullable_to_non_nullable
              as String?,
      prefecture: freezed == prefecture
          ? _value.prefecture
          : prefecture // ignore: cast_nullable_to_non_nullable
              as String?,
      municipality: freezed == municipality
          ? _value.municipality
          : municipality // ignore: cast_nullable_to_non_nullable
              as String?,
      districtName: freezed == districtName
          ? _value.districtName
          : districtName // ignore: cast_nullable_to_non_nullable
              as String?,
      tradePrice: freezed == tradePrice
          ? _value.tradePrice
          : tradePrice // ignore: cast_nullable_to_non_nullable
              as String?,
      pricePerUnit: freezed == pricePerUnit
          ? _value.pricePerUnit
          : pricePerUnit // ignore: cast_nullable_to_non_nullable
              as String?,
      floorPlan: freezed == floorPlan
          ? _value.floorPlan
          : floorPlan // ignore: cast_nullable_to_non_nullable
              as String?,
      area: freezed == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String?,
      unitPrice: freezed == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      landShape: freezed == landShape
          ? _value.landShape
          : landShape // ignore: cast_nullable_to_non_nullable
              as String?,
      frontage: freezed == frontage
          ? _value.frontage
          : frontage // ignore: cast_nullable_to_non_nullable
              as String?,
      totalFloorArea: freezed == totalFloorArea
          ? _value.totalFloorArea
          : totalFloorArea // ignore: cast_nullable_to_non_nullable
              as String?,
      buildingYear: freezed == buildingYear
          ? _value.buildingYear
          : buildingYear // ignore: cast_nullable_to_non_nullable
              as String?,
      structure: freezed == structure
          ? _value.structure
          : structure // ignore: cast_nullable_to_non_nullable
              as String?,
      use: freezed == use
          ? _value.use
          : use // ignore: cast_nullable_to_non_nullable
              as String?,
      purpose: freezed == purpose
          ? _value.purpose
          : purpose // ignore: cast_nullable_to_non_nullable
              as String?,
      direction: freezed == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as String?,
      classification: freezed == classification
          ? _value.classification
          : classification // ignore: cast_nullable_to_non_nullable
              as String?,
      breadth: freezed == breadth
          ? _value.breadth
          : breadth // ignore: cast_nullable_to_non_nullable
              as String?,
      cityPlanning: freezed == cityPlanning
          ? _value.cityPlanning
          : cityPlanning // ignore: cast_nullable_to_non_nullable
              as String?,
      coverageRatio: freezed == coverageRatio
          ? _value.coverageRatio
          : coverageRatio // ignore: cast_nullable_to_non_nullable
              as String?,
      floorAreaRatio: freezed == floorAreaRatio
          ? _value.floorAreaRatio
          : floorAreaRatio // ignore: cast_nullable_to_non_nullable
              as String?,
      period: freezed == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String?,
      renovation: freezed == renovation
          ? _value.renovation
          : renovation // ignore: cast_nullable_to_non_nullable
              as String?,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TradeDataCopyWith<$Res> implements $TradeDataCopyWith<$Res> {
  factory _$$_TradeDataCopyWith(
          _$_TradeData value, $Res Function(_$_TradeData) then) =
      __$$_TradeDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? type,
      String? region,
      String? municipalityCode,
      String? prefecture,
      String? municipality,
      String? districtName,
      String? tradePrice,
      String? pricePerUnit,
      String? floorPlan,
      String? area,
      String? unitPrice,
      String? landShape,
      String? frontage,
      String? totalFloorArea,
      String? buildingYear,
      String? structure,
      String? use,
      String? purpose,
      String? direction,
      String? classification,
      String? breadth,
      String? cityPlanning,
      String? coverageRatio,
      String? floorAreaRatio,
      String? period,
      String? renovation,
      String? remarks});
}

/// @nodoc
class __$$_TradeDataCopyWithImpl<$Res>
    extends _$TradeDataCopyWithImpl<$Res, _$_TradeData>
    implements _$$_TradeDataCopyWith<$Res> {
  __$$_TradeDataCopyWithImpl(
      _$_TradeData _value, $Res Function(_$_TradeData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? region = freezed,
    Object? municipalityCode = freezed,
    Object? prefecture = freezed,
    Object? municipality = freezed,
    Object? districtName = freezed,
    Object? tradePrice = freezed,
    Object? pricePerUnit = freezed,
    Object? floorPlan = freezed,
    Object? area = freezed,
    Object? unitPrice = freezed,
    Object? landShape = freezed,
    Object? frontage = freezed,
    Object? totalFloorArea = freezed,
    Object? buildingYear = freezed,
    Object? structure = freezed,
    Object? use = freezed,
    Object? purpose = freezed,
    Object? direction = freezed,
    Object? classification = freezed,
    Object? breadth = freezed,
    Object? cityPlanning = freezed,
    Object? coverageRatio = freezed,
    Object? floorAreaRatio = freezed,
    Object? period = freezed,
    Object? renovation = freezed,
    Object? remarks = freezed,
  }) {
    return _then(_$_TradeData(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      region: freezed == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String?,
      municipalityCode: freezed == municipalityCode
          ? _value.municipalityCode
          : municipalityCode // ignore: cast_nullable_to_non_nullable
              as String?,
      prefecture: freezed == prefecture
          ? _value.prefecture
          : prefecture // ignore: cast_nullable_to_non_nullable
              as String?,
      municipality: freezed == municipality
          ? _value.municipality
          : municipality // ignore: cast_nullable_to_non_nullable
              as String?,
      districtName: freezed == districtName
          ? _value.districtName
          : districtName // ignore: cast_nullable_to_non_nullable
              as String?,
      tradePrice: freezed == tradePrice
          ? _value.tradePrice
          : tradePrice // ignore: cast_nullable_to_non_nullable
              as String?,
      pricePerUnit: freezed == pricePerUnit
          ? _value.pricePerUnit
          : pricePerUnit // ignore: cast_nullable_to_non_nullable
              as String?,
      floorPlan: freezed == floorPlan
          ? _value.floorPlan
          : floorPlan // ignore: cast_nullable_to_non_nullable
              as String?,
      area: freezed == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String?,
      unitPrice: freezed == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      landShape: freezed == landShape
          ? _value.landShape
          : landShape // ignore: cast_nullable_to_non_nullable
              as String?,
      frontage: freezed == frontage
          ? _value.frontage
          : frontage // ignore: cast_nullable_to_non_nullable
              as String?,
      totalFloorArea: freezed == totalFloorArea
          ? _value.totalFloorArea
          : totalFloorArea // ignore: cast_nullable_to_non_nullable
              as String?,
      buildingYear: freezed == buildingYear
          ? _value.buildingYear
          : buildingYear // ignore: cast_nullable_to_non_nullable
              as String?,
      structure: freezed == structure
          ? _value.structure
          : structure // ignore: cast_nullable_to_non_nullable
              as String?,
      use: freezed == use
          ? _value.use
          : use // ignore: cast_nullable_to_non_nullable
              as String?,
      purpose: freezed == purpose
          ? _value.purpose
          : purpose // ignore: cast_nullable_to_non_nullable
              as String?,
      direction: freezed == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as String?,
      classification: freezed == classification
          ? _value.classification
          : classification // ignore: cast_nullable_to_non_nullable
              as String?,
      breadth: freezed == breadth
          ? _value.breadth
          : breadth // ignore: cast_nullable_to_non_nullable
              as String?,
      cityPlanning: freezed == cityPlanning
          ? _value.cityPlanning
          : cityPlanning // ignore: cast_nullable_to_non_nullable
              as String?,
      coverageRatio: freezed == coverageRatio
          ? _value.coverageRatio
          : coverageRatio // ignore: cast_nullable_to_non_nullable
              as String?,
      floorAreaRatio: freezed == floorAreaRatio
          ? _value.floorAreaRatio
          : floorAreaRatio // ignore: cast_nullable_to_non_nullable
              as String?,
      period: freezed == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String?,
      renovation: freezed == renovation
          ? _value.renovation
          : renovation // ignore: cast_nullable_to_non_nullable
              as String?,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _$_TradeData implements _TradeData {
  const _$_TradeData(
      {this.type,
      this.region,
      this.municipalityCode,
      this.prefecture,
      this.municipality,
      this.districtName,
      this.tradePrice,
      this.pricePerUnit,
      this.floorPlan,
      this.area,
      this.unitPrice,
      this.landShape,
      this.frontage,
      this.totalFloorArea,
      this.buildingYear,
      this.structure,
      this.use,
      this.purpose,
      this.direction,
      this.classification,
      this.breadth,
      this.cityPlanning,
      this.coverageRatio,
      this.floorAreaRatio,
      this.period,
      this.renovation,
      this.remarks});

  factory _$_TradeData.fromJson(Map<String, dynamic> json) =>
      _$$_TradeDataFromJson(json);

  @override
  final String? type;
  @override
  final String? region;
  @override
  final String? municipalityCode;
  @override
  final String? prefecture;
  @override
  final String? municipality;
  @override
  final String? districtName;
  @override
  final String? tradePrice;
  @override
  final String? pricePerUnit;
  @override
  final String? floorPlan;
  @override
  final String? area;
  @override
  final String? unitPrice;
  @override
  final String? landShape;
  @override
  final String? frontage;
  @override
  final String? totalFloorArea;
  @override
  final String? buildingYear;
  @override
  final String? structure;
  @override
  final String? use;
  @override
  final String? purpose;
  @override
  final String? direction;
  @override
  final String? classification;
  @override
  final String? breadth;
  @override
  final String? cityPlanning;
  @override
  final String? coverageRatio;
  @override
  final String? floorAreaRatio;
  @override
  final String? period;
  @override
  final String? renovation;
  @override
  final String? remarks;

  @override
  String toString() {
    return 'TradeData(type: $type, region: $region, municipalityCode: $municipalityCode, prefecture: $prefecture, municipality: $municipality, districtName: $districtName, tradePrice: $tradePrice, pricePerUnit: $pricePerUnit, floorPlan: $floorPlan, area: $area, unitPrice: $unitPrice, landShape: $landShape, frontage: $frontage, totalFloorArea: $totalFloorArea, buildingYear: $buildingYear, structure: $structure, use: $use, purpose: $purpose, direction: $direction, classification: $classification, breadth: $breadth, cityPlanning: $cityPlanning, coverageRatio: $coverageRatio, floorAreaRatio: $floorAreaRatio, period: $period, renovation: $renovation, remarks: $remarks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TradeData &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.municipalityCode, municipalityCode) ||
                other.municipalityCode == municipalityCode) &&
            (identical(other.prefecture, prefecture) ||
                other.prefecture == prefecture) &&
            (identical(other.municipality, municipality) ||
                other.municipality == municipality) &&
            (identical(other.districtName, districtName) ||
                other.districtName == districtName) &&
            (identical(other.tradePrice, tradePrice) ||
                other.tradePrice == tradePrice) &&
            (identical(other.pricePerUnit, pricePerUnit) ||
                other.pricePerUnit == pricePerUnit) &&
            (identical(other.floorPlan, floorPlan) ||
                other.floorPlan == floorPlan) &&
            (identical(other.area, area) || other.area == area) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.landShape, landShape) ||
                other.landShape == landShape) &&
            (identical(other.frontage, frontage) ||
                other.frontage == frontage) &&
            (identical(other.totalFloorArea, totalFloorArea) ||
                other.totalFloorArea == totalFloorArea) &&
            (identical(other.buildingYear, buildingYear) ||
                other.buildingYear == buildingYear) &&
            (identical(other.structure, structure) ||
                other.structure == structure) &&
            (identical(other.use, use) || other.use == use) &&
            (identical(other.purpose, purpose) || other.purpose == purpose) &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            (identical(other.classification, classification) ||
                other.classification == classification) &&
            (identical(other.breadth, breadth) || other.breadth == breadth) &&
            (identical(other.cityPlanning, cityPlanning) ||
                other.cityPlanning == cityPlanning) &&
            (identical(other.coverageRatio, coverageRatio) ||
                other.coverageRatio == coverageRatio) &&
            (identical(other.floorAreaRatio, floorAreaRatio) ||
                other.floorAreaRatio == floorAreaRatio) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.renovation, renovation) ||
                other.renovation == renovation) &&
            (identical(other.remarks, remarks) || other.remarks == remarks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        type,
        region,
        municipalityCode,
        prefecture,
        municipality,
        districtName,
        tradePrice,
        pricePerUnit,
        floorPlan,
        area,
        unitPrice,
        landShape,
        frontage,
        totalFloorArea,
        buildingYear,
        structure,
        use,
        purpose,
        direction,
        classification,
        breadth,
        cityPlanning,
        coverageRatio,
        floorAreaRatio,
        period,
        renovation,
        remarks
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TradeDataCopyWith<_$_TradeData> get copyWith =>
      __$$_TradeDataCopyWithImpl<_$_TradeData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TradeDataToJson(
      this,
    );
  }
}

abstract class _TradeData implements TradeData {
  const factory _TradeData(
      {final String? type,
      final String? region,
      final String? municipalityCode,
      final String? prefecture,
      final String? municipality,
      final String? districtName,
      final String? tradePrice,
      final String? pricePerUnit,
      final String? floorPlan,
      final String? area,
      final String? unitPrice,
      final String? landShape,
      final String? frontage,
      final String? totalFloorArea,
      final String? buildingYear,
      final String? structure,
      final String? use,
      final String? purpose,
      final String? direction,
      final String? classification,
      final String? breadth,
      final String? cityPlanning,
      final String? coverageRatio,
      final String? floorAreaRatio,
      final String? period,
      final String? renovation,
      final String? remarks}) = _$_TradeData;

  factory _TradeData.fromJson(Map<String, dynamic> json) =
      _$_TradeData.fromJson;

  @override
  String? get type;
  @override
  String? get region;
  @override
  String? get municipalityCode;
  @override
  String? get prefecture;
  @override
  String? get municipality;
  @override
  String? get districtName;
  @override
  String? get tradePrice;
  @override
  String? get pricePerUnit;
  @override
  String? get floorPlan;
  @override
  String? get area;
  @override
  String? get unitPrice;
  @override
  String? get landShape;
  @override
  String? get frontage;
  @override
  String? get totalFloorArea;
  @override
  String? get buildingYear;
  @override
  String? get structure;
  @override
  String? get use;
  @override
  String? get purpose;
  @override
  String? get direction;
  @override
  String? get classification;
  @override
  String? get breadth;
  @override
  String? get cityPlanning;
  @override
  String? get coverageRatio;
  @override
  String? get floorAreaRatio;
  @override
  String? get period;
  @override
  String? get renovation;
  @override
  String? get remarks;
  @override
  @JsonKey(ignore: true)
  _$$_TradeDataCopyWith<_$_TradeData> get copyWith =>
      throw _privateConstructorUsedError;
}

CityInfo _$CityInfoFromJson(Map<String, dynamic> json) {
  return _CityInfo.fromJson(json);
}

/// @nodoc
mixin _$CityInfo {
  String? get status => throw _privateConstructorUsedError;
  List<CityData>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CityInfoCopyWith<CityInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CityInfoCopyWith<$Res> {
  factory $CityInfoCopyWith(CityInfo value, $Res Function(CityInfo) then) =
      _$CityInfoCopyWithImpl<$Res, CityInfo>;
  @useResult
  $Res call({String? status, List<CityData>? data});
}

/// @nodoc
class _$CityInfoCopyWithImpl<$Res, $Val extends CityInfo>
    implements $CityInfoCopyWith<$Res> {
  _$CityInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CityData>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CityInfoCopyWith<$Res> implements $CityInfoCopyWith<$Res> {
  factory _$$_CityInfoCopyWith(
          _$_CityInfo value, $Res Function(_$_CityInfo) then) =
      __$$_CityInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? status, List<CityData>? data});
}

/// @nodoc
class __$$_CityInfoCopyWithImpl<$Res>
    extends _$CityInfoCopyWithImpl<$Res, _$_CityInfo>
    implements _$$_CityInfoCopyWith<$Res> {
  __$$_CityInfoCopyWithImpl(
      _$_CityInfo _value, $Res Function(_$_CityInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_CityInfo(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CityData>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CityInfo implements _CityInfo {
  const _$_CityInfo({this.status, final List<CityData>? data}) : _data = data;

  factory _$_CityInfo.fromJson(Map<String, dynamic> json) =>
      _$$_CityInfoFromJson(json);

  @override
  final String? status;
  final List<CityData>? _data;
  @override
  List<CityData>? get data {
    final value = _data;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CityInfo(status: $status, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CityInfo &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CityInfoCopyWith<_$_CityInfo> get copyWith =>
      __$$_CityInfoCopyWithImpl<_$_CityInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CityInfoToJson(
      this,
    );
  }
}

abstract class _CityInfo implements CityInfo {
  const factory _CityInfo({final String? status, final List<CityData>? data}) =
      _$_CityInfo;

  factory _CityInfo.fromJson(Map<String, dynamic> json) = _$_CityInfo.fromJson;

  @override
  String? get status;
  @override
  List<CityData>? get data;
  @override
  @JsonKey(ignore: true)
  _$$_CityInfoCopyWith<_$_CityInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

CityData _$CityDataFromJson(Map<String, dynamic> json) {
  return _CityData.fromJson(json);
}

/// @nodoc
mixin _$CityData {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CityDataCopyWith<CityData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CityDataCopyWith<$Res> {
  factory $CityDataCopyWith(CityData value, $Res Function(CityData) then) =
      _$CityDataCopyWithImpl<$Res, CityData>;
  @useResult
  $Res call({String? id, String? name});
}

/// @nodoc
class _$CityDataCopyWithImpl<$Res, $Val extends CityData>
    implements $CityDataCopyWith<$Res> {
  _$CityDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CityDataCopyWith<$Res> implements $CityDataCopyWith<$Res> {
  factory _$$_CityDataCopyWith(
          _$_CityData value, $Res Function(_$_CityData) then) =
      __$$_CityDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? name});
}

/// @nodoc
class __$$_CityDataCopyWithImpl<$Res>
    extends _$CityDataCopyWithImpl<$Res, _$_CityData>
    implements _$$_CityDataCopyWith<$Res> {
  __$$_CityDataCopyWithImpl(
      _$_CityData _value, $Res Function(_$_CityData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_CityData(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CityData implements _CityData {
  const _$_CityData({this.id, this.name});

  factory _$_CityData.fromJson(Map<String, dynamic> json) =>
      _$$_CityDataFromJson(json);

  @override
  final String? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'CityData(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CityData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CityDataCopyWith<_$_CityData> get copyWith =>
      __$$_CityDataCopyWithImpl<_$_CityData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CityDataToJson(
      this,
    );
  }
}

abstract class _CityData implements CityData {
  const factory _CityData({final String? id, final String? name}) = _$_CityData;

  factory _CityData.fromJson(Map<String, dynamic> json) = _$_CityData.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$_CityDataCopyWith<_$_CityData> get copyWith =>
      throw _privateConstructorUsedError;
}

Prefecture _$PrefectureFromJson(Map<String, dynamic> json) {
  return _Prefecture.fromJson(json);
}

/// @nodoc
mixin _$Prefecture {
  String? get id => throw _privateConstructorUsedError;
  String? get jp => throw _privateConstructorUsedError;
  String? get en => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PrefectureCopyWith<Prefecture> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrefectureCopyWith<$Res> {
  factory $PrefectureCopyWith(
          Prefecture value, $Res Function(Prefecture) then) =
      _$PrefectureCopyWithImpl<$Res, Prefecture>;
  @useResult
  $Res call({String? id, String? jp, String? en});
}

/// @nodoc
class _$PrefectureCopyWithImpl<$Res, $Val extends Prefecture>
    implements $PrefectureCopyWith<$Res> {
  _$PrefectureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? jp = freezed,
    Object? en = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      jp: freezed == jp
          ? _value.jp
          : jp // ignore: cast_nullable_to_non_nullable
              as String?,
      en: freezed == en
          ? _value.en
          : en // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PrefectureCopyWith<$Res>
    implements $PrefectureCopyWith<$Res> {
  factory _$$_PrefectureCopyWith(
          _$_Prefecture value, $Res Function(_$_Prefecture) then) =
      __$$_PrefectureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? jp, String? en});
}

/// @nodoc
class __$$_PrefectureCopyWithImpl<$Res>
    extends _$PrefectureCopyWithImpl<$Res, _$_Prefecture>
    implements _$$_PrefectureCopyWith<$Res> {
  __$$_PrefectureCopyWithImpl(
      _$_Prefecture _value, $Res Function(_$_Prefecture) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? jp = freezed,
    Object? en = freezed,
  }) {
    return _then(_$_Prefecture(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      jp: freezed == jp
          ? _value.jp
          : jp // ignore: cast_nullable_to_non_nullable
              as String?,
      en: freezed == en
          ? _value.en
          : en // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Prefecture implements _Prefecture {
  const _$_Prefecture({this.id, this.jp, this.en});

  factory _$_Prefecture.fromJson(Map<String, dynamic> json) =>
      _$$_PrefectureFromJson(json);

  @override
  final String? id;
  @override
  final String? jp;
  @override
  final String? en;

  @override
  String toString() {
    return 'Prefecture(id: $id, jp: $jp, en: $en)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Prefecture &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.jp, jp) || other.jp == jp) &&
            (identical(other.en, en) || other.en == en));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, jp, en);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PrefectureCopyWith<_$_Prefecture> get copyWith =>
      __$$_PrefectureCopyWithImpl<_$_Prefecture>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PrefectureToJson(
      this,
    );
  }
}

abstract class _Prefecture implements Prefecture {
  const factory _Prefecture(
      {final String? id, final String? jp, final String? en}) = _$_Prefecture;

  factory _Prefecture.fromJson(Map<String, dynamic> json) =
      _$_Prefecture.fromJson;

  @override
  String? get id;
  @override
  String? get jp;
  @override
  String? get en;
  @override
  @JsonKey(ignore: true)
  _$$_PrefectureCopyWith<_$_Prefecture> get copyWith =>
      throw _privateConstructorUsedError;
}
