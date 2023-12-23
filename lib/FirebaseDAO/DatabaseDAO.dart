
import 'package:event_booking_application/Models/EventModle.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';

import '../Models/UserModle.dart';


class DatabaseDAO {
  DatabaseReference dbRef = FirebaseDatabase.instance.reference();
FirebaseAuth firebaseAuth=FirebaseAuth.instance;


  void readAllEvents(Function(List<EventsModel> list) callback) {
    String path = 'Events/';
    List<EventsModel> attendancelist = [];
    dbRef.child(path).get().then((event) {
    DataSnapshot snapshot = event;
        if (snapshot.value != null) {
      Map<dynamic, dynamic> values = event.value as Map;
      if (values != null) {
        values.forEach((key, value) {
          List<UserModel> users = [];
          if (value['users'] != null) {
            (value['users'] as List<dynamic>).forEach((userData) {
              users.add(UserModel.fromJson(Map<String, dynamic>.from(userData)));
            });
          }

          EventsModel attendance =EventsModel(
              stared: value['stared'],
              end: value['end'],
              event_name: value['event_name'],
              date: value['date'],
              event_discription: value['event_discription'],
              id: value['id'],
              timestamp: value['timestamp'],
              event_location: value['event_location'],
              users: users,
              category: value['category']);

          attendancelist.add(attendance);
        });
      }
    }
    callback(attendancelist);
    });

    // dbRef.child(path).onValue.listen((event) {
    //   DataSnapshot snapshot = event.snapshot;
    //   if (snapshot.value != null) {
    //     Map<dynamic, dynamic> values = event.snapshot.value as Map;
    //     if (values != null) {
    //       values.forEach((key, value) {
    //         List<UserModel> users = [];
    //         if (value['users'] != null) {
    //           (value['users'] as List<dynamic>).forEach((userData) {
    //             users.add(UserModel.fromJson(Map<String, dynamic>.from(userData)));
    //           });
    //         }
    //
    //         EventsModel attendance =EventsModel(
    //             stared: value['stared'],
    //             end: value['end'],
    //             event_name: value['event_name'],
    //             date: value['date'],
    //             event_discription: value['event_discription'],
    //             id: value['id'],
    //             timestamp: value['timestamp'],
    //             event_location: value['event_location'],
    //             users: users,
    //             category: value['category']);
    //
    //         attendancelist.add(attendance);
    //       });
    //     }
    //   }
    //   callback(attendancelist);
    // });
  }

  void userRegisterAllEvents(Function(List<EventsModel> list) callback,UserModel userModel) {
    String path = 'Register/${userModel.uid}';
    List<EventsModel> attendancelist = [];

    dbRef.child(path).onValue.listen((event) {
      DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null) {
        Map<dynamic, dynamic> values = event.snapshot.value as Map;
        if (values != null) {
          values.forEach((key, value) {
            List<UserModel> users = [];
            if (value['users'] != null) {
              (value['users'] as List<dynamic>).forEach((userData) {
                users.add(UserModel.fromJson(Map<String, dynamic>.from(userData)));
              });
            }
            EventsModel attendance =EventsModel(
                stared: value['stared'],
                end: value['end'],
                event_name: value['event_name'],
                date: value['date'],
                event_discription: value['event_discription'],
                id: value['id'],
                timestamp: value['timestamp'],
                event_location: value['event_location'],
                users: users,
                category: value['category']);

            attendancelist.add(attendance);
          });
        }
      }
      callback(attendancelist);
    });

  }

  void globalRegisterUserForEvent(EventsModel eventsModel,Function(bool isdone) callback){
    Map<String, dynamic> data = eventsModel.toJson();

    String path='Events/${eventsModel.id}';
    dbRef.child(path).set(data).then((value) {
      callback(true);
    }).catchError((error) {
      callback(false);
      print('Failed to push data to the database: $error');
    });
  }

  void registerUserForEvent(EventsModel eventsModel,UserModel usermode,Function(bool isdone) callback){
    Map<String, dynamic> data = eventsModel.toJson();
    print("User data is ${usermode.uid}");
    String path='Register/${usermode.uid}/${eventsModel.id}';
    dbRef.child(path).set(data).then((value) {
      callback(true);
    }).catchError((error) {
      callback(false);
      print('Failed to push data to the database: $error');
    });
  }

  void getUserData(Function(bool,UserModel) isdone)  {
      User? user=firebaseAuth.currentUser;
      UserModel? userModel;
      // lYsnZ929HfhHsipS0YNWGJn2dLN2
      dbRef.child('Users').child(user!.uid).onValue.listen((event) {
        if (event.snapshot.value != null) {
          Map<dynamic, dynamic>? userData = event.snapshot.value as Map<dynamic, dynamic>?;
          UserModel userModel= UserModel.fromJson(userData);
          print(userModel.name);
          print(userModel.email);
          isdone(true,userModel);
        }else{

        }
      });


  }

  void saveUserToFirebase(UserModel userModel,Function(bool isdone) callback){
    Map<String, dynamic> data = userModel.toJson();
    String path='Users/${userModel.uid}';
    dbRef.child(path).set(data).then((value) {
      callback(true);
    }).catchError((error) {
      callback(false);
      print('Failed to push data to the database: $error');
    });
  }

}
