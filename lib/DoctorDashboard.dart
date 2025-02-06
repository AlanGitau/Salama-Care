import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
                  fillColor: Colors.grey[200],
                  contentPadding: EdgeInsets.symmetric(vertical: 8),
                ),
              )
              ),
              const SizedBox(width: 15,),
              //new appointment button

              ElevatedButton(
                onPressed: (){}, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  elevation: 2,
                ),
                child: const Text('New appointment',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),)
                ),

                const SizedBox(width: 15,),
//circle avatar
                const CircleAvatar(
                   backgroundImage: AssetImage('assets/images/boy.png'),
                   radius: 20,
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
              child:Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/Salamacare logo.png',width: 50,height: 50,),
                  const SizedBox(width: 10,),
                  Text('Salama care',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.2,
                    ),),
                ],
              )
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
              horizontalTitleGap: 16,
              tileColor: Colors.transparent,
              splashColor: Colors.blue.withOpacity(0.1),
              hoverColor: Colors.blue.withOpacity(0.05),
            ),

            const SizedBox(height: 8,),

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
              horizontalTitleGap: 16,
              tileColor: Colors.transparent,
              splashColor: Colors.blue.withOpacity(0.1),
              hoverColor: Colors.blue.withOpacity(0.05),
            ),

            const SizedBox(height: 8,),

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
              horizontalTitleGap: 16,
              tileColor: Colors.transparent,
              splashColor: Colors.blue.withOpacity(0.1),
              hoverColor: Colors.blue.withOpacity(0.05),

            ),

            const SizedBox(height: 8,),
            Divider(color: Colors.grey.shade300, height: 1),

            ListTile(
        leading: const Icon(Icons.logout, color: Colors.red),
        title: const Text(
          'Log out',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () {},
        horizontalTitleGap: 16,
        tileColor: Colors.transparent,
        splashColor: Colors.red.withOpacity(0.1),
        hoverColor: Colors.red.withOpacity(0.05),
      ),

          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Today\'s appointments',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
            SizedBox(height: 10,),

            //Appointments stat cards
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                statcard(
                  title: 'Upcoming appointments', 
                  color: Colors.amber, 
                  count: '10', 
                  icon: Icons.upcoming),
        
                  statcard(
                    title: 'Completed Appointments', 
                    color: Colors.green, 
                    count: '5', 
                    icon: Icons.check_circle),
        
                 statcard(
                  title:'missed Apointments', 
                  color: Colors.orange.shade200, 
                  count: '2', 
                  icon: Icons.hourglass_empty)
        
        
              ],
            )
          ],
        ),
      ),
    );
  }
}


class statcard extends StatelessWidget {
  final String title;
  final String count;
  final Color color;
  final IconData icon;

  const statcard({
    Key?key,
    required this.title,
    required this.color,
    required this.count,
    required this.icon,})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),//Adds spacing between cards
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: color, //passed the color object stored in the statcard widget
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 2),
            )
          ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //card icon
            Icon(
              icon,
              size: 32,
              color: Colors.black54,
              ),
            SizedBox(height: 15,),
//Card Title
            Text(
              title,
              style: TextStyle(
                fontSize: 16, 
                fontWeight: FontWeight.bold,
                color: Colors.black87
                ),
            ),
            SizedBox(height: 4,),
//count 
            Text(
              count,
              style: TextStyle(fontSize: 28, 
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              ),
            ),
          ],

        ),
      ),
    );
  }
}