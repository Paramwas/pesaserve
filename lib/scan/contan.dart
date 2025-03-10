import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pesaserve/home/darkmodestyles.dart';
import 'package:pesaserve/home/lightmodestyles.dart';
import 'package:pesaserve/landingpage/styless/colorsInlandingpage.dart';
import 'package:pesaserve/scan/class/scanclass.dart';

import 'package:flutter/material.dart';
import 'package:pesaserve/home/lightmodestyles.dart';
import 'package:pesaserve/landingpage/styless/colorsInlandingpage.dart';
import 'package:pesaserve/scan/class/scanclass.dart';

class Productcontain extends StatefulWidget {
  final Product njarea;
  final bool _plac;
  final Function(int) onQuantityChanged;

  const Productcontain(this.njarea, this._plac,
      {Key? key, required this.onQuantityChanged})
      : super(key: key);

  @override
  _ProductcontainState createState() => _ProductcontainState();
}

class _ProductcontainState extends State<Productcontain> {
  int count = 1;

  void increment() {
    setState(() {
      count++;
    });
    widget.onQuantityChanged(count);
  }

  void decrement() {
    setState(() {
      if (count > 0) count--;
    });
    widget.onQuantityChanged(count);
  }

  @override
  Widget build(BuildContext context) {
    double total = double.parse(widget.njarea.ammount) * count;
    return Center(
      child: Container(
        decoration: BoxDecoration(
            color: widget._plac
                ? Colors.white
                : const Color.fromARGB(10, 255, 255, 255),
            borderRadius: BorderRadius.circular(10)),
        width: MediaQuery.of(context).size.width * 0.90,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.njarea.name,
                    style:
                        widget._plac ? problemStatement : problemStatementlight,
                  ),
                  Text(
                    widget.njarea.quantity,
                    style: widget._plac
                        ? problemStatement.copyWith(
                            fontSize: 15, color: Colors.grey)
                        : problemStatementlight.copyWith(
                            fontSize: 15, color: Colors.grey),
                  ),
                  Text(
                    'KSH.${widget.njarea.ammount}',
                    style:
                        widget._plac ? problemStatement : problemStatementlight,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'kSH.${total}',
                    style: widget._plac
                        ? problemStatement.copyWith(fontSize: 14)
                        : problemStatementlight.copyWith(fontSize: 14),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: widget._plac
                    ? Colors.white
                    : const Color.fromARGB(19, 255, 255, 255),
                child: Column(
                  children: [
                    IconButton(
                      onPressed: increment,
                      icon: Icon(
                        size: 13,
                        Icons.add,
                        color: widget._plac
                            ? notificationiconlight
                            : notificationicon,
                      ),
                    ),
                    Text(
                      '$count',
                      style: widget._plac
                          ? problemStatement.copyWith(fontSize: 13)
                          : problemStatementlight.copyWith(fontSize: 13),
                    ),
                    IconButton(
                      onPressed: decrement,
                      icon: Icon(
                        size: 13,
                        Icons.remove,
                        color: widget._plac
                            ? notificationiconlight
                            : notificationicon,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
