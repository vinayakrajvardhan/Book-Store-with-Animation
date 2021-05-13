import 'dart:math';

import 'package:book_app/book.dart';
import 'package:flutter/material.dart';

class BookAppConcept extends StatefulWidget {
  @override
  _BookAppConceptState createState() => _BookAppConceptState();
}

class _BookAppConceptState extends State<BookAppConcept> {
  final _controller = PageController();
  final _notifyScroll = ValueNotifier(0.0);

  void _listener() {
    _notifyScroll.value = _controller.page;
  }

  @override
  void initState() {
    _controller.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_listener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bookHeight = size.height * 0.48;
    final bookWidth = size.width * 0.56;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/Bg.png",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 120,
            child: AppBar(
              centerTitle: false,
              leadingWidth: 0,
              title: Text(
                "Books Cart",
                style: TextStyle(color: Colors.black),
              ),
              elevation: 0,
              backgroundColor: Colors.white,
            ),
          ),
          ValueListenableBuilder<double>(
              valueListenable: _notifyScroll,
              builder: (context, value, _) {
                return PageView.builder(
                    controller: _controller,
                    itemCount: books.length,
                    itemBuilder: (context, index) {
                      final book = books[index];
                      final percentage = index - value;
                      final rotation = percentage.clamp(0.0, 1.0);
                      final fixRotation = pow(rotation, 0.35);
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                                child: Stack(
                              children: [
                                Container(
                                  height: bookHeight,
                                  width: bookWidth,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 20,
                                          offset: Offset(5.0, 5.0),
                                          spreadRadius: 10.0,
                                        )
                                      ]),
                                ),
                                Transform(
                                  alignment: Alignment.centerLeft,
                                  transform: Matrix4.identity()
                                    ..setEntry(3, 2, 0.002)
                                    ..rotateY(1.5 * fixRotation)
                                    ..translate(-rotation * size.width * 0.8)
                                    ..scale(1 + rotation),
                                  child: Image.asset(
                                    book.image,
                                    fit: BoxFit.cover,
                                    height: bookHeight,
                                    width: bookWidth,
                                  ),
                                ),
                              ],
                            )),
                            SizedBox(
                              height: 90,
                            ),
                            Opacity(
                              opacity: 1 - rotation,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    book.tittle,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 30),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    'By ${book.author}',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      );
                    });
              }),
        ],
      ),
    );
  }
}
