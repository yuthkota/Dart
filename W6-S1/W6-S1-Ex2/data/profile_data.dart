
import 'package:flutter/material.dart';
import 'package:flutter_1/EXERCISE-1/EXERCISE-2/model/profile_tile_model.dart';

ProfileData profile = ProfileData(
  name: "Ronan",
  position: "Flutter Developer",
  avatarUrl: 'assets/w5-s2/ang.jpg',
  tiles: [
    TileData(icon: Icons.phone, title: "Phone Number", value: "+123 456 7890"),
    TileData(icon: Icons.location_on, title: "Address", value: "123 Cambodia"),
    TileData(icon: Icons.email, title: "Mail", value: "ronan.ogogr@cadt.edu"),
    TileData(icon: Icons.work, title: "Company", value: "Flutter Inc."),
  ],
);
