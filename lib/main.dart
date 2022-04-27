import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return MaterialApp(
      title: 'Demo Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  final pages = [Home(), Informasi(), Contact(),Pesan()];

  int selectedIndex = 0;

  void onTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Un Insan Pembangunan'),
      ),
      // membuat objek dari kelas BottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.announcement), title: Text('Informasi')),
          BottomNavigationBarItem(
              icon: Icon(Icons.phone), title: Text('Contact')),
        ],
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.blue,
        onTap: onTap,
      ),
      // membuat objek dari kelas TabBarView
      body: pages.elementAt(selectedIndex),
    );
  }
}
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(   
            icon: Icon(Icons.email),
             onPressed: () {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (BuildContext context){
                return Pesan();
              },
              ),
              );
          },
          ),
          Container(width: 10),
         IconButton(   
            icon: Icon(Icons.info_outline),
            onPressed: () {},
          ),
          Container(width: 10),
          IconButton(   
            icon: Icon(Icons.file_download),
            onPressed: () {},
          ),
          Container(width: 10),
          IconButton(   
            icon: Icon(Icons.event),
            onPressed: () {},
          
          ),
        ],
      ),
      ),
    );
  }
}
class Pesan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Layar 2"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Kembali ke Layar 1'),
        ),
      ),
    );
  }
}

class Informasi extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Informasi> {
  String fileName = 'images/poto1.jpg';

  void selectImage(int index) {
    setState(() {
      switch (index) {
        case 0: this.fileName = 'images/poto1.jpg'; break;
        case 1: this.fileName = 'images/poto2.jpg'; break;
      }
    });    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tentang kami'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_left),
            onPressed: () {
              selectImage(0);
            },
          ),
          IconButton(
            icon: Icon(Icons.arrow_right),
            onPressed: () {
              selectImage(1);
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget> [
          Image.asset(
            this.fileName,
            height: 250.0,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}



class Contact extends StatelessWidget {
  final String title ='Kontak Kami';
  final String location ='Bitung, Tangerang';
  final String description =
  '''
  Jl. Raya Serang Km. 10, Bitung - Tangerang, Provinsi Banten Telp (021) 59492836/7 
        Website : https://www.stmik.ipem.ac.id
        ''';
  @override

  
  Widget build(BuildContext context) {
    return Scaffold(

body: Column(
  mainAxisAlignment: MainAxisAlignment.start,
  children: <Widget>[
    Image.asset(
      'images/poto1.jpg',
      height: 250.0,
      width: 4412.0,
fit: BoxFit.fill,
    ),
    Container(
      height: 15.0,

    ),
    Row(
      children: <Widget>[
        Container(
          width: 15.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            Text(
              this.title,
              style: TextStyle(fontSize: 25.0,
              fontWeight: FontWeight.bold)
            ),
            Text(
              this.location,
              style: TextStyle(color: Colors.grey,
              fontSize: 20.0,
              ),
            ),
          ],
        ),
        Container(
          width: 130.0,

        ),
       IconButton(
            icon: Icon(Icons.location_on),
            onPressed: () {

            }
       ),
    
      ],
    ),
    Container(
      padding: EdgeInsets.all(15.0),
      child: Text(
        this.description,
        style: TextStyle(fontSize: 18.0,
        ),
        softWrap: true,
      ),
    ),
  ],
),
    );
   
  }
}
