import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../Controller/Admin/FinancialDashboardController.dart';

class Financialdashboard extends StatefulWidget {
  const Financialdashboard({super.key});

  @override
  State<Financialdashboard> createState() => _FinancialdashboardState();
}

class _FinancialdashboardState extends State<Financialdashboard> {
  final financialDashBoardController = Get.find<FinancialDashBoardController>();

  final ScrollController revenueScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(246, 246, 245, 1.0),
        appBar: AppBar(
          title: Text(
            "Transport  Financial Dashboard",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green[900],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Column(
              children: [
                SizedBox(height: 10),
                Obx(() {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    child: SizedBox(
                      height: Get.height * 0.22,
                      child: ListView.builder(
                        itemCount: financialDashBoardController.cardData.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final data =
                              financialDashBoardController.cardData[index];

                          return TopCard(
                            title: data["title"],
                            number: data["number"],
                            icon: data["icon"],
                          );
                        },
                      ),
                    ),
                  );
                }),

                SizedBox(height: 20),
                //revenu graph
                Container(
                  padding: const EdgeInsets.all(2.0),
                  child: Column(
                    children: [
                      Scrollbar(
                        controller: revenueScrollController,
                        thumbVisibility: true,
                        child: SingleChildScrollView(
                          controller: revenueScrollController,

                          scrollDirection: Axis.horizontal,
                          child: Container(
                            //   height: 300,
                            width: Get.width,
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: BoxBorder.all(
                                color: Color.fromRGBO(244, 241, 241, 1.0),
                              ),
                              color: Colors.white,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.trending_up,
                                      color: Colors.green[900],
                                      size: 25,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      "ToTal Revenue Generate by Points",
                                      style: TextStyle(
                                        color: Colors.green[900],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15),
                                Obx(() {
                                  List<RevenueData> graphData =
                                      financialDashBoardController.revenueData
                                          .where(
                                            (item) =>
                                                item["r_name"].toString() !=
                                                "Grand Total",
                                          )
                                          .map((item) {
                                            return RevenueData(
                                              month: item["r_name"].toString(),
                                              revenue: double.parse(
                                                item["revenue"].toString(),
                                              ),
                                            );
                                          })
                                          .toList();
                                  return SfCartesianChart(
                                    plotAreaBorderColor: Colors.transparent,

                                    //  backgroundColor: Colors.purple,
                                    primaryXAxis: CategoryAxis(
                                      labelIntersectAction:
                                          AxisLabelIntersectAction.wrap,
                                    ),

                                    primaryYAxis: NumericAxis(
                                      majorGridLines: const MajorGridLines(
                                        width: 0,
                                      ),
                                    ),

                                    tooltipBehavior: TooltipBehavior(
                                      enable: true,
                                    ),

                                    series: <CartesianSeries>[
                                      ColumnSeries<RevenueData, String>(
                                        dataSource: graphData,

                                        xValueMapper: (RevenueData data, _) =>
                                            data.month,
                                        yValueMapper: (RevenueData data, _) =>
                                            data.revenue,

                                        color: Colors.green[900],
                                        name: 'Revenue',

                                        // width: 0.6,
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(5),
                                          topLeft: Radius.circular(5),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                              ],
                            ),
                          ),
                        ),
                      ),
                      //SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                          ),
                          border: const Border(
                            bottom: BorderSide(
                              color: Color.fromRGBO(186, 239, 158, 0.3),
                              width: 1,
                            ),
                          ),
                          color: Color.fromRGBO(186, 239, 158, 0.5),
                        ),
                        padding: EdgeInsets.all(23),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Revenue Generated By All Point",
                              style: TextStyle(
                                color: Colors.green[900],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Obx(() {
                              final grandTotal = financialDashBoardController
                                  .revenueData
                                  .firstWhere(
                                    (item) => item["r_name"] == "Grand Total",
                                    orElse: () => {"revenue": "0"},
                                  )["revenue"]
                                  .toString();
                              print("grandTotal $grandTotal");
                              return Text(
                                grandTotal,
                                style: TextStyle(
                                  color: Colors.green[900],
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 30),

                TableData(
                  title: 'Driver Salary',
                  subTitle: 'Totals of Driver Salary',
                  icon: Icons.attach_money,
                  heading_1: "Driver Name",
                  heading_2: "One Month Salary",
                  heading_3: "Six Month Salary",
                  tableData: financialDashBoardController.salaryData,
                ),
                SizedBox(height: 10),

                TableData(
                  title: 'Petrol Cost',
                  subTitle: 'Total Petrol Cost of All Point',
                  icon: Icons.local_gas_station_outlined,
                  heading_1: "Route Name",
                  heading_2: "One Month Petrol Cost",
                  heading_3: "Six Month Petrol Cost",
                  tableData: financialDashBoardController.petrolData,
                ),
                SizedBox(height: 10),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 23),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: BoxBorder.all(
                      color: Color.fromRGBO(244, 241, 241, 1.0),
                    ),
                    color: Colors.white,
                  ),
                  child: Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/money.png",
                        color: Color.fromRGBO(15, 81, 20, 0.4),
                        height: 100,
                      ),
                      SizedBox(width: 12),
                      Column(
                        children: [
                          Text(
                            "Total Profit",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Obx(
                            () => Text(
                              financialDashBoardController.profit.value.toString(),

                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color:financialDashBoardController.profit.value.isNegative? Colors.red : Colors.green[500],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TableData extends StatefulWidget {
  final String title;
  final String subTitle;
  final IconData icon;
  final String heading_1;
  final String heading_2;
  final String heading_3;
  final List<Map<String, dynamic>> tableData;

  const TableData({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.heading_1,
    required this.heading_2,
    required this.heading_3,
    required this.tableData,
  });

  @override
  State<TableData> createState() => _TableDataState();
}

class _TableDataState extends State<TableData> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    // print("tableData ${widget.tableData}");
    final total = widget.tableData.firstWhere(
      (item) => item["name"].toString() == "Total",
      orElse: () => {"one_month": "0", "six_month": "0"},
    );

    final String oneMonth = total["one_month"].toString();
    final String sixMonth = total["six_month"].toString();

    return Column(
      children: [
        ///Petrol container
        Container(
          width: Get.width,
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: BoxBorder.all(color: Color.fromRGBO(244, 241, 241, 1.0)),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(widget.icon, color: Colors.green[900], size: 25),
                  SizedBox(width: 8),
                  Text(
                    widget.title,
                    style: TextStyle(
                      color: Colors.green[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 15),
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: BoxBorder.all(color: Colors.transparent),
                ),
                child: Column(
                  children: [
                    Scrollbar(
                      controller: scrollController,
                      thumbVisibility: true,
                      child: SingleChildScrollView(
                        controller: scrollController,
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          headingRowColor: WidgetStateProperty.all(
                            Colors.green[900],
                          ),
                          headingTextStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          columns: [
                            DataColumn(label: Text(widget.heading_1)),
                            DataColumn(label: Text(widget.heading_2)),
                            DataColumn(label: Text(widget.heading_3)),
                          ],
                          rows: widget.tableData
                              .where((item) => item["name"] != "Total")
                              .map((item) {
                                return DataRow(
                                  cells: [
                                    DataCell(Text(item["name"])),
                                    DataCell(Text(item["one_month"])),
                                    DataCell(Text(item["six_month"])),
                                  ],
                                );
                              })
                              .toList(),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            border: BoxBorder.all(color: Color.fromRGBO(244, 241, 241, 1.0)),
            borderRadius: BorderRadius.circular(5),
          ),

          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(widget.icon, color: Colors.green[900]),
                  SizedBox(width: 10),
                  Text(
                    widget.subTitle,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green[900],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(186, 239, 158, 0.3),

                  borderRadius: BorderRadius.circular(5),
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          "One Month",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green[900],
                          ),
                        ),
                        SizedBox(height: 4),

                        Text(oneMonth),
                      ],
                    ),
                    Container(height: 40, width: 1.3, color: Colors.grey),
                    Column(
                      children: [
                        Text(
                          "Six Month",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green[900],
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(sixMonth),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 20),
      ],
    );
  }
}

class RevenueData {
  final String month;
  final double revenue;

  RevenueData({required this.month, required this.revenue});
}

class TopCard extends StatelessWidget {
  final String title;
  final int number;
  final IconData icon;

  const TopCard({
    super.key,
    required this.title,
    required this.number,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 10, sigmaX: 20),
        child: Card(
          margin: EdgeInsets.all(8),
          color: Colors.white,
          elevation: 4.5,

          shadowColor: Colors.black54,
          child: Container(
            width: 150,
            // height: 300,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: BoxBorder.all(color: Color.fromRGBO(239, 236, 236, 1.0)),
              //  color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(65, 223, 75, 0.1),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(icon, color: Colors.green[900], size: 34),
                ),
                SizedBox(height: 12),
                Text(
                  "$number",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12),
                Text(title, style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
