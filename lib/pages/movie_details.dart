import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieDetails extends ConsumerWidget {
  const MovieDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.teal,
            title: const Text(
              "Jay Bhim",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            bottom: PreferredSize(
              preferredSize: _tabBar.preferredSize,
              child: ColoredBox(
                color: Colors.teal,
                child: _tabBar,
              ),
            )),
        body: _tabBarView,
      ),
    );
  }
}

TabBar get _tabBar => const TabBar(
      indicatorColor: Colors.white,
      indicatorWeight: 4,
      tabs: <Widget>[
        Tab(icon: Icon(Icons.local_movies)),
        Tab(
          icon: Icon(Icons.recent_actors),
        ),
        Tab(
          icon: Icon(Icons.reviews_outlined),
        ),
      ],
    );

TabBarView get _tabBarView => TabBarView(children: [
      Container(
        child: _movieDetailsContainer,
      ),
      const Center(child: Text("actors")),
      const Center(child: Text("reviews"))
    ]);

Container get _movieDetailsContainer => Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
                "https://i.picsum.photos/id/191/2560/1707.jpg?hmac=60dSBXsS8n-Gi2-LMtm-BfDd6Mz_JMrYI8jN4yb41qg"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Eternal sunshine of spotless mind",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.teal,
                    fontWeight: FontWeight.w700,
                    fontFamily: GoogleFonts.roboto().fontFamily),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
              child: Row(
                children: const <Widget>[
                  Text("1hr 50min" + " " + "|",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500)),
                  Icon(Icons.star_rate, color: Colors.red),
                  Text("8.3"),
                  Text(" | Director:"),
                  Padding(
                    padding: EdgeInsets.fromLTRB(2.0, 0, 0, 0),
                    child: Text(" Christopher Nolan"),
                  )
                ],
              ),
            ),
            Container(child: const _Genera()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                for (var item in ["genera,genera"])
                  Text(item,
                      style: const TextStyle(
                          fontSize: 19, fontWeight: FontWeight.w700)),
              ]),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              // color: Colors.amber[600],
              decoration: const BoxDecoration(
                  border:
                      Border(left: BorderSide(width: 3, color: Colors.green))),
              // width: 48.0,
              // height: 4.0,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Storyline",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.blue)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "Much to his surprise, timid Joel Barish is shocked to discover that the love of his life, sparky Clementine, has had him erased from her memory. To pay her back in the same coin, poor Joel summons up the courage to undergo a painless but intricate medical procedure to do the same, utterly unaware that darkness is an essential part of the light.",
                  style: TextStyle(
                    fontSize: 16,
                  )),
            ),
            const Padding(
                padding: EdgeInsets.fromLTRB(8.0, 20, 8, 10),
                child: _SimilarMovieGridView())
          ],
        ),
      ),
    );

class _Genera extends StatelessWidget {
  const _Genera({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              border: Border(top: BorderSide(width: 2, color: Colors.red))),
          child: const Padding(
            padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
            child: Text("Language: Hindi", style: TextStyle(fontSize: 18)),
          )),
    );
  }
}

class _SimilarMovieGridView extends StatelessWidget {
  const _SimilarMovieGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: const Center(child: Text("Hello")));
  }
}
