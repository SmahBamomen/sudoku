import 'package:flutter/material.dart';
import 'package:sudoku_package/sudoku_main_game.dart';
import 'package:sudoku_solver_generator/sudoku_solver_generator.dart';
import 'package:quiver/collection.dart';

class SudokuGame extends StatefulWidget {
  const SudokuGame({super.key, required this.title});
  final String title;

  @override
  State<SudokuGame> createState() => _SudokuGameState();
}

class _SudokuGameState extends State<SudokuGame> {
  var sudokuGenerator = SudokuGenerator(emptySquares: 54);
  int i = 0;
  int j = 0;
  var sudokuList = [];
  var solvedlist = [];

  @override
  void initState() {
    // TODO: implement initState
    sudokuFunction();

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body:Column(
        children: [
          Container(
            padding: EdgeInsets.only(left:5,top: 50,right: 5,bottom: 5),
            child: Text("Start to play"),
            alignment: Alignment.center,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left:5,top: 40,right: 5,bottom: 5),
              margin: EdgeInsets.all(25),

              alignment: Alignment.center,
              child: GridView.count(
                crossAxisCount: 9,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                childAspectRatio: 1,


                children: List.generate(sudokuList.length, (index) {

                  return sudokuList[index] == 0 ? Container(
                    color: Colors.grey.shade200,
                    alignment: Alignment.center,
                    child: TextField(

                      maxLength: 1,

                      onChanged: (text){
                        solvedlist.clear();
                        print(solvedlist.length);
                        if (sudokuList[index] == 0){

                          sudokuList[index] = int.parse(text);
                          sudokuList.add(sudokuList[index] );


                        }



                        // print("solvedlist"+solvedlist.toString());
                      },
                      autocorrect: true,

                      keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 14),
                      decoration: InputDecoration(   contentPadding: EdgeInsets.only(
                          left: 12,bottom: 8,right: 12  // HERE THE IMPORTANT PART
                      ), counterText: '',
                          border: OutlineInputBorder()
                      ),
                    ),
                  ) :Center(
                    child: Text(sudokuList[index].toString()),
                  );



                }),
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.only(left:5,top: 5,right: 5,bottom: 5),
              margin: EdgeInsets.all(100),
              alignment: Alignment.center,


              child :Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(


                      onPressed: refresh, child: Text("Refresh")),
                  SizedBox(width: 10),
                  TextButton(onPressed : (){
                    var solvedlist1 = [];
                    for ( int i = 0; i < sudokuGenerator.newSudokuSolved.length ;i++) {
                      for ( int j = 0; j < sudokuGenerator.newSudokuSolved.length ;j++) {
                        solvedlist1.add(sudokuGenerator.newSudokuSolved[i][j]);


                        if(listsEqual(solvedlist1, sudokuList.sublist(0,81))){
                          print("heeeee");
                          showDialog(
                              context: context,
                              builder: (context) {
                                return  AlertDialog(
                                  title: Text('YAAAAY Congratulation '),
                                  content: Text('Play Next ?'),

                                  actions: [
                                   TextButton(onPressed: (){
                                      refresh();

                                    }, child: Text('Yes'))
                                  ],
                                );
                              });

                        }
                        else {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return  AlertDialog(
                                  title: Text('Game Over '),
                                  content: Text('try again'),

                                  actions: [
                                   TextButton(onPressed: (){
                                      refresh();

                                    }, child: Text('Ok'))
                                  ],
                                );
                              });
                          print("noooo");
                        }


                      }}
                  }, child: Text("Finish ")),
                ],
              )

          )],
      ),

    );
  }

  void sudokuFunction(){
    sudokuList.clear();
    SudokuUtilities.printSudoku(sudokuGenerator.newSudokuSolved, );
    for ( int i = 0; i < sudokuGenerator.newSudoku.length ;i++) {
      for ( int j = 0; j < sudokuGenerator.newSudoku.length ;j++) {
        sudokuList.add(sudokuGenerator.newSudoku[i][j]);



      }}

  }

  void refresh(){
    setState(() {
      sudokuFunction();
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  SudokuMainGame()),
      );
    });
  }

}