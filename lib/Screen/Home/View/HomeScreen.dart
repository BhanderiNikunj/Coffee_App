import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page/Screen/Home/Provider/HomeScreenProvider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<HomeScreenProvider>(context, listen: false).CheckName();
  }

  HomeScreenProvider? homeScreenProviderTrue;
  HomeScreenProvider? homeScreenProviderFalse;

  @override
  Widget build(BuildContext context) {
    homeScreenProviderFalse =
        Provider.of<HomeScreenProvider>(context, listen: false);
    homeScreenProviderTrue =
        Provider.of<HomeScreenProvider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Welcome to ${homeScreenProviderFalse!.Name}",
            style: GoogleFonts.libreFranklin(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Are You Sure For Logout"),
                    actions: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "No",
                            style: GoogleFonts.libreFranklin(
                              color: Color(0xff491716),
                              fontSize: 15,
                            ),
                          ),
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Color(0xffA48B8B),
                            border: Border.all(
                              color: Color(0xff491716),
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, 'login');
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Yes",
                            style: GoogleFonts.libreFranklin(
                              color: Color(0xff491716),
                              fontSize: 15,
                            ),
                          ),
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Color(0xffA48B8B),
                            border: Border.all(
                              color: Color(0xff491716),
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              child: Icon(
                Icons.logout,
                color: Colors.black,
              ),
            ),
          ],
          elevation: 0,
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: Colors.white,
                title: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Search Your Coffee",
                    suffixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ];
          },
          body: Column(
            children: [
              SizedBox(height: 20),
              Container(
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 150,
                              width: 200,
                              child: Image.asset(
                                "${homeScreenProviderFalse!.CoffeeImage[index]}",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              "${homeScreenProviderFalse!.CoffeeName[index]}",
                              style: GoogleFonts.libreFranklin(
                                color: Color(0xff491716),
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                            Text(
                              "${homeScreenProviderFalse!.CoffeePrice[index]}",
                              style: GoogleFonts.libreFranklin(
                                color: Color(0xff491716),
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: homeScreenProviderFalse!.CoffeeImage.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
