import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'webland.freezed.dart';
part 'webland.g.dart';


class Webland {
  /// Target: land api from goverment of jpan
  /// https://www.land.mlit.go.jp/webland/api.html
  /// land info api: https://www.land.mlit.go.jp/webland/api/TradeListSearch?＜parameter＞
  /// city list api: https://www.land.mlit.go.jp/webland/api/CitySearch?＜parameter＞

  Webland({
    required this.client,
  });

  final http.Client client;
  static const String host = 'www.land.mlit.go.jp';
  static const String pathJp = '/webland/api/';
  static const String pathEn = '/webland_english/api/';

  Future<TradeInfo?> getTradeInfo (TradeInfoQuery query, {bool isJp = true}) async {
    
    Uri uri = _createRequesTradeListSearchtUri(query.from, query.to, query.area, query.city, isJp);

    final res = await client.get(uri);

    if (res.statusCode != 200) {
      return null;
    }

    final TradeInfo tradeInfo;
    try {
      final json = jsonDecode(res.body);
      tradeInfo = TradeInfo.fromJson(json);
    } catch (e) {
      return null;
    }

    return tradeInfo;
  }

  Future<CityInfo?> getCityInfo (String area, {bool isJp = true}) async {
    Uri uri = _createRequesCitySearchtUri(area, isJp);

    final res = await client.get(uri);

    if (res.statusCode != 200) {
      return null;
    }

    final CityInfo cityInfo;
    try {
      final json = jsonDecode(res.body);
      cityInfo = CityInfo.fromJson(json);
    } catch (e) {
      return null;
    }

    return cityInfo;
  }

  Uri _createRequesTradeListSearchtUri(String from, String to, String? area, String? city, bool isJp) {
    final query = {
      'from': from, 
      'to': to,
      'area': area, // osaka
      'city': city,  // joto
      // station parameter is option. contact to 'zenrin.co.jp（東京営業部省庁営業課)'
    };

    query.removeWhere((key, value) => value == null);
    final path = (isJp == true) ? pathJp : pathEn;

    return Uri.https(host, '${path}TradeListSearch', query);
  }

  Uri _createRequesCitySearchtUri(String area, bool isJp) {
    final query = {
      'area': area, 
    };
    final path = (isJp == true) ? pathJp : pathEn;

    return Uri.https(host, '${path}CitySearch', query);
  }

  void dispose() {
    client.close();
  }
}

class TradeInfoQuery {
  TradeInfoQuery({required this.from, required this.to, this.area, this.city});
  final String from;
  final String to;
  final String? area;
  final String? city;
}

@freezed
class TradeInfo with _$TradeInfo {
  const factory TradeInfo({
    String? status,
    List<TradeData>? data,
  }) = _TradeInfo;

  factory TradeInfo.fromJson(Map<String, Object?> json)
    => _$TradeInfoFromJson(json); 
}

@freezed
class TradeData with _$TradeData {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.pascal)
  const factory TradeData({
    String? type,
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
    String? remarks,
  }) = _TradeData;

  factory TradeData.fromJson(Map<String, Object?> json)
    => _$TradeDataFromJson(json);
}

@freezed
class CityInfo with _$CityInfo {
  const factory CityInfo({
    String? status,
    List<CityData>? data,
  }) = _CityInfo;

  factory CityInfo.fromJson(Map<String, Object?> json)
    => _$CityInfoFromJson(json); 
}

@freezed
class CityData with _$CityData {
  const factory CityData({
    String? id,
    String? name,
  }) = _CityData;

  factory CityData.fromJson(Map<String, Object?> json)
    => _$CityDataFromJson(json); 
}

@freezed
class Prefecture with _$Prefecture {
  const factory Prefecture({
    String? id,
    String? jp,
    String? en,
  }) = _Prefecture;

  factory Prefecture.fromJson(Map<String, Object?> json)
    => _$PrefectureFromJson(json); 
}
