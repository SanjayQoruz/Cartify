import 'package:fl_chart/fl_chart.dart' as charts;
import 'package:flutter/material.dart';

class CategoryProductsChart extends StatelessWidget {
  final List<charts.BarChartGroupData> seriesList;

  const CategoryProductsChart({
    Key? key,
    required this.seriesList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      charts.BarChartData(
        barGroups: seriesList,
        alignment: charts.BarChartAlignment.spaceBetween,
        titlesData: charts.FlTitlesData(
          
        ),
        borderData: charts.FlBorderData(show: true),
        gridData: charts.FlGridData(show: true),
        barTouchData: charts.BarTouchData(
          touchTooltipData: charts.BarTouchTooltipData(
            tooltipBgColor: Colors.blueAccent,
          ),
        ),
      ),
    );
  }
}
