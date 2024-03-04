class Person {
  final String id;
  final Name? name;
  final String? email;
  final String? picture;
  final Location? location;

  Person({
    required this.id,
    required this.name,
    required this.email,
    required this.picture,
    required this.location,
  });
  factory Person.fromJson(Map<String, dynamic> json) => Person(
        id: json['_id'] as String,
        name: json['name'] == null || json['name'] is! Map<String, dynamic>
            ? null
            : Name.fromJson(json['name']),
        email: json['email'] as String?,
        picture: json['picture'] as String,
        location: json['location'] == null ||
                json['location'] is! Map<String, dynamic>
            ? null
            : Location.fromJson(json['location']),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name == null ? null : name!.toJson(),
        'email': email,
        'picture': picture,
        'location': location == null ? null : location!.toJson(),
      };
}

class Name {
  final String? last;
  final String? first;

  Name({
    required this.last,
    required this.first,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        last: json['last'] as String?,
        first: json['first'] as String?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'last': last,
        'first': first,
      };
}

class Location {
  final double? latitude;
  final double? longitude;

  Location({
    required this.latitude,
    required this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        latitude: json['latitude'] as double?,
        longitude: json['longitude'] as double?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'latitude': latitude,
        'longitude': longitude,
      };
}
