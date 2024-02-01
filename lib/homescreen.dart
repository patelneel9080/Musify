import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musify/modelsongview.dart';
import 'package:musify/songpages.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        actions: [
          Icon(
            CupertinoIcons.search,
            color: Colors.black,
          )
        ],
      ),
      body: Column(
        children: [
          Text("Hi, Good Morning"),
          SizedBox(
            height: size.height,
            child: ListView.builder(
              itemCount: Songdetail.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  MusicPages(song: Songdetail[index].song, profile: Songdetail[index].profile, singer: Songdetail[index].singer,),
                        ));
                  },
                  child: ListTile(
                    title: Text(Songdetail[index].profile),
                  ),
                );
              },

            ),
          ),

        ],
      ),
    );
  }
}
