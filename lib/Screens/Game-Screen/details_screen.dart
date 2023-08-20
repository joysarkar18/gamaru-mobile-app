import 'package:flutter/material.dart';
import 'package:gamaru_mobile_app/Componants/glossyEffect.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          decoration: const BoxDecoration(color: Colors.transparent),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Text(
                  "About this match",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 190, bottom: 15, top: 20),
                child: Text(
                  "IMPORTANT RULES",
                  style: TextStyle(color: Colors.green, fontSize: 20),
                ),
              ),
              GlossyCard(
                height: Get.height * .8,
                width: Get.width * .95,
                borderRadius: 10.0,
                borderWith: 2.0,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 8.0, left: 8.0),
                        child: Text(
                          "1. Cheating and Hacking:",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Strictly forbidden any form of cheating, hacking, or using unauthorized software to gain an unfair advantage. This includes wall hacks, aimbots, and any other hacks that compromise the integrity of the game",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),

                      // ------------------------------------------------------------

                      Padding(
                        padding: EdgeInsets.only(top: 8.0, left: 8.0),
                        child: Text(
                          "2. Inflammatory or Offensive Content: ",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Prohibit the use of offensive, racist, sexist, or any other inappropriate language, behavior, or content during the event. Maintain a respectful & inclusive environment for all participants.",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),

                      //--------------------------------------------------------------------

                      Padding(
                        padding: EdgeInsets.only(top: 8.0, left: 8.0),
                        child: Text(
                          "3. Unsportsmanlike Behavior:",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Discourage unsportsmanlike behavior such as taunting opponents, insulting or harassing fellow players, or engaging in any disruptive actions that negatively impact the gaming experience.",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),

                      //------------------------------------------------------------------

                      Padding(
                        padding: EdgeInsets.only(top: 8.0, left: 8.0),
                        child: Text(
                          "4. Collusion or Match-Fixing:",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Strictly disallow any form of collusion or match-fixing among participants. Every game should be played with genuine effort and intent to win.",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),

                      //-----------------------------------------------------------------------

                      Padding(
                        padding: EdgeInsets.only(top: 8.0, left: 8.0),
                        child: Text(
                          "5. Unauthorized Prizes or Rewards:",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Ensure that all prizes, rewards, or giveaways provided during the event are legitimate, and that there is no false advertisement or misrepresentation of the rewards.",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),

                      //--------------------------------------------------------------------

                      Padding(
                        padding: EdgeInsets.only(top: 8.0, left: 8.0),
                        child: Text(
                          "6. Underage Gambling and Restrictions:",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "If the event involves gambling mechanics, ensure that it is compliant with legal regulations and age restrictions. Do not encourage underage participants to engage in any form of gambling.",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),

                      //---------------------------------------------------------------

                      Padding(
                        padding: EdgeInsets.only(top: 8.0, left: 8.0),
                        child: Text(
                          "7. Exploiting Vulnerabilities:",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          " Prohibit participants from exploiting glitches, bugs, or vulnerabilities within the game to gain an unfair advantage. Report such issues to the game developers for resolution.",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),

                      //---------------------------------------------------------------

                      Padding(
                        padding: EdgeInsets.only(top: 8.0, left: 8.0),
                        child: Text(
                          "8. Privacy Violations:",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Respect the privacy of participants by not sharing personal information without explicit consent. Avoid any form of doxxing or harassment.",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),

                      //---------------------------------------------------------------

                      Padding(
                        padding: EdgeInsets.only(top: 8.0, left: 8.0),
                        child: Text(
                          "9. Unverified Source Code or Modifications:",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Do not allow participants to use modified game code or unauthorized mods that could compromise the security of the game or provide an unfair advantage.",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),

                      //---------------------------------------------------------------
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
