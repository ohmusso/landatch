import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'dart:convert';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:landatch/web_api/webland.dart';
import 'webland_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  const tradeInfo = TradeInfo(
    status: 'OK',
    data:[
      TradeData(
        type: '宅地(土地と建物)',
        region: '商業地',
        municipalityCode: '27118',
        prefecture: '大阪府',
        municipality: '大阪市城東区',
        districtName: '今福西',
        tradePrice: '18000000',
        pricePerUnit: null,
        floorPlan: null,
        area: '65',
        unitPrice: null,
        landShape: '不整形',
        frontage: '3.8',
        totalFloorArea: '65',
        buildingYear: '昭和30年',
        structure: '木造',
        use: '倉庫、店舗',
        purpose: null,
        direction: '南',
        classification: '私道',
        breadth: '4.0',
        cityPlanning: '商業地域',
        coverageRatio: '80',
        floorAreaRatio: '400',
        period: '2022年第１四半期',
        renovation: null,
        remarks: null,
      ),
    ],
  );
//  const String tradeInfoString = '{\'Type\':\'宅地(土地と建物)\',\'Region\':\'商業地\',\'MunicipalityCode\':\'27118\',\'Prefecture\':\'大阪府\',\'Municipality\':\'大阪市城東区\',\'DistrictName\':\'今福西\',\'TradePrice\':\'18000000\',\'Area\':\'65\',\'LandShape\':\'不整形\',\'Frontage\':\'3.8\',\'TotalFloorArea\':\'65\',\'BuildingYear\':\'昭和30年\',\'Structure\':\'木造\',\'Use\':\'倉庫、店舗\',\'Direction\':\'南\',\'Classification\':\'私道\',\'Breadth\':\'4.0\',\'CityPlanning\':\'商業地域\',\'CoverageRatio\':\'80\',\'FloorAreaRatio\':\'400\',\'Period\':\'2022年第１四半期\'},{\'Type\':\'宅地(土地)\',\'Region\':\'住宅地\',\'MunicipalityCode\':\'27118\',\'Prefecture\':\'大阪府\',\'Municipality\':\'大阪市城東区\',\'DistrictName\':\'今福西\',\'TradePrice\':\'16000000\',\'PricePerUnit\':\'1100000\',\'Area\':\'50\',\'UnitPrice\':\'330000\',\'LandShape\':\'長方形\',\'Frontage\':\'3.4\',\'Purpose\':\'その他\',\'Direction\':\'南\',\'Classification\':\'私道\',\'Breadth\':\'4.0\',\'CityPlanning\':\'近隣商業地域\',\'CoverageRatio\':\'80\',\'FloorAreaRatio\':\'300\',\'Period\':\'2022年第１四半期\'}';
  const String tradeInfoString = '''
{
  "status":"OK",
  "data":[
    {
      "Type":"宅地(土地と建物)",
      "Region":"商業地",
      "MunicipalityCode":"27118",
      "Prefecture":"大阪府",
      "Municipality":"大阪市城東区",
      "DistrictName":"今福西",
      "TradePrice":"18000000",
      "Area":"65",
      "LandShape":"不整形",
      "Frontage":"3.8",
      "TotalFloorArea":"65",
      "BuildingYear":"昭和30年",
      "Structure":"木造",
      "Use":"倉庫、店舗",
      "Direction":"南",
      "Classification":"私道",
      "Breadth":"4.0",
      "CityPlanning":"商業地域",
      "CoverageRatio":"80",
      "FloorAreaRatio":"400",
      "Period":"2022年第１四半期"
    }
  ]
}
''';

const listTradeInfo = TradeInfo(
  status: 'OK',
  data:[
    TradeData(
      type: '宅地(土地と建物)',
      region: '商業地',
      municipalityCode: '27118',
    ),
    TradeData(
      type: '宅地(土地)',
      prefecture: '大阪府',
      municipality: '大阪市城東区',
    ),
    TradeData(
      type: '中古マンション等',
      period: '2022年第１四半期',
      renovation: '未改装',
    ),
  ],
  );

Future<String> loadJsonString(String path) async {
  final File file = File(path);
  return await file.readAsString();
}

  group('web land api', () {
    test('check trade info toJson', () {
      expect(tradeInfo.toJson(), {
        'status': 'OK', 
        'data': [{
          'Type':'宅地(土地と建物)',
          'Region':'商業地',
          'MunicipalityCode':'27118',
          'Prefecture':'大阪府',
          'Municipality':'大阪市城東区',
          'DistrictName':'今福西',
          'TradePrice':'18000000',
          'Area':'65',
          'LandShape':'不整形',
          'Frontage':'3.8',
          'TotalFloorArea':'65',
          'BuildingYear':'昭和30年',
          'Structure':'木造',
          'Use':'倉庫、店舗',
          'Direction':'南',
          'Classification':'私道',
          'Breadth':'4.0',
          'CityPlanning':'商業地域',
          'CoverageRatio':'80',
          'FloorAreaRatio':'400',
          'Period':'2022年第１四半期',
        }
      ]});
    });

    test('check trade info fromJson', () {
      final jsonTradeInfo = jsonDecode(tradeInfoString);
      expect(TradeInfo.fromJson(jsonTradeInfo), tradeInfo);
    });

    test('check listed trade info fromJson', () async {
      final jsonString = await loadJsonString('./test/test_data/trade_info.json');
      final jsonTradeInfo = jsonDecode(jsonString);
      expect(TradeInfo.fromJson(jsonTradeInfo), listTradeInfo);
    });

    test('check uri request with all parameters', () async {
      const String uri = 'https://www.land.mlit.go.jp/webland/api/TradeListSearch?from=20221&to=20223&area=27&city=27118';
      final client = MockClient();

      when(client.get(Uri.parse(uri))).thenAnswer((_) async => http.Response(tradeInfoString, 200, headers: {'content-type': 'application/json;charset=utf-8'}));

      final webLand = Webland(client: client);

      final query = TradeInfoQuery(from: '20221', to: '20223', area: '27', city: '27118');
      expect(await webLand.getTradeInfo(query), tradeInfo);
    });

    test('check uri request with no area', () async {
      const String uri = 'https://www.land.mlit.go.jp/webland/api/TradeListSearch?from=20221&to=20223&city=27118';
      final client = MockClient();

      when(client.get(Uri.parse(uri))).thenAnswer((_) async => http.Response(tradeInfoString, 200, headers: {'content-type': 'application/json;charset=utf-8'}));

      final webLand = Webland(client: client);

      final query = TradeInfoQuery(from: '20221', to: '20223', city: '27118');
      expect(await webLand.getTradeInfo(query), tradeInfo);
    });

    test('check uri request with no city', () async {
      const String uri = 'https://www.land.mlit.go.jp/webland/api/TradeListSearch?from=20221&to=20223&area=27';
      final client = MockClient();

      when(client.get(Uri.parse(uri))).thenAnswer((_) async => http.Response(tradeInfoString, 200, headers: {'content-type': 'application/json;charset=utf-8'}));

      final webLand = Webland(client: client);
      
      final query = TradeInfoQuery(from: '20221', to: '20223', area: '27');
      expect(await webLand.getTradeInfo(query), tradeInfo);
    });

    test('check uri request with no area, city', () async {
      const String uri = 'https://www.land.mlit.go.jp/webland/api/TradeListSearch?from=20221&to=20223';
      final client = MockClient();

      when(client.get(Uri.parse(uri))).thenAnswer((_) async => http.Response(tradeInfoString, 200, headers: {'content-type': 'application/json;charset=utf-8'}));

      final webLand = Webland(client: client);

      final query = TradeInfoQuery(from: '20221', to: '20223');
      expect(await webLand.getTradeInfo(query), tradeInfo);
    });

    test('check uri request, invalid response status', () async {
      const String uri = 'https://www.land.mlit.go.jp/webland/api/TradeListSearch?from=20221&to=20223';
      final client = MockClient();

      when(client.get(Uri.parse(uri))).thenAnswer((_) async => http.Response(tradeInfoString, 201, headers: {'content-type': 'application/json;charset=utf-8'}));

      final webLand = Webland(client: client);

      final query = TradeInfoQuery(from: '20221', to: '20223');
      expect(await webLand.getTradeInfo(query), null);
    });

    test('check uri request, invalid response body', () async {
      const String uri = 'https://www.land.mlit.go.jp/webland/api/TradeListSearch?from=20221&to=20223';
      final client = MockClient();

      when(client.get(Uri.parse(uri))).thenAnswer((_) async => http.Response('invalid json', 201, headers: {'content-type': 'application/json;charset=utf-8'}));

      final webLand = Webland(client: client);

      final query = TradeInfoQuery(from: '20221', to: '20223');
      expect(await webLand.getTradeInfo(query), null);
    });

    test('check city search uri request', () async {
      const String uri = 'https://www.land.mlit.go.jp/webland/api/CitySearch?area=27';
      const CityInfo cityInfo = CityInfo(
        status: 'OK',
        data: [
          CityData(id: '27100', name: '大阪市'),
          CityData(id: '27102', name: '都島区'),
          CityData(id: '27103', name: '福島区'),
        ]
      );
      final jsonString = await loadJsonString('./test/test_data/city_info.json');

      final client = MockClient();
      when(client.get(Uri.parse(uri))).thenAnswer((_) async => http.Response(jsonString, 200, headers: {'content-type': 'application/json;charset=utf-8'}));

      final webLand = Webland(client: client);
      
      expect(await webLand.getCityInfo('27'), cityInfo);
    });

  });
}
