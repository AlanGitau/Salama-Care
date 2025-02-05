import 'package:flutter/material.dart';
import 'package:signup/loginScreen.dart';

class Doctordashboard extends StatefulWidget {
  const Doctordashboard({super.key});

  @override
  State<Doctordashboard> createState() => _DoctordashboardState();
}

class _DoctordashboardState extends State<Doctordashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (context) {
            return IconButton(onPressed: (){// menu icon
              Scaffold.of(context).openDrawer();
            }, 
            icon: Icon(Icons.menu,color: Colors.black,));
          }
        ),
        title:  Row(
          children: [
            //searchbar
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'search',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200]
                ),
              )
              ),
              const SizedBox(width: 15,),
              //new appointment button

              ElevatedButton(
                onPressed: (){}, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                ),
                child: const Text('new appointment',style: TextStyle(color: Colors.white),)
                ),

                const SizedBox(width: 15,),
//circle avatar
                const CircleAvatar(
                   backgroundImage: AssetImage('assets/images/boy.png'),
                ),
          ],
        ),
      ),
      drawer: Drawer(
        elevation: 15,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          )
        ),
        backgroundColor: Colors.grey.shade50,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors:[Colors.blue.shade700,Colors.blue.shade400],
                  begin: Alignment.topLeft,
                  end:Alignment.bottomRight,
                  ),
                  
                ),
              child:Text('Salama care',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.2,
                ),)
              ),

            ListTile(
              leading:  Icon(Icons.dashboard, color: Colors.blue.shade600,),
              title:  Text('Appointments',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade800,
              ),
              ),
              onTap: (){},
              tileColor: Colors.transparent,
              splashColor: Colors.blue.withOpacity(0.1),
              hoverColor: Colors.blue.withOpacity(0.05),
            ),

            ListTile(
              leading:Icon(Icons.people, color: Colors.blue.shade600,),
              title: Text('patients',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade800,
              ),
              ),
              onTap: (){},
              tileColor: Colors.transparent,
              splashColor: Colors.blue.withOpacity(0.1),
              hoverColor: Colors.blue.withOpacity(0.05),
            ),

            ListTile(
              leading:  Icon(Icons.settings, color: Colors.blue.shade600,),
              title: Text('settings',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade800,
              ),
              ),
              onTap: (){},
              tileColor: Colors.transparent,
              splashColor: Colors.blue.withOpacity(0.1),
              hoverColor: Colors.blue.withOpacity(0.05),

            ),
            Divider(color: Colors.grey.shade300, height: 1),

            ListTile(
        leading: Icon(Icons.logout, color: Colors.red),
        title: Text(
          'Log out',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () {},
        tileColor: Colors.transparent,
        splashColor: Colors.red.withOpacity(0.1),
        hoverColor: Colors.red.withOpacity(0.05),
      ),

          ],
        ),
      ),
    );
  }
}