import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'my_syncfusion_chart.dart';
import 'web_api/webland.dart';

final weblandApiProvider = Provider((_) =>  Webland(client: http.Client())); 

final prefecturesProvider = FutureProvider<List<Prefecture>>((ref,) async {
  final List<Prefecture> prefectures;
  final str = await rootBundle.loadString('assets/webland_area.json');
  final jsons = jsonDecode(str);
  if (jsons is List) {
    prefectures = jsons.map((json) => Prefecture.fromJson(json)).toList();
  } else {
    prefectures = [];
  }

  return prefectures;
});

final selectPrefectureProvider = StateProvider<Prefecture?>((ref) => null);

final cityInfoProvider = FutureProvider.family<CityInfo?, Locale>((ref, local) async {
  final prefecture = ref.watch(selectPrefectureProvider);

  if (prefecture == null ) return null;

  final area = prefecture.id ?? '';

  if (area == '' ) return null;

  final weblandApi = ref.read(weblandApiProvider);
  final isJp = (local.languageCode == 'ja') ? true : false; 
  final cityInfo = await weblandApi.getCityInfo(area, isJp: isJp);
  return cityInfo;
});

final selectCityProvider = StateProvider<CityData?>((ref) => null);

final selectYearProvider = StateProvider<String?>((ref) => null);

final tradeInfoProvider = FutureProvider.family<TradeInfo?, Locale>((ref, locale) async {
  final year = ref.watch(selectYearProvider);
  final area = ref.read(selectPrefectureProvider)?.id;
  final city = ref.read(selectCityProvider)?.id;

  if (area == null || city == null || year == null) {
    return null;
  }

  final weblandApi = ref.read(weblandApiProvider);
  final query = TradeInfoQuery(from: '${year}1', to: '${year}4', area: area, city: city);
  final isJp = (locale.languageCode == 'ja') ? true : false; 

  debugPrint('tradeInfoProvider: ${query.from}, ${query.to}, ${query.area}, ${query.city}');

  final ret = await weblandApi.getTradeInfo(query, isJp: isJp);
  if (ret == null && ret!.data == null) {
    return null;
  }

  List<TradeData> tradeDatas = ret.data!;
  tradeDatas = tradeDatas.map((e) {
    final tradePrice = e.tradePrice != null ? _convertManYen(e.tradePrice!, locale.languageCode) : null;
    final pricePerUnit = e.pricePerUnit != null ? _convertManYen(e.pricePerUnit!, locale.languageCode) : null;
    final unitPrice = e.unitPrice != null ? _convertManYen(e.unitPrice!, locale.languageCode) : null;
    final tradeData = e.copyWith(tradePrice: tradePrice, pricePerUnit: pricePerUnit, unitPrice: unitPrice);
    return tradeData;
  }).toList();

  final tradeInfo = ret.copyWith(data: tradeDatas);
  return tradeInfo;
});

String _convertManYen(String yen, String languageCode) {
  if (yen.isEmpty) return '';

  if (languageCode == 'ja') {
    double doubleYen = double.parse(yen);
    doubleYen = (doubleYen / _currencyUnit(languageCode));
    return doubleYen.toStringAsFixed(2);
  } else {
    double doubleYen = double.parse(yen);
    doubleYen = (doubleYen / _currencyUnit(languageCode));
    return doubleYen.toStringAsFixed(3);
  }
}

double _currencyUnit(String languageCode) {
  if (languageCode == 'ja') {
    return 10000.0;
  } else {
    return (130 * 1000);
  }
}

class WeblandHome extends StatelessWidget {
  const WeblandHome ({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Landatch in Japan"),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.search)),
              Tab(icon: Icon(Icons.list)),
            ]
          ),
        ),
        body: const TabBarView(
          children: [
            WeblandHomeTab(),
            TradeDataListTab()
          ],
        ),
      ),
    );
  }
}

class WeblandHomeTab extends StatelessWidget {
  const WeblandHomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: const [
            PrefectureSelector(),
            CitiesSelector(),
            TradeYearSelector(),
            TradeDataSummary(),
          ],
        ),
      ),
    );
  }
}

class PrefectureSelector extends ConsumerWidget {
  const PrefectureSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<Prefecture>> data = ref.watch(prefecturesProvider);

    return data.when(
      data: (data) {
        return PrefectureDropdownButton(prefectures: data);
      },
      error: (error, stackTrace) {
        return Text("Http Error: $error");        
      }, 
      loading: () {
        return const CircularProgressIndicator();
      },
    );
  }
}

class PrefectureDropdownButton extends ConsumerWidget {
  const PrefectureDropdownButton({super.key, required this.prefectures});

  final List<Prefecture> prefectures;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = Localizations.localeOf(context) ;
    final selected = ref.watch(selectPrefectureProvider);
    final menuItems = prefectures.map((prefecture) => DropdownMenuItem(value: prefecture, child: locale.languageCode == 'ja' ? Text(prefecture.jp ?? '') : Text(prefecture.en ?? ''),)).toList();
    debugPrint('PrefectureDropdownButton: ${selected?.jp}');

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)
        ),
        padding: const EdgeInsets.all(4.0),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<Prefecture>(
            value: selected,
            icon: const Icon(Icons.arrow_drop_down),
            isExpanded: true,
            elevation: 10,
            items: menuItems,
            onChanged: (Prefecture? value) {
              ref.read(selectPrefectureProvider.notifier).state = value;
            },
          ),
        ),
      ),
    );
  }
}

class CitiesSelector extends ConsumerWidget {
  const CitiesSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final local = Localizations.localeOf(context);
    AsyncValue<CityInfo?> cityInfo = ref.watch(cityInfoProvider(local));

    return cityInfo.when(
      data: (cityInfo) {
        if (cityInfo == null) return const CityDropdownButton(cities: []);
        if (cityInfo.data == null) return const CityDropdownButton(cities: []);

        debugPrint('CitiesSelector: ${cityInfo.data?.first}');
        return CityDropdownButton(cities: cityInfo.data!);
      },
      error: (error, stackTrace) {
        return Text("Http Error: $error");        
      }, 
      loading: () {
        return const CircularProgressIndicator();
      },
    );
  }
}

class CityDropdownButton extends ConsumerWidget {
  const CityDropdownButton({super.key, required this.cities});

  final List<CityData> cities;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(selectCityProvider);
    final menuItems = cities.map((city) => DropdownMenuItem(value: city, child: Text(city.name ?? ''),)).toList();
    debugPrint('CityDropdownButton: ${selected?.name}');

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)
        ),
        padding: const EdgeInsets.all(4.0),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<CityData>(
            value: cities.contains(selected) ? selected : null,
            icon: const Icon(Icons.arrow_drop_down),
            isExpanded: true,
            elevation: 10,
            items: menuItems,
            onChanged: (CityData? value) {
              ref.read(selectCityProvider.notifier).state = value;
              ref.read(selectYearProvider.notifier).state = null;
            },
          ),
        ),
      ),
    );
  }
}

// const List<String> _years = [
//   '2005', '2006', '2007', '2008', '2009', '2010', '2011', '2012', '2013', '2014',
//   '2015', '2016', '2017', '2018', '2019', '2020', '2021', '2022', '2023', '2024',
//   '2025', '2026', '2027', '2028', '2029', '2030', '2031', '2032', '2033', '2034',
// ];

const _offsetYear = 2005;

List<String> _years() {
  final now = DateTime.now();
  final range =  now.year - _offsetYear + 1;
  final list = List.generate(range, (index) => (index + _offsetYear).toString(), growable: false);

  return list;
}

class TradeYearSelector extends ConsumerWidget {
  const TradeYearSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final years = _years();
    final selected = ref.watch(selectYearProvider);
    final menuItems = years.map((year) => DropdownMenuItem(value: year, child: Text(year),)).toList();
  
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)
        ),
        padding: const EdgeInsets.all(4.0),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: years.contains(selected) ? selected : null,
            icon: const Icon(Icons.arrow_drop_down),
            isExpanded: true,
            elevation: 10,
            items: menuItems,
            onChanged: (String? value) {
              debugPrint('TradeYearSelector: onChanged');
              ref.read(selectYearProvider.notifier).state = value ?? '2005';
            },
          ),
        ),
      ),
    );
  }
}

class TradeDataSummary extends ConsumerWidget {
  const TradeDataSummary({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = Localizations.localeOf(context);
    AsyncValue<TradeInfo?> tradeInfo = ref.watch(tradeInfoProvider(locale));

    return tradeInfo.when(
      data: (tradeInfo) {
        if (tradeInfo == null) return const Text('-');
        return TradeDataSummaryCard(tradeDatas: tradeInfo.data!, languageCode: locale.languageCode);
      },
      error: (error, stackTrace) {
        return Text("Http Error: $error");        
      }, 
      loading: () {
        return const CircularProgressIndicator();
      },
    );
  }
}

class TradeDataListTab extends ConsumerWidget {
  const TradeDataListTab({Key? key}): super(key: key);
 
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final local = Localizations.localeOf(context);
    AsyncValue<TradeInfo?> tradeInfo = ref.watch(tradeInfoProvider(local));
    return tradeInfo.when(
      data: (data) {
        final List<TradeData> tradeDatas;
        if (data == null) {
          tradeDatas = [];
        } else {
          tradeDatas = data.data ?? [];
        }
        return TradeDataListView(tradeDatas: tradeDatas,);
      },
      error: (error, stackTrace) {
        return Text("Http Error: $error");        
      }, 
      loading: () {
        return const CircularProgressIndicator();
      },
    );
  }
}

class TradeDataListView extends StatelessWidget {
  const TradeDataListView({super.key, required this.tradeDatas});

  final List<TradeData> tradeDatas; 

  @override
  Widget build(BuildContext context) {
    List<Widget> cards = tradeDatas.map((data) {
      return HeroAnimation(tradeData: data,);
    },).toList();

    return ListView(
      children: cards,
    );
  }
}

class TradeDataSummaryCard extends StatelessWidget {
  const TradeDataSummaryCard({super.key, required this.tradeDatas, required this.languageCode});

  final String languageCode;
  final List<TradeData> tradeDatas;

  @override
  Widget build(BuildContext context) {
    final average = _calcAverage(tradeDatas);
    final median = _calcMedian(tradeDatas);
    final max = tradeDatas.fold(0.0, (pre, next) {
      final tradePrice = double.parse(next.tradePrice!);
      return pre < tradePrice ? tradePrice : pre;
    });
    final min = tradeDatas.fold(double.maxFinite, (pre, next) {
      final tradePrice = double.parse(next.tradePrice!);
      return pre > tradePrice ? tradePrice : pre;
    });

    debugPrint('average: $average');

    const style = TextStyle( fontSize: 14,);

    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.summarize), 
              title: Text(AppLocalizations.of(context)!.summary)
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      '${AppLocalizations.of(context)!.numberOfTrades}: ${tradeDatas.length}',
                      style: style
                    ),
                    Tooltip(
                      message: AppLocalizations.of(context)!.currencyUnit,
                      child: Text(
                        '${AppLocalizations.of(context)!.max}: $max',
                        style: style,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Tooltip(
                      message: AppLocalizations.of(context)!.currencyUnit,
                      child: Text(
                        '${AppLocalizations.of(context)!.average}: $average',
                        style: style,
                      ),
                    ),                    
                    Tooltip(
                      message: AppLocalizations.of(context)!.currencyUnit,
                      child: Text(
                        '${AppLocalizations.of(context)!.min}: $min',
                        style: style,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Tooltip(
                      message: AppLocalizations.of(context)!.currencyUnit,
                      child: Text(
                        '${AppLocalizations.of(context)!.median}: $median',
                        style: style,
                      ),
                    ),  
                    const Text(''),
                  ],
                ),
              ],
            ),
            MySyncfusionChart<TradeData>(chartDatas: tradeDatas, unit: (median / 3), valueSelector: ((data, _) {
              if (data.tradePrice == null) {
                return null;
              } else {
                return double.parse(data.tradePrice!);
              }
            }),),
          ],
        ),
      ),
    );
  }

  int _calcAverage(List<TradeData> tradeDatas) {
    double ave = 0;
    int num = 1;

    final datas = tradeDatas.where((element) => element.tradePrice != null);
    for (var data in datas) {
      final price = double.parse(data.tradePrice!);
//      debugPrint('price: $price, num: $num');
      ave = ave + ((price - ave) / num);
      num++;
    }
    return ave.round();
  }

  double _calcMedian(List<TradeData> tradeDatas) {

    final tradePrices = tradeDatas.where((element) => element.tradePrice != null).map((e) => double.parse(e.tradePrice!)).toList();
    tradePrices.sort((a, b) => a.compareTo(b));
    final medianIndex = (tradePrices.length / 2).round();

    return tradePrices[medianIndex];
  }

}

class TradeDataCard extends StatelessWidget {
  const TradeDataCard({super.key, required this.tradeData,});

  final TradeData tradeData;

  @override
  Widget build(BuildContext context) {
    final local = Localizations.localeOf(context);
    final String districtName = tradeData.districtName ?? '';
    final String type = tradeData.type ?? '';
    final String tradePrice = tradeData.tradePrice ?? '';
    final String pricePerUnit = (local.languageCode == 'ja') ? tradeData.pricePerUnit ?? '': tradeData.unitPrice ?? '';
    final String area= tradeData.area ?? '';
    final String buildingYear = tradeData.buildingYear ?? '';

    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Column(
        children: [
          TopTile(title: districtName, subTitle: type, icon: Icons.place),
          const Divider(),
          Tooltip(
            message: AppLocalizations.of(context)!.currencyUnit,
            child: SubTile(title: AppLocalizations.of(context)!.tradePrice, subTitle: tradePrice,),
          ),
          Tooltip(
            message: AppLocalizations.of(context)!.currencyUnit,
            child: SubTile(title: AppLocalizations.of(context)!.unitPrice, subTitle: pricePerUnit),
          ),
          SubTile(title: AppLocalizations.of(context)!.buildingYear, subTitle: buildingYear),
          Tooltip(
            message: '㎡',
            child: SubTile(title: AppLocalizations.of(context)!.area, subTitle: area),
          )
        ],
      ),
    );
  }
}

class TradeDataDetaileCard extends StatelessWidget {
  const TradeDataDetaileCard({super.key, required this.tradeData});

  final TradeData tradeData;

  @override
  Widget build(BuildContext context) {
    final String structure = tradeData.structure ?? '';
    final String use = tradeData.use ?? '';
    final String purpose = tradeData.purpose ?? '';

    List<Widget> items = [];

    items.add(TopTile(title: AppLocalizations.of(context)!.detaile, subTitle: null, icon: Icons.info,));
    items.add(SubTile(title: AppLocalizations.of(context)!.structure, subTitle: structure));
    items.add(SubTile(title: AppLocalizations.of(context)!.use, subTitle: use));
    items.add(SubTile(title: AppLocalizations.of(context)!.purpose, subTitle: purpose));

    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Column(
        children: items,
      ),
    );
  }
}

class TopTile extends StatelessWidget {
  const TopTile({super.key, required this.title, required this.subTitle, required this.icon});

  final String title;
  final String? subTitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        )
      ),
      subtitle: (subTitle != null) ? Text(subTitle!) : null,
      leading: Icon(
        icon,
        color: Colors.blue[500],
      ),
    );    
  }
}

class SubTile extends StatelessWidget {
  const SubTile({super.key, required this.title, required this.subTitle});

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(70, 8, 0, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('$title: '),
          Text(
            subTitle,
          ),
        ],
      ),
    );
  }
}

class DetaileCard extends StatelessWidget {
  const DetaileCard({
    super.key,
    required this.tradeData,
  });

  final TradeData tradeData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Hero(
              tag: tradeData.hashCode,
              child: TradeDataCard(tradeData: tradeData,),
          ),
          TradeDataDetaileCard(tradeData: tradeData,),
        ],
      ),
      // body: Column(
      //   children: [
      //     Hero(
      //       tag: tradeData.hashCode,
      //       child: TradeDataCard(tradeData: tradeData, isDetaile: false),
      //     ),
      //     TradeDataDetaileCard(tradeData: tradeData,),
      //   ],
      // ),
    );
  }
}

class HeroAnimation extends StatelessWidget {
  const HeroAnimation({super.key, required this.tradeData});

  final TradeData tradeData; 

  final Interval opacityCurve = const Interval(0.0, 0.75, curve: Curves.fastOutSlowIn);

  @override
  Widget build(BuildContext context) {

    return InkWell(
      child: Hero(
        tag: tradeData.hashCode,
        child: TradeDataCard(tradeData: tradeData,),
      ),
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return AnimatedBuilder(
                animation: animation,
                builder: ((context, child) {
                  return Opacity(
                    opacity: opacityCurve.transform(animation.value),
                    child: DetaileCard(tradeData: tradeData,),
                  );
                })
              );
            },
          )
        );
      }
    );
  }
}
