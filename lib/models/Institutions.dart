class Institution {
  final String image, details, name;
  final int id;

  Institution({this.id, this.image, this.details, this.name});
}

// Demo List of my works
List<Institution> institutions = [
  Institution(
    id: 1,
    name: "BITS Pilani - Pilani Campus",
    details: "B.E. Mechanical\n[2020-2024]",
    image: "assets/images/bitspCard.jpg",
  ),
  Institution(
    id: 2,
    name: "Gyan Ganga International Academy, Bhopal",
    details: "Senior High School - CBSE Board\n[2018-2020]",
    image: "assets/images/ggia.jpg",
  ),
  Institution(
    id: 3,
    name: "Mount Carmel School, Bhopal",
    details: "High School Diploma - ICSE Board",
    image: "assets/images/MCS.jpg",
  ),
];
