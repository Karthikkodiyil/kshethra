class UserBookingModel {
  String name = "";
  String? star = "";
  String? date = "";
  String? phno;
  List<Map<String,dynamic>> vazhiPad = [];

  UserBookingModel({required this.name, this.star,required this.vazhiPad,this.phno,this.date});
}

