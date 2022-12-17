import 'package:example_project6/screens/hotel_screen.dart';
import 'package:example_project6/screens/ticket_view.dart';
import 'package:example_project6/utils/app_info_list.dart';
import 'package:example_project6/utils/app_styles.dart';
import 'package:example_project6/widgets/double_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 40),

                //Good morning, book tickets section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good morning',
                          style: Styles.headLineStyle3,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Book Tickets',
                          style: Styles.headLineStyle1,
                        ),
                      ],
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          //fit: BoxFit.cover,
                          image: AssetImage('images/img_1.png'),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 25),
                //Search section
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFF4F6FD),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.search,
                        color: Colors.blueGrey,
                      ),
                      Text(
                        'Search',
                        style: Styles.headLineStyle4,
                      ),
                    ],
                  ),
                ),

                // const SizedBox(height: 40),
                const Gap(50),
                //Upcoming flights section
                const AppDoubleTextWidget(
                    bigText: 'Upcoming Flights', smallText: 'View all')
              ],
            ),
          ),
          const SizedBox(height: 15),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: ticketList
                    .map((singleTicket) => TicketView(
                          ticket: singleTicket,
                        ))
                    .toList(),
              )),
          const Gap(15),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: AppDoubleTextWidget(bigText: 'Hotel', smallText: 'View all'),
          ),
          const SizedBox(height: 15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children:
                  hotelList.map((hotel) => HotelScreen(hotel: hotel)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
