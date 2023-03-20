class Resident {
  final int? id;
  final String fname;
  final String lname;
  final String email;
  final int contact;
  final int wcontact;
  final String home;
  final int adhaar;
  final String floor;
  final String flat;
  final int no_people;
  // final String radio;

  Resident({
    this.id,
    required this.fname,
    required this.lname,
    required this.email,
    required this.contact,
    required this.wcontact,
    required this.home,
    required this.adhaar,
    required this.floor,
    required this.flat,
    required this.no_people,
    // required this.radio,
  });

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'fname': fname,
      'lname': lname,
      'email': email,
      'contact': contact,
      'wcontact': wcontact,
      'home': home,
      'adhaar': adhaar,
      'floor': floor,
      'flat': flat,
      'no_people': no_people,
      // 'radio': radio,
    };
  }

  static Resident fromMap(Map<String, dynamic> map) {
    return Resident(
        fname: map['fname'],
        lname: map['lname'],
        email: map['email'],
        contact: map['contact'],
        wcontact: map['wcontact'],
        home: map['home'],
        adhaar: map['adhaar'],
        floor: map['floor'],
        flat: map['flat'],
        no_people: map['no_people']);
        // radio: map['radio']);
  }
}
