import 'package:flutter/material.dart';
import 'package:signup/constants/doctors.dart';
import 'BookAppointmentPage.dart';
import 'ProfileScreen.dart';
import 'appointmentsScreen.dart';
import 'constants/categories.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:signup/loginScreen.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;

  final List<Widget> pages = const [
    HomeScreen(),
    Appointmentsscreen(),
    Profilescreen(),
  ];

  void ontapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: pages[_selectedIndex],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: GNav(
          selectedIndex: _selectedIndex,
          onTabChange: ontapped,
          gap: 8,
          tabBorderRadius: 16,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          tabBackgroundColor: const Color(0xFFC850C0).withOpacity(0.2),
          tabs: const [
            GButton(
              icon: Icons.home_rounded,
              text: 'Home',
              iconColor: Color(0xFF4158D0),
              textColor: Color(0xFF4158D0),
            ),
            GButton(
              icon: Icons.calendar_month_rounded,
              text: 'Appointments',
              iconColor: Color(0xFF4158D0),
              textColor: Color(0xFF4158D0),
            ),
            GButton(
              icon: Icons.person_rounded,
              text: 'Profile',
              iconColor: Color(0xFF4158D0),
              textColor: Color(0xFF4158D0),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        elevation: 0,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFF4158D0).withOpacity(0.95),
                const Color(0xFFC850C0).withOpacity(0.95),
              ],
            ),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/Salamacare logo.png',
                      height: 50,
                      width: 50,
                    ),
                    const SizedBox(width: 16),
                    const Text(
                      'Salama Care',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ),
              _buildDrawerItem(Icons.settings_rounded, 'Settings', () {}),
              _buildDrawerItem(Icons.help_rounded, 'FAQ', () {}),
              const Divider(color: Colors.white24, height: 1),
              _buildDrawerItem(Icons.logout_rounded, 'Log out', () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Loginscreen()),
                );
              }, isLogout: true),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF4158D0),
              Color(0xFFC850C0),
              Color(0xFFFFCC70),
            ],
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello ,\u{1F44B}',//hand emoji
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'How are you feeling today?',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                        Builder(
                          builder: (context) => IconButton(
                            icon: const Icon(Icons.menu_rounded, color: Colors.white),
                            onPressed: () => Scaffold.of(context).openDrawer(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 20,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search doctors, services...',
                          hintStyle: TextStyle(color: Colors.grey.shade400),
                          prefixIcon: Icon(Icons.search_rounded, color: Colors.grey.shade400),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(20, 30, 20, 16),
                      child: Text(
                        'Our Services',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4158D0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 120,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        children: const [
                          CategoryCard(
                            categoryName: 'General',
                            iconImage: 'assets/Icons/health.png',
                          ),
                          CategoryCard(
                            categoryName: 'Dentist',
                            iconImage: 'assets/Icons/dental-care.png',
                          ),
                          CategoryCard(
                    categoryName: 'Dermatologist',
                    iconImage: 'assets/Icons/dermatology.png',
                  ),
                  CategoryCard(
                    categoryName: 'Diabetes testing',
                    iconImage: 'assets/Icons/blood-test.png',
                  ),
                  CategoryCard(
                    categoryName: 'psychiatry',
                    iconImage: 'assets/Icons/brain.png',
                  ),
                  CategoryCard(
                    categoryName: 'X-ray',
                    iconImage: 'assets/Icons/x-ray.png',
                  ),
                  CategoryCard(
                    categoryName: 'ultrasound',
                    iconImage: 'assets/Icons/ultrasound.png',
                  ),
                  CategoryCard(
                    categoryName: 'Mother child care',
                    iconImage: 'assets/Icons/baby.png',
                  ),
                  CategoryCard(
                    categoryName: 'Nutrition ',
                    iconImage: 'assets/Icons/nutrition.png',
                  ),
                  CategoryCard(
                    categoryName: 'HIV Testing ',
                    iconImage: 'assets/Icons/red-ribbon.png',
                  ),
                  CategoryCard(
                    categoryName: 'orthopedic care',
                    iconImage: 'assets/Icons/broken-arm.png',
                  ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(20, 24, 20, 16),
                      child: Text(
                        'Top Doctors',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4158D0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        children: const [
                          Doctorcard(
                            imageUrl: 'assets/images/smiling doctor.jpg',
                            name: 'Dr. Kevin Maina',
                            speciality: 'Dentist',
                          ),
                          // ... other doctor cards
                          Doctorcard(
                  imageUrl: 'assets/images/devine doctor.jpg',
                  name: 'Dr. faith wanjiru',
                  speciality: 'Dermatologist',
                ),
                Doctorcard(
                  imageUrl: 'assets/images/doctor3.jpg',
                  name: 'Dr. faith wanjiru',
                  speciality: 'General doctor',
                ),
                Doctorcard(
                  imageUrl: 'assets/images/doctor4.jpg',
                  name: 'Dr. faith wanjiru',
                  speciality: 'Nutritionist',
                ),
                Doctorcard(
                  imageUrl: 'assets/images/doctor5.jpg',
                  name: 'Dr. Ben Carson',
                  speciality: 'General doctor',
                ),
                Doctorcard(
                  imageUrl: 'assets/images/doctor6.jpg',
                  name: 'Dr. faith wanjiru',
                  speciality: 'General doctor',
                ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => const BookAppointmentPage()),
                                );
      } ,
      child: Text('Book'),
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, VoidCallback onTap, {bool isLogout = false}) {
    return ListTile(
      leading: Icon(icon, color: isLogout ? Colors.red.shade100 : Colors.white),
      title: Text(
        title,
        style: TextStyle(
          color: isLogout ? Colors.red.shade100 : Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
      horizontalTitleGap: 16,
      splashColor: Colors.white.withOpacity(0.1),
      hoverColor: Colors.white.withOpacity(0.05),
    );
  }
}