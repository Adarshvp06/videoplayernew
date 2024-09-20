



import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:videoplayer/models/movielatest_api.dart';
import 'package:videoplayer/widgets/custom_listtile.dart';
import 'package:http/http.dart' as http;

class Onlinepage extends StatefulWidget {
  const Onlinepage({super.key});

  @override
  State<Onlinepage> createState() => _OnlinepageState();
}

class _OnlinepageState extends State<Onlinepage> {
  Future<Movielatest?> fetchTopratedMovies() async {
    var url =
        "https://api.themoviedb.org/3/movie/top_rated?api_key=0277cc714ad9100fe38b7f37fdfeb1d9";

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var responsebody = jsonDecode(response.body);
      var data = Movielatest.fromJson(responsebody);
      return data;
    } else {
      throw Exception("Failed to load movies");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Movielatest?>(
          future: fetchTopratedMovies(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              log("error");
              return Center(
                
                child: Text("Error: ${snapshot.error}"),
              );
            } else if (!snapshot.hasData || snapshot.data!.results == null || snapshot.data!.results!.isEmpty) {

              log("NO movies");
              return const Center(
                child: Text("No movies available"),
              );
            } else {
              log("message");
              return ListView.builder(
                itemBuilder: (context, index) {
                  log("apiload");
                 final movie = snapshot.data!.results![index];
                  return CustomListtile(
                    
                    titletext: movie.title ?? 'No Title',
                    timetext: movie.originalTitle ?? 'No Original Title',
                    dismissiblekey:"",
                    thumbnail: const Icon(Icons.movie),
                    onTap: () {},
                  );
                },
                itemCount: snapshot.data!.results!.length,
              );
            }
          }),
    );
  }
}
