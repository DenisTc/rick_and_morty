// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Character {
  int id;
  String name;
  String status;
  String species;
  String gender;
  String image;
  bool isFavorite;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.image,
    this.isFavorite = false,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'status': status,
      'species': species,
      'gender': gender,
      'image': image,
      'isFavorite': isFavorite,
    };
  }

  factory Character.fromMap(
    Map<String, dynamic> map, {
    bool isFavorite = false,
  }) {
    return Character(
      id: map['id'] as int,
      name: map['name'] as String,
      status: map['status'] as String,
      species: map['species'] as String,
      gender: map['gender'] as String,
      image: map['image'] as String,
      isFavorite: isFavorite,
    );
  }

  String toJson() => json.encode(toMap());

  factory Character.fromJson(Map<String, dynamic> map) {
    return Character(
      id: map['id'] as int,
      name: map['name'] as String,
      status: map['status'] as String,
      species: map['species'] as String,
      gender: map['gender'] as String,
      image: map['image'] as String,
      isFavorite:
          map.containsKey('isFavorite') ? map['isFavorite'] as bool : false,
    );
  }

  Character copyWith({
    int? id,
    String? name,
    String? status,
    String? species,
    String? gender,
    String? image,
    bool? isFavorite,
  }) {
    return Character(
      id: id ?? this.id,
      name: name ?? this.name,
      status: status ?? this.status,
      species: species ?? this.species,
      gender: gender ?? this.gender,
      image: image ?? this.image,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
