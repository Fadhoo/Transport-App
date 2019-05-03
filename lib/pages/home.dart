import 'package:flutter/material.dart';
import 'package:transport_app/models/company.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trans App"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.view_list,
              color: Colors.white70,
            ),
            onPressed: null,
          ),
        ],
      ),
      body: _MainContent(),
    );
  }
}

class _MainContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CompanyListState();
  }
}

class _CompanyListState extends State<_MainContent> {
  List<Company> data = dummyData;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.70,
      physics: BouncingScrollPhysics(),
      crossAxisCount: 2,
      children: List.generate(data.length, (index) {
        return _buildGrid(data[index]);
      }),
    );
  }

  Widget _buildGrid(Company data) {
    return Card(
        child: InkWell(
          onTap: () {
            _showSnackBar();
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 7,
                child: Container(
                  child: Image.network(
                    data.imageUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  child: Center(
                    child: Text(
                      data.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }

  _showSnackBar() {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('Tap'),
    ));
  }
}
