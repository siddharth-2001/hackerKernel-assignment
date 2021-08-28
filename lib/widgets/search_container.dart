import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/auth.dart';

class SearchBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      height: deviceSize.height * 0.25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              TextButton.icon(
                  onPressed: () {
                    Provider.of<Auth>(context, listen: false)
                        .logout()
                        .then((value) {
                      Navigator.of(context).pushReplacementNamed('/auth');
                    });
                  },
                  icon: CircleAvatar(
                    child: const Icon(
                      Icons.keyboard_arrow_left,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  label: Text(
                    'Karma Drives',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  )),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/profile');
                },
                child: Text(
                  'MY DRIVES',
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(40)))),
              )
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            padding: const EdgeInsets.only(right: 8, left: 32),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    const BorderRadius.all(const Radius.circular(40))),
            child: TextFormField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search here...',
                  suffixIconConstraints: BoxConstraints.tight(Size(32, 32)),
                  suffixIcon: CircleAvatar(
                    child: const Icon(
                      Icons.search_rounded,
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.black,
                    maxRadius: 1,
                  )),
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
