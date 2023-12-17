import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/screens/auth_screen/logIn_screen.dart';
import 'package:onboarding/onboarding.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/screens/auth_screen/signUp_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late Material materialButton;
  late int index;
  final onBoardingPagesList = [
    PageModel(
      widget: DecoratedBox(
        decoration: const BoxDecoration(),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(16),
                  child: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text("CARIFY",
                        style: GoogleFonts.goldman(
                            fontSize: 35.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0XFF465C8D))),
                  )),
              Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 55.0.h,
                  ),
                  child: SvgPicture.asset('assets/on_boarding/pana.svg')),
              SizedBox(
                height: 12.h,
              ),
              Center(
                  child: Text(
                'Discovering Cars',
                textAlign: TextAlign.left,
                style: GoogleFonts.inter(
                    color: const Color(0XFF465C8D),
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w700),
              )),
              SizedBox(
                height: 12.h,
              ),
              Padding(
                  padding: const EdgeInsets.all(16),
                  child: Align(
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        'We guarantee that you will find the best car for your trip ',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0XFF727D85)),
                      ))),
              SizedBox(
                height: 12.h,
              ),
              Center(
                  child: InkWell(
                onTap: () {},
                child: Container(
                    width: 300.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                        color: const Color(0XFF465C8D),
                        borderRadius: BorderRadius.circular(16)),
                    child: Center(
                      child: Text(
                        "Next",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    )),
              )),
              const SizedBox(
                height: 12,
              )
            ],
          ),
        ),
      ),
    ),
    PageModel(
      widget: DecoratedBox(
        decoration: const BoxDecoration(),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(16),
                  child: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text("CARIFY",
                        style: GoogleFonts.goldman(
                            fontSize: 35.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0XFF465C8D))),
                  )),
              Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 55.0.h,
                  ),
                  child: SvgPicture.asset('assets/on_boarding/rafiki.svg')),
              SizedBox(
                height: 12.h,
              ),
              Center(
                  child: Text(
                'Uplode your car photo',
                textAlign: TextAlign.left,
                style: GoogleFonts.inter(
                    color: const Color(0XFF465C8D),
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w700),
              )),
              SizedBox(
                height: 12.h,
              ),
              Padding(
                  padding: const EdgeInsets.all(16),
                  child: Align(
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        'Now you can add your care here to see it other people,you can buy it on this app. ',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0XFF727D85)),
                      ))),
              SizedBox(
                height: 12.h,
              ),
              Center(
                  child: InkWell(
                onTap: () {},
                child: Container(
                    width: 300.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                        color: const Color(0XFF465C8D),
                        borderRadius: BorderRadius.circular(16)),
                    child: Center(
                      child: Text(
                        "Next",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    )),
              )),
              const SizedBox(
                height: 12,
              )
            ],
          ),
        ),
      ),
    ),
    PageModel(
      widget: DecoratedBox(
        decoration: const BoxDecoration(),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(16),
                  child: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text("CARIFY",
                        style: GoogleFonts.goldman(
                            fontSize: 35.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0XFF465C8D))),
                  )),
              Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 55.0.h,
                  ),
                  child: SvgPicture.asset('assets/on_boarding/bro.svg')),
              SizedBox(
                height: 12.h,
              ),
              Center(
                  child: Text(
                'Artificial Intelligence',
                textAlign: TextAlign.left,
                style: GoogleFonts.inter(
                    color: const Color(0XFF465C8D),
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w700),
              )),
              SizedBox(
                height: 12.h,
              ),
              Padding(
                  padding: const EdgeInsets.all(16),
                  child: Align(
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        'This App allow you to use AI to find cars by taking a picture of the car and upload it to the application.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0XFF727D85)),
                      ))),
              SizedBox(
                height: 12.h,
              ),
              // Center(
              //     child: InkWell(
              //   onTap: () {},
              //   child: Container(
              //       width: 300.w,
              //       height: 40.h,
              //       decoration: BoxDecoration(
              //           color: const Color(0XFF465C8D),
              //           borderRadius: BorderRadius.circular(16)),
              //       child: Center(
              //         child: Text(
              //           "Next",
              //           style: GoogleFonts.inter(
              //               fontWeight: FontWeight.w700,
              //               fontSize: 20,
              //               color: Colors.white),
              //         ),
              //       )),
              // )),
              const SizedBox(
                height: 12,
              )
            ],
          ),
        ),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    materialButton = _skipButton();
    index = 0;
  }

  Material _skipButton({void Function(int)? setIndex}) {
    return Material(
      child: InkWell(
        onTap: () {
          if (setIndex != null) {
            index = 2;
            setIndex(2);
          }
        },
        child: const Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            'Skip',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }

  Material get _signupButton {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LogInScreen(),
              ));
        },
        child: const Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            'Sign up',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Onboarding(
        pages: onBoardingPagesList,
        onPageChange: (int pageIndex) {
          index = pageIndex;
        },
        startPageIndex: 0,
        footerBuilder: (context, dragDistance, pagesLength, setIndex) {
          return DecoratedBox(
            decoration: const BoxDecoration(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomIndicator(
                    netDragPercent: dragDistance,
                    pagesLength: pagesLength,
                    indicator: Indicator(
                      indicatorDesign: IndicatorDesign.line(
                        lineDesign: LineDesign(
                          lineType: DesignType.line_uniform,
                        ),
                      ),
                    ),
                  ),
                  index == pagesLength - 1
                      ? _signupButton
                      : _skipButton(setIndex: setIndex)
                ],
              ),
            ),
          );
          // );
        },
      ),
    ));
    // ,
    // );
  }
}
