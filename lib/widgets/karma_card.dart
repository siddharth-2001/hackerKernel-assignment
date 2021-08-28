import 'package:flutter/material.dart';

class KarmaCard extends StatelessWidget {
  Widget thinButton(String name, color) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(name),
      style: ElevatedButton.styleFrom(
          primary: color,
          fixedSize: const Size(128, 16),
          shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(const Radius.circular(32)))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
      height: 300,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(const Radius.circular(16)),
                child: Image.network(
                  'http://cdn.home-designing.com/wp-content/uploads/2021/03/meditating-buddha-statue-for-garden-or-home-interior-6-pound-fiberstone-weatherproof-outdoor-sculpture-600x600.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text('9,523',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700)),
                          SizedBox(
                            height: 6,
                          ),
                          Text('JOINED',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500))
                        ],
                      )
                    ],
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'CATEGORY',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text('SPIRITUAL EMPOWERMENT',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 20)),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.timer,
                              color: Colors.white,
                              size: 32,
                            ),
                            Text('05:00 AM | 07 DEC 2019',
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700))
                          ],
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('JOINED'),
                              style: ElevatedButton.styleFrom(
                                  primary: Theme.of(context).accentColor,
                                  fixedSize: const Size(128, 16),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: const BorderRadius.all(
                                          const Radius.circular(32)))),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                'DO KARMA',
                                style: TextStyle(color: Colors.black),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  fixedSize: const Size(128, 16),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(32)))),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
