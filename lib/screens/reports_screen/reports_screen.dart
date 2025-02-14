import 'package:biking_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'data/reports_data.dart';
import 'widgets/reports_widgets.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({Key? key}) : super(key: key);
  static String routeName = 'ReportsScreen';

  @override
  _ReportsScreenState createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pelaporan',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.w700)),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: kOtherColor,
                borderRadius: kTopBorderRadius,
              ),
              child: ListView.builder(
                  padding: EdgeInsets.all(kDefaultPadding),
                  itemCount: reports.length,
                  itemBuilder: (context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'SiswaReportsScreen');
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: kDefaultPadding),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(kDefaultPadding),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(kDefaultPadding),
                                color: kOtherColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: kTextLightColor,
                                    blurRadius: 2.0,
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 40.w,
                                    height: 3.h,
                                    decoration: BoxDecoration(
                                      color: kSecondaryColor,
                                      borderRadius: BorderRadius.circular(
                                          kDefaultPadding),
                                    ),
                                    child: Center(
                                      child: Text(
                                        reports[index].subjectName,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall!
                                            .copyWith(
                                              color: kTextWhiteColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ),
                                  kHalfSizedBox,
                                  Text(
                                    reports[index].topicName,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                          color: kTextBlackColor,
                                          fontWeight: FontWeight.w900,
                                        ),
                                  ),
                                  kHalfSizedBox,
                                  ReportsRow(
                                    title: 'Status',
                                    statusValue: reports[index].status,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
