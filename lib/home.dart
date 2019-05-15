import 'package:flutter/material.dart';
import 'package:offwallet/credit_card_model.dart';
import 'package:offwallet/credit_card.dart';
import 'package:offwallet/db_provider.dart';
import 'package:offwallet/transaction.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

Widget _buildCards(AsyncSnapshot<List<CreditCardModel>> snapshot) {
  if(snapshot.hasData) {
    return PageView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (BuildContext context, int index) {
        return CreditCard(snapshot.data[index]);
      },
    );
  }
  return Text('adsasdf');
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2B2D5B),
        title: Text('Salary'),
        leading: Icon(Icons.menu),
        actions: <Widget>[
          FlatButton(
            child: Text('ADD CARD', style: TextStyle(color: Colors.white),),
            onPressed: () {
              Navigator.pushNamed(context, '/add');
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/transaction');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: FutureBuilder<List<CreditCardModel>>(
        future: DBProvider.db.getAllCards(),
        builder: (BuildContext context,
            AsyncSnapshot<List<CreditCardModel>> snapshot) {
          return Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(15.0),
                  color: Color(0xFF2B2D5B),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: _buildCards(snapshot),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            'Last Transactions',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView(
                          children: <Widget>[
                            Transaction(),
                            Transaction(),
                            Transaction(),
                            Transaction(),
                            Transaction(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
