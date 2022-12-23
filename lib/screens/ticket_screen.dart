import 'package:example_project6/screens/ticket_view.dart';
import 'package:example_project6/utils/app_info_list.dart';
import 'package:example_project6/utils/app_layout.dart';
import 'package:example_project6/utils/app_styles.dart';
import 'package:example_project6/widgets/column_layout.dart';
import 'package:example_project6/widgets/layout_builder_widget.dart';
import 'package:example_project6/widgets/tickets_tabs.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:barcode_widget/barcode_widget.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.symmetric(
                horizontal: AppLayout.getHeight(20),
                vertical: AppLayout.getHeight(20)),
            children: [
              Gap(AppLayout.getHeight(40)),
              Text('Tickets', style: Styles.headLineStyle1),
              Gap(AppLayout.getHeight(20)),
              const AppTicketTabs(firstTab: 'Upcoming', secondTab: 'Previous'),
              Gap(AppLayout.getHeight(20)),

              //Ticketview section
              Container(
                padding: EdgeInsets.only(left: AppLayout.getHeight(15)),
                child: TicketView(
                  ticket: ticketList[0],
                  isColor: false,
                ),
              ),

              //Flutter DB below section
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppLayout.getHeight(18),
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 1),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(AppLayout.getHeight(21)),
                          topRight: Radius.circular(AppLayout.getHeight(21)),
                          bottomLeft: Radius.circular(AppLayout.getHeight(21)),
                          bottomRight:
                              Radius.circular(AppLayout.getHeight(21)))),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          AppColumnLayout(
                            firstText: 'Flutter DB',
                            secondText: 'Passenger',
                            alignment: CrossAxisAlignment.start,
                            isColor: false,
                          ),
                          AppColumnLayout(
                            firstText: '5221 478566',
                            secondText: 'Passport',
                            alignment: CrossAxisAlignment.end,
                            isColor: false,
                          ),
                        ],
                      ),
                      Gap(AppLayout.getHeight(20)),
                      const AppLayoutBuilderWidget(
                        sections: 15,
                        isColor: false,
                        width: 5,
                      ),
                      Gap(AppLayout.getHeight(20)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          AppColumnLayout(
                            firstText: '2277 676 87456',
                            secondText: 'Number of E-ticket',
                            alignment: CrossAxisAlignment.start,
                            isColor: false,
                          ),
                          AppColumnLayout(
                            firstText: 'A2RG66',
                            secondText: 'Booking code',
                            alignment: CrossAxisAlignment.end,
                            isColor: false,
                          ),
                        ],
                      ),
                      Gap(AppLayout.getHeight(20)),
                      const AppLayoutBuilderWidget(
                        sections: 15,
                        isColor: false,
                        width: 5,
                      ),
                      Gap(AppLayout.getHeight(20)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'images/visa.png',
                                    scale: 11,
                                  ),
                                  Text(
                                    ' *** 2564',
                                    style: Styles.headLineStyle3,
                                  )
                                ],
                              ),
                              const Gap(5),
                              Text('Payment method',
                                  style: Styles.headLineStyle4),
                            ],
                          ),
                          const AppColumnLayout(
                            firstText: '\$400.00',
                            secondText: 'Price',
                            alignment: CrossAxisAlignment.end,
                            isColor: false,
                          ),
                        ],
                      ),
                      const SizedBox(height: 1),
                      Gap(AppLayout.getHeight(20)),
                      //Bar code
                      const SizedBox(height: 1),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomRight:
                                  Radius.circular(AppLayout.getHeight(21)),
                              bottomLeft:
                                  Radius.circular(AppLayout.getHeight(21)),
                            )),
                        margin: EdgeInsets.only(
                            left: AppLayout.getHeight(20),
                            right: AppLayout.getHeight(20)),
                        padding: EdgeInsets.only(
                            top: AppLayout.getHeight(20),
                            bottom: AppLayout.getHeight(20)),
                        child: Container(
                          // padding: EdgeInsets.symmetric(
                          //     horizontal: AppLayout.getHeight(5)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              AppLayout.getHeight(15),
                            ),
                            child: BarcodeWidget(
                              barcode: Barcode.code128(),
                              data: 'https://github.com/martinovovo',
                              drawText: false,
                              color: Styles.textColor,
                              width: double.infinity,
                              height: 70,
                            ),
                          ),
                        ),
                      ),
                      //Ticketview section
                    ],
                  ),
                ),
              ),
              Gap(AppLayout.getHeight(20)),
              Container(
                padding: EdgeInsets.only(left: AppLayout.getHeight(15)),
                child: TicketView(
                  ticket: ticketList[0],
                ),
              ),
            ],
          ),
          Positioned(
            left: AppLayout.getHeight(22),
            top: AppLayout.getHeight(295),
            child: Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Styles.textColor, width: 2),
              ),
              child: CircleAvatar(
                maxRadius: 4,
                backgroundColor: Styles.textColor,
              ),
            ),
          ),
           Positioned(
            right: AppLayout.getHeight(22),
            top: AppLayout.getHeight(295),
            child: Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Styles.textColor, width: 2),
              ),
              child: CircleAvatar(
                maxRadius: 4,
                backgroundColor: Styles.textColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
