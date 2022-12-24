import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: NavBar(),
      body: Stack(
        children: [
          Container(
            height: size.height * .45,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(27, 81, 104, 0.4),
              // image: DecorationImage(
              //   alignment: Alignment.centerRight,
              //   image: AssetImage("assets/homepage/logo_simbo_slim.png"),
              // ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 52,
                      height: 52,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(27, 81, 104, 0.4),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.menu),
                        onPressed: (){},
                      ),
                    ),
                  ),
                  Text(
                    "Bonjour Eric Konan",
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(fontWeight: FontWeight.w900),
                  ),

              Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(29.5),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    icon: Icon(Icons.search),
                    border: InputBorder.none,
                  ),
                ),
              ),

                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: <Widget>[
                        const CategoryCard(
                          SvgSrc: '',
                          title: 'Tableau de Bord',
                        ),
                        const CategoryCard(
                          SvgSrc: '',
                          title: 'Recensement',
                        ),
                        const CategoryCard(
                          SvgSrc: '',
                          title: 'Collecte',
                        ),
                        const CategoryCard(
                          SvgSrc: '',
                          title: 'Identification',
                        ),
                        const CategoryCard(
                          SvgSrc: '',
                          title: 'Journal d\'activité',
                        ),
                        const CategoryCard(
                          SvgSrc: '',
                          title: 'Synchro',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final String SvgSrc;
  final String title;

  const CategoryCard({
    Key? key,
    // ignore: non_constant_identifier_names
    required this.SvgSrc,
    required this.title,
  }) : super(key: key);

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: const [
            BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 17,
                spreadRadius: -23,
                color: Colors.white)
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const Spacer(),
                  SvgPicture.asset(widget.SvgSrc),
                  const Spacer(),
                  Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontSize: 15),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isSwitched = false;
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Oflutter.com'),
            accountEmail: Text('example@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => null,
          ),

        ],
      ),
    );
  }
}
