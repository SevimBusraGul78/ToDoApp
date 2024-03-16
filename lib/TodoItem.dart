import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/colors.dart';
import 'package:todo/todo.dart';

class TodoItem extends StatelessWidget {
  final ToDo toDo;
  final onToDoChanged;
  final onDeleteItem;

  const TodoItem({Key? key,required this.toDo,required this.onToDoChanged,required this.onDeleteItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.only(bottom: 20) ,//alt boşluk
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
        tileColor: Colors.white,
        onTap: () {
         // print("Clicked on Todo Item");
          onToDoChanged(toDo);
        },
        leading: Icon(
            toDo.isDone ? Icons.check_box : Icons.check_box_outline_blank,color: tdBlue),
        title: Text(
          toDo.todoText!,
            style: TextStyle(
            fontSize: 16,
            color: tdBlack,
            decoration: toDo.isDone ? TextDecoration.lineThrough:null,
          ),
        ),

        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color:tdRed,
            borderRadius: BorderRadius.circular(5)
          ),

          child: IconButton(
           iconSize:18,
            icon: Icon(Icons.delete,color: Colors.white,),
            onPressed: (){
              //  print("Clicked on delete icon");
              onDeleteItem(toDo.id);
            },

          ),
        ),
      ),
    );
  }
}
