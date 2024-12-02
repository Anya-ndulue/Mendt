import 'package:app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';

// Define colors
const Color primaryColor = Color(0xFF1BDD51);
const Color white = Colors.white;

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget buildPage({
    required String image,
    required String title,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 260,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: GoogleFonts.ubuntu(
              fontSize: 30,
              fontWeight: FontWeight.normal,
              color: primaryColor,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: GoogleFonts.ubuntu(
              textStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: onboardtext,
              ),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 600;

    return Scaffold(
      body: Stack(
        children: [
          // PageView for onboarding pages
          PageView(
            onPageChanged: (index) {
              setState(() => isLastPage = index == 3);
            },
            controller: controller,
            children: [
              buildPage(
                image: 'assets/bro.png',
                title: "Talk with a therapist",
                description:
                    "Book a professional therapist and share sessions with them online.",
              ),
              buildPage(
                image: 'assets/group.png',
                title: "Virtual diary",
                description:
                    "Keep a simple daily audio or text diary to track your mood.",
              ),
              buildPage(
                image: 'assets/rafiki.png',
                title: "Incognito chatrooms",
                description:
                    "Interact with others anonymously in a safe environment.",
              ),
              buildPage(
                image: 'assets/pana.png',
                title: "Listen to a podcast",
                description:
                    "Listen to and learn from the experiences of people.",
              ),
            ],
          ),
          // Overlay for dots and buttons
          Positioned(
            bottom: isSmallScreen ? 60 : 80,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Dots Indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    4,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: isSmallScreen ? 8 : 10,
                      height: isSmallScreen ? 8 : 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: controller.hasClients &&
                                controller.page?.round() == index
                            ? primaryColor
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Buttons positioned at the bottom
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Skip Button
                  TextButton(
                    onPressed: () {
                      controller.jumpToPage(3); // Skip to the last page
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  // Next or Done Button
                  TextButton(
                    onPressed: () {
                      if (isLastPage) {
                        // Navigate to the next screen on the last page
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      } else {
                        // Move to the next page
                        controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Text(
                      isLastPage ? 'DONE' : 'Next',
                      style: TextStyle(
                        color: black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // "Get Started" Button on the last page
          if (isLastPage)
            Positioned(
              bottom: 20,
              left: 16,
              right: 16,
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: white,
                  backgroundColor: primaryColor,
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setBool('saveUser', true);

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage ()),
                  );
                },
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
