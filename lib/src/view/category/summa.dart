import 'package:cliveott/utils/common_function/siginin_button.dart';
import 'package:cliveott/utils/responsive.dart';
import 'package:flutter/material.dart';


import '../../../utils/colors.dart';
 


class ProfessionalDetails extends StatefulWidget {
  const ProfessionalDetails({super.key});


  @override
  State<ProfessionalDetails> createState() => _ProfessionalDetailsState();
}


class _ProfessionalDetailsState extends State<ProfessionalDetails> {
  var _selectedGender;
  var genderlist = ['male', 'female', 'I dont know'];
  var newteredlist = ['no', 'yes', 'I dont know'];
  var selectedindex = 0;
  var newteredindex = 0;
  var foodindex = 0;
  var energyindex = 0;
  var bodytypeindex = 0;
  var petfood = [
    'Commercial food',
    'Fresh or uncooked food',
    'Home & Cooked food',
    'Doctor_approch food'
  ];
  var energylevel = ['Energetic', 'Moderately active', 'Inactive'];
  var bodytype = [
    'Lean and Toned',
    'Obese',
    'Athetic and Strong',
    'Carrying some extra weight'
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/background.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20.0, top: 5),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  AssetImage('assets/images/profile.jpg'),
                            ),
                            Container(
                              height: 7.0.hp,
                              width: 70.0.wp,
                              decoration: BoxDecoration(
                                  color: screenbackground,
                                  borderRadius: BorderRadius.circular(5)),
                              child: ListTile(
                                leading: Icon(Icons.camera_alt_outlined),
                                title: Text('Change your picture'),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 3.0.hp,
                        ),
                        Container(
                          height: 8.00.hp,
                          width: 200.00.wp,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: screenbackground,
                          ),
                          child: Wrap(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 10.0,
                                ),
                                child: Text(
                                  'User Name',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              TextFormField(
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  //  label: Text('Search breed name'),
                                  hintText: 'Masters',
                                  hintStyle: TextStyle(color: black),
                                  contentPadding: const EdgeInsets.only(
                                    left: 10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.0.hp,
                        ),
                        Container(
                          height: 8.00.hp,
                          width: 200.00.wp,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: screenbackground,
                          ),
                          child: Wrap(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 10.0,
                                ),
                                child: Text(
                                  'Masters in',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              TextFormField(
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  //  label: Text('Search breed name'),
                                  hintText: 'Veterian Science',
                                  hintStyle: TextStyle(color: black),
                                  contentPadding: const EdgeInsets.only(
                                    left: 10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.0.hp,
                        ),
                        Container(
                          height: 8.00.hp,
                          width: 200.00.wp,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: screenbackground,
                          ),
                          child: Wrap(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10.0, top: 0),
                                child: Text(
                                  'Register Number',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              TextFormField(
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  //  label: Text('Search breed name'),
                                  hintText: '7021758244',
                                  hintStyle: TextStyle(color: black),
                                  contentPadding: const EdgeInsets.only(
                                    left: 10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.0.hp,
                        ),
                        Container(
                          height: 8.00.hp,
                          width: 200.00.wp,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: screenbackground,
                          ),
                          child: Wrap(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10.0, top: 0),
                                child: Text(
                                  'Your Phone number',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              TextFormField(
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  //  label: Text('Search breed name'),
                                  hintText: '+91 9865741235',
                                  hintStyle: TextStyle(color: black),
                                  contentPadding: const EdgeInsets.only(
                                    left: 10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.0.hp,
                        ),
                        Container(
                          height: 8.00.hp,
                          width: 200.00.wp,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: screenbackground,
                          ),
                          child: Wrap(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10.0, top: 0),
                                child: Text(
                                  'Years of Experience',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              TextFormField(
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  //  label: Text('Search breed name'),
                                  hintText: '7',
                                  hintStyle: TextStyle(color: black),
                                  contentPadding: const EdgeInsets.only(
                                    left: 10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.0.hp,
                        ),
                        ButtonIconButton(
                            text: 'SAVE CHANGES',
                            bordercolor: Colors.blue,
                            press: () {})
                      ])))),
    );
  }
}
