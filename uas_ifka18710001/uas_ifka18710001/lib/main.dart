import 'package:flutter/material.dart';
import 'package:uas_flutter/splashscreen.dart';
import 'package:uas_flutter/components/customListTile.dart';
import 'package:uas_flutter/model/article_model.dart';
import 'package:uas_flutter/services/api_services.dart';
import 'package:uas_flutter/navigator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenPage(),
      routes: <String, WidgetBuilder>{
        'halaman': (BuildContext context) => new halaman(),
        'shopping': (BuildContext context) => new HomePage1(),
        'hiburan': (BuildContext context) => new HomePage2(),
        'profil': (BuildContext context) => new HomePage3(),
      },
    );
  }
}

class HomePage1 extends StatefulWidget {
  @override
  berita_auto createState() => berita_auto();
}

class HomePage2 extends StatefulWidget {
  @override
  berita_sp createState() => berita_sp();
}

class HomePage3 extends StatefulWidget {
  @override
  profil createState() => profil();
}

class berita_auto extends State<HomePage1> {
  ApiService client = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Shopping News", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.grey[400]),
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article> articles = snapshot.data;
            return ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) =>
                    customListTile(articles[index], context));
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class berita_sp extends State<HomePage2> {
  ApiService2 client = ApiService2();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Hiburan News", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.grey[400]),
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article> articles = snapshot.data;
            return ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) =>
                    customListTile(articles[index], context));
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class profil extends State<HomePage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Profile Page"),
        backgroundColor: Colors.grey[400],
      ),
      backgroundColor: Colors.blue[600],
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 60.0,
            backgroundImage: AssetImage('img/ifka.jpg'),
          ),
          Text(
            "",
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
          ),
          Text(
            "Ifka Angely",
            style: TextStyle(
              color: Colors.white,
              fontSize: 35,
            ),
          ),
          Text(
            "",
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
          ),
          Text(
            "18710001",
            style: TextStyle(
              color: Colors.cyan[50],
              fontSize: 18,
              letterSpacing: 2.5,
            ),
          ),
          SizedBox(
            height: 50.0,
            width: 150.0,
            child: Divider(
              color: Colors.white,
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: ListTile(
              leading: Icon(
                Icons.mode_edit_outlined,
                color: Colors.indigo,
              ),
              title: Text(
                "Kelas  : 7A SI Reguler Pagi (Banjarmasin)",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: ListTile(
              leading: Icon(Icons.call_outlined, color: Colors.indigo),
              title: Text(
                "Kontak : ifkaangely11@gmail.com (E-mail) | @ifkaangely_ (Instagram)",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: ListTile(
              leading: Icon(
                Icons.home_outlined,
                color: Colors.indigo,
              ),
              title: Text(
                "Alamat : Jl. Awang Sejahtera, Komplek Kidaung Permai No.63a",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
