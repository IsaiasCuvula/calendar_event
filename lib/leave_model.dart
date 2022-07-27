class LeaveModel {
  int? status;
  String? message;
  List<LeaveData>? data;

  LeaveModel(this.status, this.message, this.data);

  LeaveModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(LeaveData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  static Map<String, dynamic> dummyData = {
    "status": 200,
    "message": "Data fetched",
    "data": [
      {
        "leave_date": "Jul 14, 2022",
        "holiday_type": "Fully off",
        "holiday_reason": "Festival",
        "start_from": "",
        "end_from": "",
        "calender_date": "2022-07-14"
      },
      {
        "leave_date": "Jun 08, 2022",
        "holiday_type": "partialy_off",
        "holiday_reason": "urgent work at home",
        "start_from": "10:00",
        "end_from": "01:00",
        "calender_date": "2022-06-18"
      },
      {
        "leave_date": "Jul 05, 2022",
        "holiday_type": "Fully off",
        "holiday_reason": "Lockdown",
        "start_from": "",
        "end_from": "",
        "calender_date": "2022-07-05"
      },
      {
        "leave_date": "Jul 22, 2022",
        "holiday_type": "Partial off",
        "holiday_reason": "Weekend",
        "start_from": "",
        "end_from": "",
        "calender_date": "2022-07-22"
      },
    ]
  };
}

class LeaveData {
  String? leaveDate;
  String? holidayType;
  String? holidayReason;
  String? startFrom;
  String? endFrom;
  String? calenderDate;

  LeaveData(
      {required this.leaveDate,
      required this.holidayType,
      required this.holidayReason,
      required this.startFrom,
      required this.endFrom,
      required this.calenderDate});

  LeaveData.fromJson(dynamic json) {
    leaveDate = json['leave_date'];
    holidayType = json['holiday_type'];
    holidayReason = json['holiday_reason'];
    startFrom = json['start_from'];
    endFrom = json['end_from'];
    calenderDate = json['calender_date'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['leave_date'] = leaveDate;
    map['holiday_type'] = holidayType;
    map['holiday_reason'] = holidayReason;
    map['start_from'] = startFrom;
    map['end_from'] = endFrom;
    map['calender_date'] = calenderDate;
    return map;
  }
}
