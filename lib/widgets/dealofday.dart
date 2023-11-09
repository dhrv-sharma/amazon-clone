import 'package:flutter/material.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({super.key});

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 10, top: 15),
          child: const Text(
            'Deal of the day',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
          )),
      Image.asset(
        'images/earphone.jpg',
        height: 235,
        fit: BoxFit.fitHeight,
      ),
      Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.only(left: 15, top: 5),
        child: Text(
          '\$500',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
        ),
      ),
      Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.only(left: 15, top: 5, right: 40),
        child: const Text(
          'HP ZBook Firefly 40.6 cm (16) G9 Mobile Workstation PC',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 5,
            ),
            Image.asset(
              'images/earphone.jpg',
              fit: BoxFit.fitWidth,
              width: 100,
              height: 100,
            ),
            const SizedBox(
              width: 5,
            ),
            Image.asset(
              'images/earphone.jpg',
              fit: BoxFit.fitWidth,
              width: 100,
              height: 100,
            ),
            const SizedBox(
              width: 5,
            ),
            Image.asset(
              'images/earphone.jpg',
              fit: BoxFit.fitWidth,
              width: 100,
              height: 100,
            ),
            const SizedBox(
              width: 5,
            ),
            Image.asset(
              'images/earphone.jpg',
              fit: BoxFit.fitWidth,
              width: 100,
              height: 100,
            ),
          ],
        ),
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15)
                .copyWith(left: 15, bottom: 20),
            alignment: Alignment.topLeft,
            child: Text(
              'See All details',
              style: TextStyle(
                  color: Colors.cyan[800],
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            width: 9,
            child: Icon(
              Icons.arrow_right_alt_sharp,
              color: Colors.cyan[800],
              size: 25,
            ),
          )
        ],
      )
    ]);
  }
}
