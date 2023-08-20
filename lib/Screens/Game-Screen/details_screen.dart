import 'package:flutter/material.dart';
import 'package:gamaru_mobile_app/Componants/glossyEffect.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: BackButton(
          color: Colors.white,
        ),
        title: Text(
          "BGMI SQUAD MATCH",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(color: Colors.transparent),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SizedBox(
                //   height: 35,
                // ),
                Container(
                  height: Get.height * .25,
                  width: Get.width,
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage("Assets/BGMI_details_page.png"),
                  ),
                ),

                Container(
                  height: Get.height * .06,
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15))),
                  child: Center(
                    child: Text(
                      "About this match",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 190, bottom: 5, top: 15),
                  child: Card(
                    color: Colors.white,
                    child: Center(
                      child: Text(
                        "IMPORTANT RULES",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Padding(
                      //   padding: EdgeInsets.only(top: 8.0, left: 8.0),
                      //   child: Text(
                      //     "1. Cheating and Hacking:",
                      //     style: TextStyle(
                      //         color: Colors.red,
                      //         fontSize: 16,
                      //         fontWeight: FontWeight.bold),
                      //   ),
                      // ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "1. Strictly forbidden any form of cheating, hacking, or using unauthorized software to gain an unfair advantage. This includes wall hacks, aimbots, and any other hacks that compromise the integrity of the game",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),

                      // ----------------------------------------------------------------

                      // Padding(
                      //   padding: EdgeInsets.only(top: 8.0, left: 8.0),
                      //   child: Text(
                      //     "2. Inflammatory or Offensive Content: ",
                      //     style: TextStyle(
                      //         color: Colors.red,
                      //         fontSize: 16,
                      //         fontWeight: FontWeight.bold),
                      //   ),
                      // ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "2. Prohibit the use of offensive, racist, sexist, or any other inappropriate language, behavior, or content during the event. Maintain a respectful & inclusive environment for all participants.",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),

                      //--------------------------------------------------------------------

                      // Padding(
                      //   padding: EdgeInsets.only(top: 8.0, left: 8.0),
                      //   child: Text(
                      //     "3. Unsportsmanlike Behavior:",
                      //     style: TextStyle(
                      //         color: Colors.red,
                      //         fontSize: 16,
                      //         fontWeight: FontWeight.bold),
                      //   ),
                      // ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "3. Discourage unsportsmanlike behavior such as taunting opponents, insulting or harassing fellow players, or engaging in any disruptive actions that negatively impact the gaming experience.",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),

                      //------------------------------------------------------------------

                      // Padding(
                      //   padding: EdgeInsets.only(top: 8.0, left: 8.0),
                      //   child: Text(
                      //     "4. Collusion or Match-Fixing:",
                      //     style: TextStyle(
                      //         color: Colors.red,
                      //         fontSize: 16,
                      //         fontWeight: FontWeight.bold),
                      //   ),
                      // ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "4. Strictly disallow any form of collusion or match-fixing among participants. Every game should be played with genuine effort and intent to win.",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),

                      //-----------------------------------------------------------------------

                      // Padding(
                      //   padding: EdgeInsets.only(top: 8.0, left: 8.0),
                      //   child: Text(
                      //     "5. Unauthorized Prizes or Rewards:",
                      //     style: TextStyle(
                      //         color: Colors.red,
                      //         fontSize: 16,
                      //         fontWeight: FontWeight.bold),
                      //   ),
                      // ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "5. Ensure that all prizes, rewards, or giveaways provided during the event are legitimate, and that there is no false advertisement or misrepresentation of the rewards.",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),

                      //--------------------------------------------------------------------

                      // Padding(
                      //   padding: EdgeInsets.only(top: 8.0, left: 8.0),
                      //   child: Text(
                      //     "6. Underage Gambling and Restrictions:",
                      //     style: TextStyle(
                      //         color: Colors.red,
                      //         fontSize: 16,
                      //         fontWeight: FontWeight.bold),
                      //   ),
                      // ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "6. If the event involves gambling mechanics, ensure that it is compliant with legal regulations and age restrictions. Do not encourage underage participants to engage in any form of gambling.",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),

                      //---------------------------------------------------------------

                      // Padding(
                      //   padding: EdgeInsets.only(top: 8.0, left: 8.0),
                      //   child: Text(
                      //     "7. Exploiting Vulnerabilities:",
                      //     style: TextStyle(
                      //         color: Colors.red,
                      //         fontSize: 16,
                      //         fontWeight: FontWeight.bold),
                      //   ),
                      // ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "7. Prohibit participants from exploiting glitches, bugs, or vulnerabilities within the game to gain an unfair advantage. Report such issues to the game developers for resolution.",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),

                      //---------------------------------------------------------------

                      // Padding(
                      //   padding: EdgeInsets.only(top: 8.0, left: 8.0),
                      //   child: Text(
                      //     "8. Privacy Violations:",
                      //     style: TextStyle(
                      //         color: Colors.red,
                      //         fontSize: 16,
                      //         fontWeight: FontWeight.bold),
                      //   ),
                      // ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "8. Respect the privacy of participants by not sharing personal information without explicit consent. Avoid any form of doxxing or harassment.",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),

                      //---------------------------------------------------------------

                      // Padding(
                      //   padding: EdgeInsets.only(top: 8.0, left: 8.0),
                      //   child: Text(
                      //     "9. Unverified Source Code or Modifications:",
                      //     style: TextStyle(
                      //         color: Colors.red,
                      //         fontSize: 16,
                      //         fontWeight: FontWeight.bold),
                      //   ),
                      // ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "9. Do not allow participants to use modified game code or unauthorized mods that could compromise the security of the game or provide an unfair advantage.",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),

                      //---------------------------------------------------------------
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
