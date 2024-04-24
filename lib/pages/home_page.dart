import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  bool isLoading = false;

  // @override
  // void initState() {
  //   super.initState();
  //
  //   refreshNotes();
  // }
  //
  // @override
  // void dispose() {
  //   NotesDatabase.instance.close();
  //
  //   super.dispose();
  // }

  // Future refreshNotes() async {
  //   setState(() => isLoading = true);
  //
  //   notes = await NotesDatabase.instance.readAllNotes();
  //
  //   setState(() => isLoading = false);
  // }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.blueAccent,
      title: const Text(
        'MyMovieApp',
        style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.white
        ),
      ),
      // actions: const [
      //   Icon(
      //     Icons.search,
      //
      //     color: Colors.white,
      //   ),
      //   SizedBox(width: 12)
      // ],
    ),
    body:
      Container(
        color: Colors.lightBlueAccent,
        width: double.infinity,
        child: Column(
          children: [
            const Text("Movie Preview App",
              style:
                TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold
                )
            ),
            const Text(
                "By Ridzki Raihan Alfaza from class E",
                style:
                  TextStyle(
                      fontSize: 18,
                  )
            ),
            const Text(
                "5025201178",
                style:
                  TextStyle(
                    fontSize: 18,
                  )
            ),
            TextButton(
                onPressed: ()
                  {
                    Navigator.popAndPushNamed(context, '/movie_list');
                  }
                ,
                child: const Text(
                    "Preview Movies",
                    style:
                      TextStyle(
                        fontSize: 18,
                      )
                )
            ),

          ],
        ),
      )
    );
}
