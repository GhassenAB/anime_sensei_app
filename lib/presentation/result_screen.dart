import 'package:anime_sensei_app/constants.dart';
import 'package:anime_sensei_app/models/Anime.dart';
import 'package:anime_sensei_app/operations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultScreen extends StatefulWidget {
  final String tag;

  const ResultScreen({Key key, this.tag}) : super(key: key);
  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.accent,
      appBar: AppBar(
        title: Text('Search for : ${widget.tag}'),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back,
            color: Palette.accent,
          ),
        ),
      ),
      body: FutureBuilder<List<Anime>>(
        future: fetchAnime(widget.tag),
        builder: (context, snapshot) {
          if (snapshot.hasError)
            return Container(
              margin: EdgeInsets.all(5.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/sorry.png'),
                    Text(
                      snapshot.error,
                      style: TextStyle(
                          color: Color(0xFF69545D),
                          fontSize: 18.0,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            );
          return snapshot.hasData
              ? AnimeList(items: snapshot.data)
              : Center(
                  child: CircularProgressIndicator(
                  backgroundColor: Palette.primary,
                ));
        },
      ),
    );
  }
}

class AnimeList extends StatelessWidget {
  final List<Anime> items;

  AnimeList({Key key, this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.6,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final Anime anime = items[index];
          return GestureDetector(
            onTap: () => print(anime.title),
            child: Stack(children: [
              Container(
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(anime.cover),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(4, 4),
                        color: Palette.primary.withOpacity(0.55),
                        blurRadius: 2,
                      )
                    ],
                    borderRadius: BorderRadius.circular(5)),
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5)),
                    gradient: LinearGradient(
                      colors: [
                        Colors.black87,
                        Colors.black45,
                        Colors.transparent
                      ],
                      stops: [0.5, 1, 1],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  child: Text(
                    anime.title,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Palette.accent, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Icon(
                  Icons.favorite_border,
                  size: 25,
                  color: Palette.accent,
                ),
              ),
            ]),
          );
        },
      ),
    );
  }
}
