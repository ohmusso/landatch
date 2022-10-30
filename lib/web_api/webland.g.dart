// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'webland.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TradeInfo _$$_TradeInfoFromJson(Map<String, dynamic> json) => _$_TradeInfo(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => TradeData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_TradeInfoToJson(_$_TradeInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', instance.status);
  writeNotNull('data', instance.data?.map((e) => e.toJson()).toList());
  return val;
}

_$_TradeData _$$_TradeDataFromJson(Map<String, dynamic> json) => _$_TradeData(
      type: json['Type'] as String?,
      region: json['Region'] as String?,
      municipalityCode: json['MunicipalityCode'] as String?,
      prefecture: json['Prefecture'] as String?,
      municipality: json['Municipality'] as String?,
      districtName: json['DistrictName'] as String?,
      tradePrice: json['TradePrice'] as String?,
      pricePerUnit: json['PricePerUnit'] as String?,
      floorPlan: json['FloorPlan'] as String?,
      area: json['Area'] as String?,
      unitPrice: json['UnitPrice'] as String?,
      landShape: json['LandShape'] as String?,
      frontage: json['Frontage'] as String?,
      totalFloorArea: json['TotalFloorArea'] as String?,
      buildingYear: json['BuildingYear'] as String?,
      structure: json['Structure'] as String?,
      use: json['Use'] as String?,
      purpose: json['Purpose'] as String?,
      direction: json['Direction'] as String?,
      classification: json['Classification'] as String?,
      breadth: json['Breadth'] as String?,
      cityPlanning: json['CityPlanning'] as String?,
      coverageRatio: json['CoverageRatio'] as String?,
      floorAreaRatio: json['FloorAreaRatio'] as String?,
      period: json['Period'] as String?,
      renovation: json['Renovation'] as String?,
      remarks: json['Remarks'] as String?,
    );

Map<String, dynamic> _$$_TradeDataToJson(_$_TradeData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Type', instance.type);
  writeNotNull('Region', instance.region);
  writeNotNull('MunicipalityCode', instance.municipalityCode);
  writeNotNull('Prefecture', instance.prefecture);
  writeNotNull('Municipality', instance.municipality);
  writeNotNull('DistrictName', instance.districtName);
  writeNotNull('TradePrice', instance.tradePrice);
  writeNotNull('PricePerUnit', instance.pricePerUnit);
  writeNotNull('FloorPlan', instance.floorPlan);
  writeNotNull('Area', instance.area);
  writeNotNull('UnitPrice', instance.unitPrice);
  writeNotNull('LandShape', instance.landShape);
  writeNotNull('Frontage', instance.frontage);
  writeNotNull('TotalFloorArea', instance.totalFloorArea);
  writeNotNull('BuildingYear', instance.buildingYear);
  writeNotNull('Structure', instance.structure);
  writeNotNull('Use', instance.use);
  writeNotNull('Purpose', instance.purpose);
  writeNotNull('Direction', instance.direction);
  writeNotNull('Classification', instance.classification);
  writeNotNull('Breadth', instance.breadth);
  writeNotNull('CityPlanning', instance.cityPlanning);
  writeNotNull('CoverageRatio', instance.coverageRatio);
  writeNotNull('FloorAreaRatio', instance.floorAreaRatio);
  writeNotNull('Period', instance.period);
  writeNotNull('Renovation', instance.renovation);
  writeNotNull('Remarks', instance.remarks);
  return val;
}

_$_CityInfo _$$_CityInfoFromJson(Map<String, dynamic> json) => _$_CityInfo(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CityData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CityInfoToJson(_$_CityInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', instance.status);
  writeNotNull('data', instance.data?.map((e) => e.toJson()).toList());
  return val;
}

_$_CityData _$$_CityDataFromJson(Map<String, dynamic> json) => _$_CityData(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$_CityDataToJson(_$_CityData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  return val;
}

_$_Prefecture _$$_PrefectureFromJson(Map<String, dynamic> json) =>
    _$_Prefecture(
      id: json['id'] as String?,
      jp: json['jp'] as String?,
      en: json['en'] as String?,
    );

Map<String, dynamic> _$$_PrefectureToJson(_$_Prefecture instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('jp', instance.jp);
  writeNotNull('en', instance.en);
  return val;
}
