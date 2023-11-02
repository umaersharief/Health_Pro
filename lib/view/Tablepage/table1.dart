import 'package:flutter/material.dart';
import 'package:health_pro/view/widgets/widgets/custom_text.dart';

class Table1 extends StatelessWidget {
  const Table1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: DataTable(
              headingRowColor:
                  MaterialStateColor.resolveWith((states) => Color(0xffDEEAFF)),
              columns: [
                DataColumn(label: customTextRegular(title: '')),
                DataColumn(label: customTextRegular(title: 'Quantity')),
                DataColumn(label: customTextRegular(title: 'Category')),
                DataColumn(label: customTextRegular(title: 'Actual Rate')),
                DataColumn(label: customTextRegular(title: 'Discounted Rate')),
                DataColumn(label: customTextRegular(title: 'Final')),
                DataColumn(
                    label: customTextRegular(title: 'Family Package Deal')),
              ],
              rows: List.generate(
                6,
                (index) => DataRow(
                  cells: [
                    DataCell(customTextRegular(title: 'Adult')),
                    DataCell(customTextRegular(title: '2')),
                    DataCell(customTextRegular(title: 'Gold')),
                    DataCell(customTextRegular(title: 'QAR 200')),
                    DataCell(customTextRegular(title: 'QAR 175')),
                    DataCell(customTextRegular(title: 'QAR 350')),
                    DataCell(customTextRegular(title: 'QAR 650')),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
