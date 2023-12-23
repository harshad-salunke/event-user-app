
import 'UserModle.dart';

class EventsModel {
  String? stared;
  String? end;
  String? event_name;
  String? date;
  String? event_discription;
  String? id;
  String? timestamp;
  String? event_location;
  String? category;
  List<UserModel> users=[];

  EventsModel({
    required  this.stared,
    required    this.end,
    required   this.event_name,
    required   this.date,
    required   this.event_discription,
    required    this.id,
    required    this.timestamp,
    required    this.event_location,
    required   this.users,
    required  this.category}
      );
  EventsModel.fromJson(Map<String, dynamic> json) {
    stared = json['stared'];
    end = json['end'];
    event_name = json['event_name'];
    date = json['date'];
    event_discription = json['event_discription'];
    id = json['id'];
    timestamp = json['timestamp'];
    event_location = json['event_location'];
    category=json['category'];

    users = [];
    if (json['users'] != null) {
      (json['users'] as List<dynamic>).forEach((userData) {
        users.add(UserModel.fromJson(Map<String, dynamic>.from(userData)));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'stared': stared,
      'end': end,
      'date': date,
      'event_name': event_name,
      'event_discription': event_discription,
      'id': id,
      'timestamp': timestamp,
      'event_location': event_location,
      'users': users.map((user) => user.toJson()).toList(),
      'category': category,

    };
    return data;
  }
}
