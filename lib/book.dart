import 'package:flutter/cupertino.dart';

class Book {
  final String tittle;
  final String author;
  final String image;

  Book({
    @required this.author,
    @required this.image,
    @required this.tittle,
  });
}

final bookAppsBackGround = "assets/BG.png";

final books = [
  Book(
    tittle: "TinTin",
    author: "Penguin ",
    image: "assets/tin1.jpg",
  ),
  Book(
      tittle: "Wink Poppy MidNight",
      author: "April ",
      image: "assets/book1.jpg"),
  Book(
      tittle: "Walking with Miss Millie",
      author: "Tamra Bundy ",
      image: "assets/book2.jpg"),
  Book(
    tittle: "Trio",
    author: "Sarah ",
    image: "assets/book3.jpg",
  ),
  Book(
      tittle: "The Jungle Book",
      author: "Rudyard Kipling ",
      image: "assets/book4.jpg"),
  Book(
      tittle: "The Makers of Swans",
      author: "Paraig O Donnell ",
      image: "assets/book5.jpg"),
  Book(
      tittle: "Super Commando Dhruv",
      author: "Raj Comics ",
      image: "assets/d1.jpg"),
  Book(
      tittle: "The Commando on Mission",
      author: "Raj Comics ",
      image: "assets/d2.jpg"),
  Book(
      tittle: "The Nagraj and Dhruv",
      author: "Raj Comics ",
      image: "assets/n1.jpg"),
];
