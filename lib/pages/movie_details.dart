import 'package:flutter/material.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

TabBarView get _tabBarView => const TabBarView(children: [
      Center(child: Text("movie overview")),
      Center(child: Text("actors")),
      Center(child: Text("reviews"))
    ]);
