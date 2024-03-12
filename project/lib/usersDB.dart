// This includes users who signed in and their data
import 'package:project/models/Users.dart';

List<Users> usersDB = [
  Users(name: "admin", email: "admin@gmail.com", password: "12345", chart: []),
  Users(name: "a", email: "a", password: "a", chart: [{
    "name": "TMA-2 HD Wireless 1",
    "price": 350,
    "count": 2,
    "img": "Auto-added frame2.png"
  },
  {
    "name": "LEGION",
    "price": 1000,
    "count": 1,
    "img": "p5.png"
  }
  ]),
];
