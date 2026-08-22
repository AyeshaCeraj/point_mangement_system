import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Financialdashboard extends StatelessWidget {
  const Financialdashboard({super.key});

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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1),
                  child: SizedBox(
                    height: Get.height * 0.2,
                    child: ListView.builder(
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return TopCard();
                      },
                    ),
                  ),
                ),

                SizedBox(height: 20),
                //revenu graph
                Container(
                  padding: const EdgeInsets.all(2.0),
                  child: Column(
                    children: [
                      Scrollbar(
                        thumbVisibility: true,
                        child: SingleChildScrollView(
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
                                SfCartesianChart(
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
                                      dataSource: [
                                        RevenueData('Gulshan Haddeed', 22000),
                                        RevenueData('Gulshan Johar', 18000),
                                        RevenueData('Defence', 17000),
                                        RevenueData('Khokrapar', 16000),
                                        RevenueData('Kemari', 13000),
                                      ],

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
                                ),
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
                            Text(
                              "127000",
                              style: TextStyle(
                                color: Colors.green[900],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                //   SizedBox(height: 10),

                // ///driver container
                // Container(
                //   width: Get.width,
                //   padding: EdgeInsets.all(12),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(5),
                //     border: BoxBorder.all(
                //       color: Color.fromRGBO(244, 241, 241, 1.0),
                //     ),
                //     color: Colors.white,
                //   ),
                //   child: Column(
                //     children: [
                //       Row(
                //         children: [
                //           Icon(
                //             Icons.monetization_on_outlined,
                //             color: Colors.green[900],
                //             size: 25,
                //           ),
                //           SizedBox(width: 8),
                //           Text(
                //             "Driver Salary",
                //             style: TextStyle(
                //               color: Colors.green[900],
                //               fontWeight: FontWeight.bold,
                //               fontSize: 16,
                //             ),
                //           ),
                //         ],
                //       ),
                //
                //       SizedBox(height: 15),
                //       Container(
                //         clipBehavior: Clip.antiAlias,
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(8),
                //           border: BoxBorder.all(color: Colors.transparent),
                //         ),
                //         child: Scrollbar(
                //           thumbVisibility: true,
                //           child: SingleChildScrollView(
                //             scrollDirection: Axis.horizontal,
                //             child: DataTable(
                //               headingRowColor: WidgetStateProperty.all(
                //                 Colors.green[900],
                //               ),
                //               headingTextStyle: TextStyle(
                //                 color: Colors.white,
                //                 fontWeight: FontWeight.bold,
                //               ),
                //               columns: [
                //                 DataColumn(label: Text("Name")),
                //                 DataColumn(label: Text("One Month Salary")),
                //                 DataColumn(label: Text("Six Month Salary")),
                //               ],
                //               rows: [
                //                 DataRow(
                //                   cells: [
                //                     DataCell(Text("Ahmed Khan")),
                //                     DataCell(Text("12000")),
                //                     DataCell(Text("240000")),
                //                   ],
                //                 ),
                //
                //                 DataRow(
                //                   cells: [
                //                     DataCell(Text("Ahmed Khan")),
                //                     DataCell(Text("12000")),
                //                     DataCell(Text("240000")),
                //                   ],
                //                 ),
                //
                //                 DataRow(
                //                   cells: [
                //                     DataCell(Text("Ahmed Khan")),
                //                     DataCell(Text("12000")),
                //                     DataCell(Text("240000")),
                //                   ],
                //                 ),
                //                 DataRow(
                //                   cells: [
                //                     DataCell(Text("Ahmed Khan")),
                //                     DataCell(Text("12000")),
                //                     DataCell(Text("240000")),
                //                   ],
                //                 ),
                //                 DataRow(
                //                   cells: [
                //                     DataCell(Text("Ahmed Khan")),
                //                     DataCell(Text("12000")),
                //                     DataCell(Text("240000")),
                //                   ],
                //                 ),
                //                 DataRow(
                //                   color: WidgetStateProperty.all(
                //                     Color.fromRGBO(186, 239, 158, 0.5),
                //                   ),
                //                   cells: [
                //                     DataCell(Text("Total")),
                //                     DataCell(Text("12000")),
                //                     DataCell(Text("240000")),
                //                   ],
                //                 ),
                //               ],
                //             ),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                SizedBox(height: 30),

                TableData(
                  title: 'Driver Salary',
                  subTitle: 'Totals of Driver Salary',
                  icon: Icons.attach_money,
                  heading_1: "Driver Name",
                  heading_2: "One Month Salary",
                  heading_3: "Six Month Salary",
                ),
                SizedBox(height: 10),

                TableData(
                  title: 'Petrol Cost',
                  subTitle: 'Total Petrol Cost of All Point',
                  icon: Icons.local_gas_station_outlined,
                  heading_1: "Route Name",
                  heading_2: "One Month Petrol Cost",
                  heading_3: "Six Month Petrol Cost",
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
                      SizedBox(width: 12,),
                      Column(
                        children: [
                          Text("Total Profit", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                          SizedBox(height: 4,),
                          Text("- 630,345",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.red)),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TableData extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData icon;
  final String heading_1;
  final String heading_2;
  final String heading_3;

  const TableData({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.heading_1,
    required this.heading_2,
    required this.heading_3,
  });

  @override
  Widget build(BuildContext context) {
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
                  Icon(icon, color: Colors.green[900], size: 25),
                  SizedBox(width: 8),
                  Text(
                    title,
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
                      thumbVisibility: true,
                      child: SingleChildScrollView(
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
                            DataColumn(label: Text(heading_1)),
                            DataColumn(label: Text(heading_2)),
                            DataColumn(label: Text(heading_3)),
                          ],
                          rows: [
                            DataRow(
                              cells: [
                                DataCell(Text("Gulshan-e-hadeed")),
                                DataCell(Text("12000")),
                                DataCell(Text("240000")),
                              ],
                            ),

                            DataRow(
                              cells: [
                                DataCell(Text("Gulshan-e-hadeed")),
                                DataCell(Text("12000")),
                                DataCell(Text("240000")),
                              ],
                            ),

                            DataRow(
                              cells: [
                                DataCell(Text("Gulshan-e-hadeed")),
                                DataCell(Text("12000")),
                                DataCell(Text("240000")),
                              ],
                            ),
                            DataRow(
                              cells: [
                                DataCell(Text("Gulshan-e-hadeed")),
                                DataCell(Text("12000")),
                                DataCell(Text("240000")),
                              ],
                            ),
                            DataRow(
                              cells: [
                                DataCell(Text("Gulshan-e-hadeed")),
                                DataCell(Text("12000")),
                                DataCell(Text("240000")),
                              ],
                            ),
                            // DataRow(
                            //   color: WidgetStateProperty.all(
                            //     Color.fromRGBO(186, 239, 158, 0.5),
                            //   ),
                            //   cells: [
                            //     DataCell(Text("Total")),
                            //     DataCell(Text("12000")),
                            //     DataCell(Text("240000")),
                            //   ],
                            // ),
                          ],
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
                  Icon(icon, color: Colors.green[900]),
                  SizedBox(width: 10),
                  Text(
                    subTitle,
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
                        Text("One Month",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green[900]),),
                        SizedBox(height: 4),

                        Text("1249600"),
                      ],
                    ),
                    Container(height: 40, width: 1.3, color: Colors.grey),
                    Column(
                      children: [
                        Text("Six Month",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green[900])),
                        SizedBox(height: 4),
                        Text("1249600"),
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

  RevenueData(this.month, this.revenue);
}

class TopCard extends StatelessWidget {
  const TopCard({super.key});

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
            width: 130,
            height: 200,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: BoxBorder.all(color: Color.fromRGBO(239, 236, 236, 1.0)),
              //  color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(65, 223, 75, 0.1),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(
                    Icons.location_on_outlined,
                    color: Colors.green[900],
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  "5",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12),
                Text("Total Point", style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
