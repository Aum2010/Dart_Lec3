import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main(List<String> args) => runApp(MyApp());

class MyApp extends StatelessWidget {

 @override
 Widget build(BuildContext context) {
   final wordPair = WordPair.random();
   return MaterialApp(
     
    //  title: 'Welcome to Flutter',
    
    //  home: Scaffold(

    //     appBar: AppBar(
    //      title: Text('Welcome to Flutter'),
    //  ),

    //  body:  Center(
    //    child: RandomWordsState(),
    //  ),

    //  )
      

      title: 'Startup Name Genertor',
      home: RandomWordsState(),

   );

 }

}

class RandomWordsState extends StatefulWidget {
  @override
  RandomWordsStateState createState() => RandomWordsStateState();
}

class RandomWordsStateState extends State<RandomWordsState> {
  @override
  final WordPair wordPair = WordPair.random();
    final List<WordPair> _suggestion = <WordPair>[];
    final TextStyle _biggerFont = const TextStyle(
      
      fontSize: 18
      
      );

  Widget _buildRow(WordPair pair){
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }   

  Widget _buildSuggestions(){
    return ListView.builder(

      padding: const EdgeInsets.all(16),
      
      itemBuilder: (BuildContext _context,int i){
        if(i.isOdd){return Divider();}

        final int index = i ~/2;
        if (index >= _suggestion.length) {
          _suggestion.addAll(generateWordPairs().take(10));
        }

        return _buildRow(_suggestion[index]);

      }

   

    

  
    );
  }

  

  Widget build(BuildContext context) {
    

    //return Text(wordPair.asPascalCase);
      return Scaffold(
        appBar:  AppBar(
        title: Text('Statup Name Generator'),

        ),
        body: _buildSuggestions(),

      );
    
  }
}