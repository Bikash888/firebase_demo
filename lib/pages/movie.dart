// ignore_for_file: prefer_const_constructors

import 'dart:ui';
import 'package:firebase_demo/utils/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_demo/movies.dart';
import 'package:firebase_demo/service/movie_service.dart';

final moviesFutureProvider =
    FutureProvider.autoDispose<List<Movies>>((ref) async {
  ref.maintainState = true;
  final movieService = ref.read(moviesServiceProvider);
  final moviesList = await movieService.getMoviesFromAPI();
  return moviesList;
});

class Movie extends ConsumerWidget {
  const Movie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            title: Text("Popular Movies"),
          ),
          body: watch(moviesFutureProvider).when(
              data: (movies) {
                return RefreshIndicator(
                  onRefresh: () {
                    return context.refresh(moviesFutureProvider);
                  },
                  child: GridView.extent(
                    maxCrossAxisExtent: 200,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.7,
                    children:
                        movies.map((movie) => _MovieBox(movie: movie)).toList(),
                  ),
                );
              },
              loading: () => Center(
                    child: CircularProgressIndicator(),
                  ),
              error: (e, s) {
                return Text("Error Occured");
              })),
    );
  }
}

class _MovieBox extends StatelessWidget {
  final Movies movie;
  const _MovieBox({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async =>
          {await Navigator.pushNamed(context, MovieRoutes.movieDetails)},
      child: Stack(
        children: [
          Image.network(
            movie.fullImageURL,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _FrontBanner(text: movie.title),
          ),
        ],
      ),
    );
  }
}

class _FrontBanner extends StatelessWidget {
  final String text;
  const _FrontBanner({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          color: Colors.grey.shade200.withOpacity(0.5),
          height: 60,
          child: Center(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyText2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
