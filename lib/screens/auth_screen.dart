import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:flutter/services.dart';

import 'init_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Color _backGround = Color(0xff003399);
  final LocalAuthentication _localAuth = LocalAuthentication();
  bool deviceSupported = false;
  @override
  void initState() {
    super.initState();
  }

  AndroidAuthMessages _androidAuthMessages() {
    return const AndroidAuthMessages(
        signInTitle: "Yêu cầu xác thực",
        biometricHint: "Kiểm tra danh tính",
        cancelButton: "Cancel");
  }

  Future<List<BiometricType>> _initBiometrics() async {
    deviceSupported = await _localAuth.isDeviceSupported();
    List<BiometricType> _availableBiometrics = <BiometricType>[];
    if (deviceSupported) {
      try {
        if (await _localAuth.canCheckBiometrics) {
          _availableBiometrics = await _localAuth.getAvailableBiometrics();
        }
        return _availableBiometrics;
      } catch (e) {
        return [];
      }
    }
    return [];
  }

  Future<void> _auth() async {
    bool authenticated = false;
    try {
      authenticated = await _localAuth.authenticate(
        androidAuthStrings: _androidAuthMessages(),
        localizedReason: 'Mở khóa để truy cập màn hình',
        useErrorDialogs: true,
        stickyAuth: true,
      );
      if (authenticated) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const InitScreen()));
      }
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> _authOnlyBiometrics() async {
    bool authenticated = false;
    try {
      authenticated = await _localAuth.authenticate(
        androidAuthStrings: _androidAuthMessages(),
        localizedReason: 'Mở khóa để truy cập màn hình',
        useErrorDialogs: true,
        stickyAuth: true,
        biometricOnly: true,
      );
      if (authenticated) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const InitScreen()));
      }
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff003399),
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: _backGround,
      title: Text(
        'Squid Game',
        style: TextStyle(
            fontFamily: 'Exo 2',
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white),
      ),
      leading: GestureDetector(
        onTap: () {
          // Navigator.of(context).pop();
        },
        child: Container(
          margin: EdgeInsets.only(left: 16, top: 8, bottom: 8),
          width: 14,
          height: 14,
          child: ImageIcon(
            AssetImage('assets/images/Logo_set.png'),
            size: 10,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Center(
      child: SingleChildScrollView(
        child: GestureDetector(
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Verification required",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontFamily: "Exo 2",
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Touch the fingerprint sensor",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontFamily: "Exo 2",
                          fontWeight: FontWeight.w700)),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xff3366FF)),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    // color: Colors.amber,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: (() async {
                              await _auth();
                            }),
                            child: Image.asset('assets/images/ic_finger.png')),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Fingerprint',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontFamily: "Exo 2",
                                fontWeight: FontWeight.w700))
                      ],
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
