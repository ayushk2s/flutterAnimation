import 'dart:math';
import 'package:flutter/material.dart';

class Containercolorchange extends StatefulWidget {
  @override
  State<Containercolorchange> createState() => _containerColorChangeState();
}

class _containerColorChangeState extends State<Containercolorchange> {
  List<Color> _differentColor = colorChange();
  List<String> newWord = generateRandomWords(5);

  static List<Color> colorChange() {
    final random = Random();
    return List.generate(
      5,
      (_) => Color.fromRGBO(
        random.nextInt(226),
        random.nextInt(226),
        random.nextInt(226),
        1,
      ),
    );
  }

  static List<String> generateRandomWords(int count) {
    final random = Random();
    final words = [
      'Achieve', 'Ambition', 'Aspire', 'Believe', 'Bravery', 'Challenge',
      'Commitment', 'Confidence', 'Courage', 'Create', 'Dedication',
      'Determination', 'Discipline', 'Dream', 'Drive', 'Effort', 'Empower',
      'Endurance', 'Energy', 'Enthusiasm', 'Excellence', 'Faith', 'Focus',
      'Freedom', 'Fulfillment', 'Goal', 'Growth', 'Hardwork', 'Hope', 'Hustle',
      'Impact', 'Improve', 'Inspire', 'Integrity', 'Journey', 'Joy',
      'Leadership', 'Learning', 'Mastery', 'Mindset', 'Mission', 'Motivation',
      'Optimism', 'Overcome', 'Passion', 'Patience', 'Perseverance',
      'Positivity', 'Potential', 'Power', 'Progress', 'Purpose', 'Resilience',
      'Resolve', 'Respect', 'Sacrifice', 'Self-belief', 'Self-care',
      'Self-discipline', 'Self-esteem', 'Self-improvement', 'Self-motivation',
      'Spirit', 'Strength', 'Success', 'Support', 'Tenacity', 'Thrive',
      'Triumph', 'Trust', 'Unstoppable', 'Victory', 'Vision', 'Willpower',
      'Wisdom', 'Zeal', 'Achievement', 'Adaptability', 'Adventure', 'Agility',
      'Balance', 'Boldness', 'Breakthrough', 'Collaboration', 'Compassion',
      'Creativity', 'Determined', 'Empowerment', 'Excellence', 'Faithful',
      'Fearless', 'Flourish', 'Gratitude', 'Happiness', 'Honesty',
      'Inspiration', 'Integrity', 'Kindness', 'Leadership', 'Momentum',
    ];

    return List.generate(count, (index) {
      final word = words[random.nextInt(words.length)];
      print(word);
      return word;
    });
  }

  @override
  void initState() {
    super.initState();
    stateChanging();
  }

  void stateChanging() {
    setState(() {
      _differentColor = colorChange();
      newWord = generateRandomWords(5);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size md = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                width: md.width * 0.2,
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return LayoutBuilder(
                      builder: (context, constraints) {
                        return AnimatedContainer(
                          duration: Duration(seconds: 1),
                          curve: Curves.easeInBack,
                          width: constraints.maxWidth / 2, // Set width to half of the available width
                          height: md.width / 5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: _differentColor[index],
                          ),
                          child: Center(
                            child: Text(
                              newWord[index],
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                stateChanging();
              },
              child: Text('Change'),
            ),
          ],
        ),
      ),
    );
  }
}
