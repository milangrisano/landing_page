import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vertical_landing_page/providers/page_provider.dart';
import 'package:vertical_landing_page/ui/views/about_view.dart';
import 'package:vertical_landing_page/ui/views/contact_view.dart';
import 'package:vertical_landing_page/ui/views/location_view.dart';
import 'package:vertical_landing_page/ui/views/home_view.dart';
import 'package:vertical_landing_page/ui/views/pricing_view.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        leading: HomeIconAppBar(),
        title: Text(
          'Veleros Santa Marta',
          style: GoogleFonts.frederickaTheGreat(
            fontSize: 20
          )
        ),
        backgroundColor: Colors.blueAccent,
      ),
      endDrawer: Drawer(
        backgroundColor: Colors.white,
        shadowColor: Colors.white24,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            _builderHeader(),
            _drawerTitle(
              icon: Icons.home,
              title: 'Home',
              onTap: () {
                pageProvider.goTo(0);
                Navigator.pop(context);
              }
            ),
            _drawerTitle(
              icon: Icons.people_alt_rounded,
              title: 'About',
              onTap: () {
                pageProvider.goTo(1);
                Navigator.pop(context);
              }
            ),
            _drawerTitle(
              icon: Icons.money_sharp,
              title: 'Pricing',
              onTap: () {
                pageProvider.goTo(2);
                Navigator.pop(context);
              }
            ),
            _drawerTitle(
              icon: Icons.contact_mail_rounded,
              title: 'Contact',
              onTap: () {
                pageProvider.goTo(3);
                Navigator.pop(context);
              }
            ),
            _drawerTitle(
              icon: Icons.location_on,
              title: 'Location',
              onTap: () {
                pageProvider.goTo(4);
                Navigator.pop(context);
              }
            ),
           

          ],
        ),
      ),
      body: Container(
          decoration: buildBoxDecoration(),
          child: Stack(
            children: [
        
              _HomeBody(),

            ],
          ),
        ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Colors.pink,
        Colors.purpleAccent
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [ 0.5, 0.5 ]
    )
  );
  
  _builderHeader() {
    return DrawerHeader(
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        // image: DecorationImage(
          // image: AssetImage('assets/images/drawer-image.png')
        // )
      ), child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: AssetImage('assets/images/drawer-image.png'),
            radius: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: Text(
              'Veleros Santa Marta',
              style: GoogleFonts.roboto(
                  color: Colors.white
              )
            ),
          ),
        ],
      ),
    );
  }
  
  _drawerTitle({
      required IconData icon,
      required String title,
      required GestureTapCallback onTap
    }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }
}


class HomeIconAppBar extends StatelessWidget {
  const HomeIconAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        backgroundImage: AssetImage('assets/images/drawer-image.png'),
        radius: 0.5,
      ),
    );
  }
}




class _HomeBody extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final pageProvider = Provider.of<PageProvider>(context, listen: false);

    return PageView(
      controller: pageProvider.scrollController,
      scrollDirection: Axis.vertical,
      children: [
        HomeView(),
        AboutView(),
        PricingView(),
        ContactView(),
        LocationView(),
      ],
    );
  }
}