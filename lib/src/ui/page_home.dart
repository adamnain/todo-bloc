import 'package:exampletododevindo/src/blocs/bloc_base.dart';
import 'package:exampletododevindo/src/models/model_base.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    bloc.fetchAllList();
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder(
        stream: bloc.allList,
        builder: (context, AsyncSnapshot<BaseModels> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //         context, MaterialPageRoute(builder: (context) => Create()));
      //   },
      //   child: Icon(Icons.add),
      // ),
    );
  }

  Widget buildList(AsyncSnapshot<BaseModels> snapshot) {
    return ListView.builder(
        itemCount: snapshot.data.data.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(snapshot.data.data[index].namarm)
          );
          // return  CheckboxListTile(
          //   value: snapshot.data[index].done,
          //   title: Text(snapshot.data[index].name),
          //   // subtitle: Text(snapshot.data[index].id),
          //   onChanged: (bool isChecked){
          //     bloc.getId(snapshot.data[index].id.toString());
          //     bloc.updateTodo();
          //     bloc.fetchAllTodo();
          //   },
        });
  }
}
