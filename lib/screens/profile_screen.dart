import 'package:flutter/material.dart';

import '../widgets/profile_card.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';

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
              Container(
                height: deviceSize.height * 0.2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      TextButton.icon(
                          onPressed: () {
                            // Provider.of<Auth>(context, listen: false).logout();
                          },
                          icon: CircleAvatar(
                            child: const Icon(
                              Icons.keyboard_arrow_left,
                              size: 40,
                              color: Colors.white,
                            ),
                          ),
                          label: Text(
                            'Profile',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          )),
                      CircleAvatar(
                        child: const Icon(
                          Icons.edit,
                          size: 30,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 70),
                    child: Container(
                      height: deviceSize.height * 0.8 - 70,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(32),
                              topRight: Radius.circular(32))),
                      child: ProfileForm(),
                    ),
                  ),
                  CircleAvatar(
                    maxRadius: 70,
                    backgroundImage: NetworkImage(
                        'https://emirateswoman.com/wp-content/uploads/2015/02/1035_7.jpg'),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
