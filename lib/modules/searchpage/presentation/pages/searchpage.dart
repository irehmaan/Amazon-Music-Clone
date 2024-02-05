import 'package:amazonmusiclone/modules/components/searchsuggestions.dart';
import 'package:amazonmusiclone/modules/searchpage/presentation/pages/expandedsearchpage.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
            )),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ExpandedSearchPage()));
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 35, horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40)),
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 13,
                      ),
                      Icon(
                        Icons.search,
                        color: Colors.grey.shade500,
                      ),
                      const SizedBox(
                        width: 13,
                      ),
                      Text(
                        "Search music and podcasts",
                        style: TextStyle(
                            fontSize: 16, color: Colors.grey.shade500),
                      )
                    ],
                  ),
                )),
            SuggestionsBox(
              suggestionBoxName: "Moods & Activities",
              suggestions: const [
                'Love',
                'Activities',
                'Moods',
                'Party',
                'Workout',
                'Travel'
              ],
              colors: [
                [
                  Colors.pink.shade400,
                  Colors.red.shade300,
                  Colors.pinkAccent.shade700,
                  Colors.pink.shade500
                ],
                [
                  Colors.orange.shade200,
                  Colors.yellow.shade900,
                  Colors.yellow.shade900,
                  Colors.orange.shade100
                ],
                [
                  Colors.green.shade400,
                  Colors.green.shade500,
                  Colors.green.shade300,
                  Colors.green.shade700,
                ],
                [
                  Colors.teal.shade400,
                  Colors.teal.shade300,
                  Colors.teal.shade400,
                  Colors.blueGrey.shade500
                ],
                [
                  Colors.cyan.shade300,
                  Colors.blue.shade400,
                  Colors.lightBlue.shade500,
                  Colors.cyan.shade500
                ],
                [
                  Colors.purple.shade400,
                  Colors.deepPurpleAccent,
                  Colors.deepPurple.shade700,
                  Colors.purple.shade500
                ],
              ],
            ),
            SuggestionsBox(
              suggestionBoxName: "Music By Genre",
              suggestions: const [
                'Bollywood',
                'Hollywood',
                'Tollywood',
                'Sandalwood',
                'Indian Pop',
                'LoFi'
              ],
              colors: [
                [
                  Colors.grey.shade500,
                  Colors.grey.shade700,
                  Colors.grey.shade700,
                  Colors.grey.shade500
                ],
                [
                  Colors.pinkAccent.shade200,
                  Colors.pinkAccent.shade700,
                  Colors.pinkAccent.shade700,
                  Colors.pinkAccent.shade100
                ],
                [
                  Colors.purpleAccent.shade100,
                  Colors.purpleAccent.shade700,
                  Colors.purpleAccent.shade700,
                  Colors.purpleAccent.shade100,
                ],
                [
                  Colors.deepPurple.shade400,
                  Colors.deepPurple.shade300,
                  Colors.deepPurple.shade300,
                  Colors.deepPurple.shade400
                ],
                [
                  Colors.lightBlue.shade100,
                  Colors.lightBlue.shade100,
                  Colors.lightBlue.shade100,
                  Colors.lightBlue.shade100
                ],
                [
                  Colors.deepOrange.shade300,
                  Colors.deepOrangeAccent,
                  Colors.deepOrangeAccent.shade200,
                  Colors.deepOrangeAccent
                ],
              ],
            )
          ],
        ),
      ),
    );
  }
}
