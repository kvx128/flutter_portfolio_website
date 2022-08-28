class RecentWork {
  final String image, category, title;
  final int id;

  RecentWork({this.id, this.image, this.category, this.title});
}

// Demo List of my works
List<RecentWork> recentWorks = [
  RecentWork(
    id: 1,
    title: "Application to do something awesome",
    category: "Mobile App",
    image: "assets/images/work_1.png",
  ),
  RecentWork(
    id: 2,
    title: "Website that shows some cool stuff",
    category: "Website",
    image: "assets/images/work_2.png",
  ),
  RecentWork(
    id: 3,
    title: "Data transfer based on Etherium Blockchain",
    category: "Blockchain",
    image: "assets/images/work_3.png",
  ),
  RecentWork(
    id: 4,
    title: "Machine Learning model to predict some data",
    category: "ML model",
    image: "assets/images/work_4.png",
  ),
];
