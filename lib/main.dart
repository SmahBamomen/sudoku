import 'package:flutter/material.dart';
import 'package:sudoku_solver_generator/sudoku_solver_generator.dart';

void main() {



  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      useInheritedMediaQuery: true,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var sudokuGenerator = SudokuGenerator(emptySquares: 54);
  int i = 0;
  int j = 0;
  var list = [];
  var list2 = [];
@override
  void initState() {
    // TODO: implement initState

  function();

  }


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body:Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 9,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              childAspectRatio: 1,


              children: List.generate(81, (index) {
                // print(sudokuGenerator.newSudoku.toString());
                // print(sudokuGenerator.newSudoku[0].toString());
                // print(sudokuGenerator.newSudoku[0][0].toString());
                // print(sudokuGenerator.newSudoku[index].toString());
                //  print(sudokuGenerator.newSudoku[index][index].toString());

                return list[index] == 0 ? Container(
                  color: Colors.grey.shade100,
                  alignment: Alignment.center,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText:''),
                  ),
                ) :Center(
                  child: Text(list[index].toString()),
                );

                // for (i; i < sudokuGenerator.newSudoku.length; i++) {
                //   list.add(sudokuGenerator.newSudoku[i]);
                //   for (int i =0; i < list.length ;i++) {
                //     for (int j=0; j < list.length ;j++) {
                //
                //       return Center(
                //         child: Text(list[index].toString()),
                //       );
                //       return Center(
                //           child: TextField(
                //             keyboardType: TextInputType.number,
                //             decoration: InputDecoration(labelText:list[i][j].toString()),
                //           ));
                //       return Text(list[i][j].toString());
                //     }}
                //
                // }

                // return Center(
                //
                //   child: TextField(
                //     keyboardType: TextInputType.number,
                //     decoration: InputDecoration(labelText:''),
                // ));
                return Container();
                //  }

              }),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(onPressed: (){
                list.clear();
                print(list.length);
setState(() {
  for ( int i = 0; i < sudokuGenerator.newSudoku.length ;i++) {
    for ( int j = 0; j < sudokuGenerator.newSudoku.length ;j++) {
      list.add(sudokuGenerator.newSudoku[i][j]);



    }}
});
              }, child: Text("Refresh")),
              SizedBox(width: 10),
              TextButton(onPressed: (){
                list.clear();
                print(list.length);
                setState(() {
                  for ( int i = 0; i < sudokuGenerator.newSudoku.length ;i++) {
                    for ( int j = 0; j < sudokuGenerator.newSudoku.length ;j++) {
                      list.add(sudokuGenerator.newSudoku[i][j]);



                    }}
                });
              }, child: Text("solved ")),
            ],
          )

        ],
      ),

    );
  }
  void function(){
    SudokuUtilities.printSudoku(sudokuGenerator.newSudoku);

    SudokuUtilities.printSudoku(sudokuGenerator.newSudokuSolved, );
    for ( int i = 0; i < sudokuGenerator.newSudoku.length ;i++) {
      for ( int j = 0; j < sudokuGenerator.newSudoku.length ;j++) {
        list.add(sudokuGenerator.newSudoku[i][j]);



      }}

  }
}
