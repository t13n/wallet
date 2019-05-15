import 'package:flutter/material.dart';
import 'package:offwallet/credit_card_model.dart';

class CreditCard extends StatelessWidget {
  final CreditCardModel card;

  CreditCard(this.card);

  String _decideImage() {
    int cardType = int.parse(card.startCode.substring(0, 2));
    String image = 'assets/visa.png';
    if (cardType >= 34 && cardType <= 37) {
      image = 'assets/american.png';
    }
    if (cardType >= 51 && cardType <= 55) {
      image = 'assets/master.png';
    }
    return image;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          '\$12,123,21',
          style: TextStyle(
            color: Colors.amber,
            fontSize: 30.0,
          ),
        ),
        Container(
          margin: EdgeInsets.all(20.0),
          padding: EdgeInsets.all(10.0),
          width: 300.0,
          height: 170.0,
          decoration: BoxDecoration(
            color: Color(int.parse(card.cardColor)),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(card.cardName, style: TextStyle(fontSize: 20.0, color: Color(int.parse(card.textColor))),),
                  Image.asset(
                    _decideImage(),
                    height: 40.0,
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      'assets/chip.png',
                      height: 30.0,
                    )
                  ],
                ),
              ),
              Text(
                '${card.startCode} **** **** ${card.endCode}',
                style: TextStyle(fontSize: 20.0, color: Color(int.parse(card.textColor))),
              ),
              Text(card.expire, style: TextStyle(color: Color(int.parse(card.textColor))),),
            ],
          ),
        ),
      ],
    );
  }
}
