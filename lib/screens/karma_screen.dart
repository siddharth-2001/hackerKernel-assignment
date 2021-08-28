import 'package:flutter/material.dart';

import '../widgets/search_container.dart';
import '../widgets/karma_card.dart';

class KarmaDriveScreen extends StatelessWidget {
  static const routeName = '/karmaDrives';

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        //appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SearchBox(),
              Container(
                height: deviceSize.height * 0.75,
                padding: const EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                        topLeft: const Radius.circular(32),
                        topRight: const Radius.circular(32))),
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  //since the drives are static in this i'll use list view childre instead of list view builder
                  children: <Widget>[
                    for (var a = 0; a <= 5; a++) KarmaCard(),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
