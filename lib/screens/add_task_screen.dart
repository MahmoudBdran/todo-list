import 'package:flutter/material.dart';

class AddTask_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController titleController=TextEditingController();
    return Scaffold(
      body:SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13,vertical: 10),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: IconButton(
                        iconSize: 30,
                        icon: Icon(Icons.arrow_back_ios,
                          color: Colors.blueGrey,),

                      ),
                    ),
                    Text("Add Task",style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54
                    ),)
                  ],
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelText: "Title",
                    labelStyle: TextStyle(
                          color: Colors.grey
                      )
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  maxLines: 5,
                  controller: titleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelText: "Description",
                    labelStyle: TextStyle(
                      color: Colors.grey
                    )
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15,vertical: 30),
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: FlatButton(
                  onPressed: (){},
                  child: Text("Add Task",style:TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
