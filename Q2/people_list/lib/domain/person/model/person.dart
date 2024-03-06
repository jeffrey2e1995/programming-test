class Person {
  final String id;
  final Name? name;
  final String? email;
  final String? picture;
  final Location? location;

  static const String idKey = '_id';
  static const String nameKey = 'name';
  static const String emailKey = 'email';
  static const String pictureKey = 'picture';
  static const String locationKey = 'location';

  Person({
    required this.id,
    required this.name,
    required this.email,
    required this.picture,
    required this.location,
  });
  factory Person.fromJson(Map<String, dynamic> json) => Person(
        id: json[idKey] as String,
        name: json[nameKey] == null || json[nameKey] is! Map<String, dynamic>
            ? null
            : Name.fromJson(json[nameKey]),
        email: json[emailKey] as String?,
        picture: json[pictureKey] as String,
        location: json[locationKey] == null ||
                json[locationKey] is! Map<String, dynamic>
            ? null
            : Location.fromJson(json[locationKey]),
      );

  Map<String, dynamic> toMap() {
    return {
      Person.idKey: id,
      Name.lastKey: name?.last,
      Name.firstKey: name?.first,
      Person.emailKey: email,
      Person.pictureKey: picture,
      Location.latitudeKey: location?.latitude,
      Location.longitudeKey: location?.longitude,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Person && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

class Name {
  final String? last;
  final String? first;

  static const String lastKey = 'last';
  static const String firstKey = 'first';

  Name({
    required this.last,
    required this.first,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        last: json[lastKey] as String?,
        first: json[firstKey] as String?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        lastKey: last,
        firstKey: first,
      };

  @override
  String toString() {
    return first == null ? '---' : '$first${last != null ? ', $last' : ','}';
  }
}

class Location {
  final double? latitude;
  final double? longitude;

  static const String latitudeKey = 'latitude';
  static const String longitudeKey = 'longitude';

  Location({
    required this.latitude,
    required this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        latitude: json[latitudeKey] as double?,
        longitude: json[longitudeKey] as double?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        latitudeKey: latitude,
        longitudeKey: longitude,
      };

  @override
  String toString() {
    return latitude == null ? '---' : '$latitude, ${longitude ?? '---'}';
  }
}
