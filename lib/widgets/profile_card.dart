import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';

class ProfileForm extends StatefulWidget {
  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final _switchController = AdvancedSwitchController();

  Widget formField(String name, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name),
        SizedBox(
          height: 16,
        ),
        Container(
          // margin: EdgeInsets.symmetric(vertical: 24),
          decoration: BoxDecoration(
              color: Color.fromRGBO(235, 235, 235, 1),
              borderRadius: const BorderRadius.all(const Radius.circular(8))),
          child: TextFormField(
            textAlign: TextAlign.center,
            enabled: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: label,
              alignLabelWithHint: true,
              hintStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 24, right: 24, top: 96),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    formField('Name', 'David'),
                    SizedBox(
                      height: 16,
                    ),
                    formField('City', 'London'),
                  ],
                ),
              ),
              SizedBox(
                width: 32,
              ),
              Expanded(
                child: Column(
                  children: [
                    formField('Email', Provider.of<Auth>(context).email),
                    SizedBox(
                      height: 16,
                    ),
                    formField('Interest', 'Football')
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Notifications',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              AdvancedSwitch(
                  controller: _switchController,
                  activeColor: Theme.of(context).primaryColor,
                  inactiveColor: Theme.of(context).primaryColorLight,
                  borderRadius: BorderRadius.circular(5),
                  activeChild: Text('ON'),
                  inactiveChild: Text('OFF'),
                  width: 76,
                  thumb: Container(
                      decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Theme.of(context).primaryColorDark,
                  ))),
            ],
          )
        ],
      ),
    );
  }
}