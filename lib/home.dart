import 'package:todo_list/DatabaseHelper.dart';
import 'package:flutter/material.dart';

import 'Model.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _width=250;
  bool checkboxValue=false;
  Icon task_unit_icon=Icon(Icons.crop_square,color: Colors.green,);
  String task_unit="work";
  String icon_color="work";


  double _spreading(BuildContext context){

    return  _width=MediaQuery.of(context).size.width-50;
  }
  double _NonSpreading(BuildContext context){

    return  _width=MediaQuery.of(context).size.width-150;
  }


  // List<Map<String,dynamic>> mylist=List();
  final  DBHelper =DatabaseHelper.instance;
  TextEditingController taskController= TextEditingController();

  void _insert() async{
    Map<String ,dynamic> row ={
      DatabaseHelper.col_title : '${taskController.text}',
      DatabaseHelper.col_icon_color : '$icon_color',
  };
  final id =await DBHelper.insert(row);
  print("inserted row id : $id");
  }
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.grey[200],
      extendBody: true,
      // appBar: CustomAppBar(),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0.0,
              bottom: 55.0,
              right: 0.0,
              left: 0.0,
              child: FutureBuilder(
                future: DBHelper.queryAllRows(),
                builder: (context, snapshot) {
                  if(snapshot.hasData){
                    print("snapshot value is "+snapshot.data.length.toString());
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        final item = snapshot.data[index].title;

                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 4),
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,

                            ),
                            child: ListTile(
                              leading: Icon(Icons.crop_square,color:_buildingMyIcon(snapshot.data[index].icon_color)),
                              title: Text("${snapshot.data[index].title}",style: TextStyle(
                                  color: Colors.black87
                              ),),
                              trailing: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: IconButton(
                                  icon: Icon(Icons.delete,color: Colors.red,size: 25,),
                                  onPressed: (){
                                    setState(() {
                                      DBHelper.delete(snapshot.data[index].title);
                                      Scaffold.of(context)
                                          .showSnackBar(SnackBar(content: Text("${snapshot.data[index].title} is done")));
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }else{
                    return Stack(
                      children: [
                        Positioned(
                          bottom: 300,
                          width: MediaQuery.of(context).size.width,

                          left: MediaQuery.of(context).size.width /3,
                          child: Stack(
                            children: [
                              Icon(Icons.event_note,size: 110,color: Colors.grey[400],),
                              Icon(Icons.not_interested,size: 110,color: Colors.red[200],),
                            ],
                          ),
                        ),
                        Positioned(
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          bottom: 200,
                          left: MediaQuery.of(context).size.width /4,
                          child: Text("No Tasks Todo",style: TextStyle(
                            color: Colors.grey,
                            fontSize: 30
                          ),),
                        )
                      ],
                    );
                  }
                },
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width/15,
              height: 50,
              bottom: 5.0,
              child: AnimatedContainer(
                duration:Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                width: _width,
                child: Center(
                  child: TextFormField(
                    onTap: (){
                      setState(() {
                        _spreading(context);
                      });
                    },
                    textInputAction: TextInputAction.done,

                    onFieldSubmitted: (term){
                      _insert();
                      _NonSpreading(context);
                      taskController.clear();
                    },
                    controller: taskController,
                    decoration: InputDecoration(
                      suffixIconConstraints: BoxConstraints(
                        maxHeight: 40,
                      ),
                      suffixIcon: Container(
                        margin: EdgeInsets.fromLTRB(0, 0,8, 0),
                        width: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200]
                        ),
                        child: FlatButton(
                          height: 10,
                          child: Row(
                            children: [
                              task_unit_icon,
                              Text(task_unit,style: TextStyle(color: Colors.black87,),),
                            ],
                          ),
                          onPressed:() =>  displayBottomSheet(context),


                        ),
                      ),
                      fillColor: Colors.white,
                      hintText: 'Write a new Task',
                      hintStyle: TextStyle(fontSize: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      contentPadding: EdgeInsets.all(16),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }

void displayBottomSheet(BuildContext context) {
  showModalBottomSheet(
    isDismissible: true,

      context: context,
      builder: (ctx) {
        return Container(
          height: MediaQuery.of(context).size.height  * 0.3,
          child: ListView(
            children: [
              ListTile(
                leading: Icon(Icons.crop_square,color: Colors.green,),
                title: Text("work"),
                onTap: (){
                  task_unit="work";
                  icon_color="work";
                  task_unit_icon=Icon(Icons.crop_square,color: Colors.green,);
                  Navigator.pop(context);

                },
              ),
              ListTile(
                leading: Icon(Icons.crop_square,color: Colors.red,),
                title: Text("entertainment"),
                onTap: (){
                task_unit="ent.";
                icon_color="ent.";
                task_unit_icon=Icon(Icons.crop_square,color: Colors.red,);
                Navigator.pop(context);

              },
              ),
              ListTile(
                leading: Icon(Icons.crop_square,color: Colors.purple,),
                title: Text("sports"),
                onTap: (){
                  task_unit="sport";
                  icon_color="sport";
                  task_unit_icon=Icon(Icons.crop_square,color: Colors.purple,);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.crop_square,color: Colors.yellow,),
                title: Text("shopping"),
                onTap: (){
                  task_unit="shop";
                  icon_color="shop";
                  task_unit_icon=Icon(Icons.crop_square,color: Colors.yellow,);
                  Navigator.pop(context);
                },
              ),
            ],
          )
        );
      });
}

  Color _buildingMyIcon(String text) {
    if(text=="work"){
      return Colors.green;
    }else if(text=="ent."){
      return Colors.red;
    }else if(text=="sport"){
      return Colors.purple;
    }else{
      return Colors.yellow;
    }
  }
}
