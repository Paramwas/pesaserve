import 'package:flutter/material.dart';
import 'package:pesaserve/home/lightmodestyles.dart';
import 'package:pesaserve/landingpage/styless/colorsInlandingpage.dart';

Widget paymenttottal(double total, context, bool nano) {
  return ConstrainedBox(
    constraints: BoxConstraints(
      maxHeight: MediaQuery.of(context).size.height * 0.8, // Limit height
    ),
    child: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min, // Adjust height dynamically
        children: [
          Text('Order Summary',
              style: nano
                  ? problemStatement.copyWith(fontSize: 25)
                  : problemStatementlight.copyWith(fontSize: 25)),
          SizedBox(height: 10),
          Text('Total: KSH.${total.toStringAsFixed(2)}',
              style: nano
                  ? problemStatement.copyWith(
                      fontWeight: FontWeight.w700,
                      decorationThickness: 4,
                      fontSize: 20)
                  : problemStatementlight.copyWith(
                      fontWeight: FontWeight.w700,
                      decorationThickness: 4,
                      fontSize: 20)),
          SizedBox(height: 20),
        ],
      ),
    ),
  );
}
