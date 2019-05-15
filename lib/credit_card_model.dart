import 'dart:convert';

CreditCardModel jsonToCard(String str) {
    final jsonData = json.decode(str);
    return CreditCardModel.fromJson(jsonData);
}

String cardToJson(CreditCardModel data) {
    final dyn = data.toJson();
    return json.encode(dyn);
}

class CreditCardModel {
    final int id;
    final String cardName;
    final String startCode;
    final String endCode;
    final String expire;
    final String cardColor;
    final String textColor;

    CreditCardModel({
      this.id,
      this.cardName,
      this.startCode,
      this.endCode,
      this.expire,
      this.cardColor,
      this.textColor,
    });

    factory CreditCardModel.fromJson(Map<String, dynamic> json) => new CreditCardModel(
      id: json["id"],
      cardName: json["card_name"],
      startCode: json["start_code"],
      endCode: json["end_code"],
      expire: json["expire"],
      cardColor: json["card_color"],
      textColor: json["text_color"],
    );

    Map<String, dynamic> toJson() => {
      "id": id,
      "card_name": cardName,
      "start_code": startCode,
      "end_code": endCode,
      "expire": expire,
      "card_color": cardColor,
      "text_color": textColor,
    };
}