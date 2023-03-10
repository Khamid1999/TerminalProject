class Statistics {
  List<StatisticsModel>? statistics;

  Statistics({this.statistics});

  Statistics.fromJson(Map<String, dynamic> json) {
    if (json['statistics'] != null) {
      statistics = <StatisticsModel>[];
      json['statistics'].forEach((v) {
        statistics!.add(new StatisticsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.statistics != null) {
      data['statistics'] = this.statistics!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StatisticsModel {
  int? id;
  String? userId;
  String? totalReceived;
  String? numberOfTransactions;
  String? dateTime;

  StatisticsModel(
      {this.id,
        this.userId,
        this.totalReceived,
        this.numberOfTransactions,
        this.dateTime});

  StatisticsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    totalReceived = json['total_received'];
    numberOfTransactions = json['number_of_transactions'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['total_received'] = this.totalReceived;
    data['number_of_transactions'] = this.numberOfTransactions;
    data['date_time'] = this.dateTime;
    return data;
  }
}
