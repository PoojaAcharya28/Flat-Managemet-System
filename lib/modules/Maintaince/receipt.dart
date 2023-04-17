import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'maintaince_add.dart';
import 'dart:io';
//import 'package:printing/printing.dart';

//import 'calculation_modal.dart';

class ReceiptInfo extends StatefulWidget {
  const ReceiptInfo(
      {super.key,
      required this.rname,
      required this.rpayAmt,
      required this.rpayDate,
      required this.rstatus});

  final String rname;
  final String rpayAmt;
  final String rpayDate;
  final String rstatus;

  @override
  State<ReceiptInfo> createState() => _ReceiptInfoState();
}

class _ReceiptInfoState extends State<ReceiptInfo> {
  @override
  //  _generatePdf() {
  //   final pdf = pw.Document();

  //   pdf.addPage(
  //     pw.Page(
  //       pageFormat: PdfPageFormat.a4,
  //       build: (context) {
  //         return pw.Center(
  //           child: pw.Text('Hello World'),
  //         );
  //       },
  //     ),
  //   );

  //   final bytes = pdf.save();
  //   // TODO: Save the PDF bytes to a file or upload to a server.
  //   print('PDF file created successfully.');
  // }

  Widget _buildPaymentStatus() {
    if (widget.rstatus == "yes") {
      return Container(
        child: Column(
          children: [
            IconTheme(
              data: IconThemeData(
                color: Colors.green,
                size: 50,
              ),
              child: Icon(Icons.check_circle),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text("Payment Done",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 15,
            ),
            Text(
              "We have Received your Payment Amount Rs.${widget.rpayAmt} on time ${widget.rname} \n Thank you. ",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0),
            )
          ],
        ),
      );
    } else {
      return Container(
        child: Column(
          children: [
            IconTheme(
              data: IconThemeData(
                color: Colors.red,
                size: 50,
              ),
              child: Icon(Icons.cancel),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text("Payment Pending",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 15,
            ),
            Text(
              "We have not Received Payment Amount Rs.${widget.rpayAmt} on time ${widget.rname} \n Please do it at the earliest. ",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0),
            )
          ],
        ),
      );
    }
  }

  //............................

  Widget displayDataTable() {
    if (widget.rstatus == "yes") {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: DataTable(
          columns: [
            DataColumn(label: Text('Description')),
            DataColumn(label: Text('Amount')),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text('Payment Amount')),
              DataCell(Text("Rs. ${widget.rpayAmt}")),
            ]),
            DataRow(cells: [
              DataCell(Text("Date and Time")),
              DataCell(Text(
                "${widget.rpayDate}",
              )),
            ]),
            DataRow(cells: [
              DataCell(Text("Amount Paid")),
              DataCell(Text(
                "Rs. ${widget.rpayAmt}",
                style: TextStyle(color: Colors.green),
              )),
            ]),
          ],
        ),
      );
    } else {
      return DataTable(
        columns: [
          DataColumn(label: Text('Description')),
          DataColumn(label: Text('Amount')),
        ],
        rows: [
          DataRow(cells: [
            DataCell(Text('Payment Amount')),
            DataCell(Text("Rs. ${widget.rpayAmt}")),
          ]),
          DataRow(cells: [
            DataCell(Text("Amount Due")),
            DataCell(Text(
              "Rs. ${widget.rpayAmt}",
              style: TextStyle(color: Colors.red),
            )),
          ]),
        ],
      );
    }
  }

  Widget build(BuildContext context) {
    final pdf = pw.Document();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(156, 44, 85, 95),
        title: Text(
          'Receipt',
          style: TextStyle(color: Colors.white),
        ),
      ),
//       floatingActionButton: FloatingActionButton(
//   onPressed: _generatePdf,
//   child: Icon(Icons.add),
// ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // main content............
          children: [
            _buildPaymentStatus(),
            SizedBox(
              height: 15.0,
            ),

            Container(
              color: Colors.black,
              width: MediaQuery.of(context).size.width,
              height: 1.0,
            ),
            SizedBox(
              height: 15.0,
            ),

            Text(
              "Payment Details",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),

            SizedBox(
              height: 20.0,
            ),

            displayDataTable(),

            SizedBox(
              height: 20.0,
            ),

            Container(
              color: Colors.black,
              width: MediaQuery.of(context).size.width,
              height: 1.0,
            ),
            SizedBox(
              height: 15.0,
            ),
            //.......................

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Billed To:",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        "${widget.rname}".toUpperCase(),
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        "Grenoble Road PHA Apartment Mangalore, 575022",
                        //textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20.0),
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Billed From:",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          "Mr. Sikandar Tripathee".toUpperCase(),
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          "9756 Grenoble Road, near PHA Apartment Mangalore, 575022",
                          textAlign: TextAlign.right,
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          "Tripathee@gmail.com",
                          textAlign: TextAlign.right,
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          "949-357-4064",
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),

            Container(
              color: Colors.black,
              width: MediaQuery.of(context).size.width,
              height: 1.0,
            ),
            SizedBox(
              height: 15.0,
            ),
            //.............

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "For Any queries",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.email,
                      color: Color.fromARGB(230, 122, 34, 16),
                      size: 12.0,
                    ),
                    SizedBox(width: 5.0),
                    Text(
                      "Pha@gmail.com",
                      style: TextStyle(fontSize: 11.0),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.phone,
                      color: Color.fromARGB(230, 122, 34, 16),
                      size: 12.0,
                    ),
                    SizedBox(width: 5.0),
                    Text(
                      "949-357-4064",
                      style: TextStyle(fontSize: 11.0),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Color.fromARGB(230, 122, 34, 16),
                      size: 12.0,
                    ),
                    SizedBox(width: 5.0),
                    Flexible(
                      child: Text(
                        "9756 Grenoble Road, near PHA Apartment Mangalore, 575022",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 11.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
