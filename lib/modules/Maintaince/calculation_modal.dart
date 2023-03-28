class Calculation {
  final int? id;
  final String? cname;
  final String? cfloor;
  final String? cflat;
  final int? c_com_area_unit;
  final int? c_unit_area_unit;
  final int? amt_paid;
  final String? status;
  final String? time;

  Calculation({
    this.id,
    this.cname,
    this.cfloor,
    this.cflat,
    this.c_com_area_unit,
    this.c_unit_area_unit,
    this.amt_paid,
    this.status,
    this.time,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'cname': cname,
      'cfloor': cfloor,
      'cflat': cflat,
      'c_com_area_unit': c_com_area_unit,
      'c_unit_area_unit': c_unit_area_unit,
      'amt_paid': amt_paid,
      'status': status,
      'time': time,
    };
  }

  static Calculation fromMap(Map<String, dynamic> map) {
    return Calculation(
      id: map['id'],
      cname: map['cname'],
      cfloor: map['cfloor'],
      cflat: map['cflat'],
      c_com_area_unit: map['c_com_area_unit'],
      c_unit_area_unit: map['c_unit_area_unit'],
      amt_paid: map['amt_paid'],
      status: map['status'],
      time: map['time'],
    );
  }
}
