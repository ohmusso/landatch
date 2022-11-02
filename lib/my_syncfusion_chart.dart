import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MySyncfusionChart<T> extends StatelessWidget {
  const MySyncfusionChart({
    super.key, 
    required this.chartDatas, 
    required this.valueSelector,
    required this.unit,
  });

  final List<T> chartDatas;
  final num? Function(T data, num _) valueSelector;
  final double unit;

  @override
  Widget build(BuildContext context){
    return Flexible(
      child: SfCartesianChart(
        primaryXAxis: NumericAxis(
          majorGridLines: const MajorGridLines(width: 0.1),
          minimum: 0,
          isInversed: true,
        ),
        primaryYAxis: NumericAxis(
          minimum: 0,
          interval: 1,
          majorTickLines: const MajorTickLines(size: 0.1)),
        series: <ChartSeries>[
          HistogramSeries<T, num>(
            dataSource: chartDatas,
            yValueMapper: valueSelector,
            binInterval: unit,
            sortFieldValueMapper: valueSelector,
            sortingOrder: SortingOrder.descending,
            showNormalDistributionCurve: false,
          ),
        ]
      )
    );
  }
}

const List<SalesData> data = [
  SalesData('Jan', 35),
  SalesData('Feb', 28),
  SalesData('Mar', 34),
  SalesData('Apr', 32),
  SalesData('May', 40)
];

class TestSyncfusionChart extends StatelessWidget {
  const TestSyncfusionChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syncfusion Flutter chart'),
      ),
      body: Center(
        child: SfCartesianChart(
          primaryXAxis: NumericAxis(
            majorGridLines: const MajorGridLines(width: 0.1),
            minimum: 0,
            isInversed: true,
          ),
          primaryYAxis: NumericAxis(
            minimum: 0,
            interval: 1,
            majorTickLines: const MajorTickLines(size: 0.1)),
          series: <ChartSeries>[
            HistogramSeries<SalesData, num>(
              dataSource: data,
              yValueMapper: (data, index) {
                debugPrint('index: $index, data: ${data.sales}');
                return data.sales;
              },
              binInterval: 5,
              showNormalDistributionCurve: false,
              // dataLabelSettings: const DataLabelSettings(
              //   isVisible: true,
              //   labelAlignment: ChartDataLabelAlignment.top,
              //   textStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
            ),
          ]
        )
      ),
   );
  }
}

class SalesData {
  const SalesData(this.year, this.sales);

  final String year;
  final double sales;
}