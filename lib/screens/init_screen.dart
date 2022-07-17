import 'package:flutter/material.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({Key? key}) : super(key: key);

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  Color _backGround = Color(0xff003399);
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(child: Container(child: _body())),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 10, right: 4),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                          height: 30,
                          width: 30,
                          child: Image.asset('assets/images/Logo_set1.png')),
                      SizedBox(
                        width: 6,
                      ),
                      Text('Home',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff566559),
                              fontFamily: "Exo 2",
                              fontWeight: FontWeight.w500))
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: GestureDetector(
                        onTap: () {},
                        child: Image.asset('assets/images/Vector.png')),
                  )
                ],
              ),
              SizedBox(
                height: 6,
              ),
              Container(
                  // padding: EdgeInsets.only(left: 10),
                  child: Text('Good news !',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff253334).withOpacity(0.7),
                        fontFamily: "Exo 2",
                      ))),
              Container(
                // padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Nam',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff253334),
                    fontFamily: "Exo 2",
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 12, right: 6),
                padding: EdgeInsets.symmetric(vertical: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff253334)),
                child: Column(
                  children: [
                    Text(
                      'Account balance ',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xffD6B483),
                        fontFamily: "Exo 2",
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '€1,879.69',
                      style: TextStyle(
                          fontSize: 40,
                          // fontStyle: FontStyle.normal,
                          color: Colors.white,
                          fontFamily: "Exo 2",
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '+ €132.16',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xffD6B483),
                            fontFamily: "Exo 2",
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'last month',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xffD6B483),
                            fontFamily: "Exo 2",
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Markets',
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff566559),
                        fontFamily: "Exo 2",
                        fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: [
                      Text(
                        'View all',
                        style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff566559),
                            fontFamily: "Exo 2",
                            fontWeight: FontWeight.w600),
                      ),
                      Icon(Icons.keyboard_arrow_right)
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: AlwaysScrollableScrollPhysics(),
                      child: iTEMPLATE(),
                    ),
                  ),
                ],
              )
            ]),
      ),
    );
  }

  Widget iTEMPLATE() {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 70, horizontal: 50),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.amberAccent),
        child: Column(
          children: [Row(children: [])],
        ));
  }
}
