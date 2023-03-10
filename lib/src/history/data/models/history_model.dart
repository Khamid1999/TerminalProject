class History {
  List<HistoryModel>? history;

  History({this.history});

  History.fromJson(Map<String, dynamic> json) {
    if (json['history'] != null) {
      history = <HistoryModel>[];
      json['history'].forEach(
        (v) {
          history!.add(
            new HistoryModel.fromJson(v),
          );
        },
      );
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.history != null) {
      data['history'] = this.history!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HistoryModel {
  int? id;
  String? userId;
  String? paymentId;
  String? dateTranz;
  String? valueTranz;
  String? dateTime;
  String? paymentMonth;

  HistoryModel({
    this.id,
    this.userId,
    this.paymentId,
    this.dateTranz,
    this.valueTranz,
    this.dateTime,
    this.paymentMonth,
  });

  HistoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    paymentId = json['payment_id'];
    dateTranz = json['date_tranz'];
    valueTranz = json['value_tranz'];
    dateTime = json['date_time'];
    paymentMonth = json['month'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['payment_id'] = this.paymentId;
    data['date_tranz'] = this.dateTranz;
    data['value_tranz'] = this.valueTranz;
    data['date_time'] = this.dateTime;
    data['month'] = this.paymentMonth;
    return data;
  }
}
