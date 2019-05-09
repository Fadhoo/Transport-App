import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _HomeContent();
  }
}

class _HomeContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeContentState();
  }
}

class _HomeContentState extends State<_HomeContent> {
  @override
  Widget build(BuildContext context) {
    return _content(context);
  }

  Widget _content(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: viewportConstraints.maxHeight),
            child: Container(
              height: double.infinity,
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 25, bottom: 25),
                      child: Center(
                          child: Container(
                        child: Hero(
                          tag: 'searchCardHero',
                          child: Material(
                            child: Card(
                                shape: StadiumBorder(),
                                elevation: 8,
                                margin: EdgeInsets.all(8),
                                child: InkWell(
                                  onTap: () {
                                    openSearchPage();
                                  },
                                  customBorder: StadiumBorder(),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 2.0),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 8,
                                          child: TextFormField(
                                            style: TextStyle(fontSize: 20.0),
                                            textInputAction:
                                                TextInputAction.search,
                                            enabled: false,
                                            decoration: InputDecoration(
                                                hintText: "Search",
                                                border: InputBorder.none),
                                          ),
                                        ),
                                        CircleAvatar(
                                          backgroundColor: Colors.grey,
                                          child: InkWell(
                                            customBorder: CircleBorder(),
                                            onTap: () {
                                              showSnackBar(s: 'Open Profile');
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )),
                          ),
                        ),
                      )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 25, bottom: 25),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        elevation: 8,
                        margin: EdgeInsets.all(8),
                        color: Colors.yellowAccent,
                        child: cardContent(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget cardContent() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[destinationRow(), detailsRow(), busDetails()],
      ),
    );
  }

  Widget busDetails() {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Transport",
            style: TextStyle(fontSize: 14),
          ),
          Text(
            "MNT",
            style: TextStyle(fontSize: 22),
          ),
        ],
      ),
    );
  }

  Widget detailsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(
          children: <Widget>[
            Text(
              "Depart",
              style: TextStyle(fontSize: 12),
            ),
            Text("17:00",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
          ],
        ),
        Column(
          children: <Widget>[
            Text(
              "Arrive",
              style: TextStyle(fontSize: 12),
            ),
            Text("02:00",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
          ],
        ),
        Column(
          children: <Widget>[
            Text(
              "Terminal",
              style: TextStyle(fontSize: 12),
            ),
            Text("3",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
          ],
        )
      ],
    );
  }

  Widget destinationRow() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            children: <Widget>[
              Text(
                "Lagos",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "LAG",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            child: Icon(
              Icons.arrow_forward,
              size: 40,
            ),
          ),
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              Text(
                "Kaduna",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "KAD",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              )
            ],
          ),
        )
      ],
    );
  }

  void openSearchPage() {
    Navigator.of(context).pushNamed('/search');
  }

  void showSnackBar({String s = 'Tap'}) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(s),
    ));
  }
}
