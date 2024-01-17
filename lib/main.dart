import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_svg/flutter_svg.dart';


final player=AudioPlayer()..setReleaseMode(ReleaseMode.loop);

void main()=>runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final tabs=[
    screen1(),
    screen2(),
    screen3(),
    screen4(),
  ];

  int previousIndex=0;
  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    if (currentIndex==0) player.play(AssetSource("1.mp3"));
    return MaterialApp(
      title: '我的自傳',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,),
      home: Scaffold(
        appBar: AppBar(title: Text('我的自傳'),),
        body: tabs[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          selectedFontSize: 18,
          unselectedFontSize: 14,
          iconSize: 30,
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),label:'自我介紹',),
            BottomNavigationBarItem(icon: Icon(Icons.school), label:'學習歷程',),
            BottomNavigationBarItem(icon: Icon(Icons.schedule_outlined), label:'學習計畫',),
            BottomNavigationBarItem(icon: Icon(Icons.engineering), label:'專業方向',),
          ],
          onTap: (index) {
            setState(() {
              previousIndex=currentIndex;
              currentIndex=index;
              if (index==0) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('1.mp3'));
              }
              if (index==1) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('2.mp3'));
              }
              if (index==2) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('3.mp3'));
              }
              if (index==3) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('4.mp3'));
              }
            });
          },
        ),
      ),
    );
  }
}

class screen1 extends StatelessWidget {

  final String s1='        我出生在一個很平凡但很美滿的小家庭，父親是個電機工程師，在大陸工作，母親是個家庭主婦，而我有兩個妹妹和我都還在學校求學。父母用民主的方式管教我們，希望我們能夠獨立自主、主動學習，累積人生經驗，但他們會適時的給予鼓勵和建議，父母親只對我們要求兩件事，第一是保持健康，第二是著重課業。因為沒有健康的身體，就算有再多的才華、再大的抱負也無法發揮出來。又因為希望我們今後能過得好，所以要我們專心於課業上，學得一技之長，將來才能自立更生。'
      '在小學時代的我比較內向，平時都待在教室，而在課業上表現不錯，除了擔任過小老師外，還參加糾察隊，並保持著中上的成績。'
      '小學畢業後，進入了一所國立中學，雖然沒甚麼變化，不過在那裡我學會了許多應有的禮節與待人處世的道理。在國中時期的我，保持著成績，並有了想做遊戲的夢想。'
      '進高工後，每天都覺得很充實、很快樂。高工特色是能吸取更多專業的知識，所以我不斷地努力學習，希望能夠達到夢想。在課業方面，我都能保持在一定的水準，因為上課專心聽講、仔細思考、體會老師所說的每一句話，在腦海裡架構重要觀念，一有問題就立刻發問，因此上課的吸收效率很高，使得複習的工作能夠很快完成，而有辦法去習得其他知識。在這麼多的科目當中，我最喜歡的是數學，因為數學能使我獲得解題的快樂。';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //放標題
          Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Text('Who am I', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
          ),
          //自傳部份
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.fromLTRB(30, 0, 30, 50),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width:3),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(color: Colors.amberAccent, offset: Offset(6, 6)),
              ],
            ),
            child: Text(s1, style: TextStyle(fontSize: 20)),
          ),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}

class screen2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        ListView(
          children: [
            LearningCard(
              title: '高中時期',
              description:
              '探索遊戲開發激發我對編程的濃厚興趣。挑戰複雜問題、設計互動體驗，深入學習程式邏輯及軟體開發，啟發了我對這個領域的深厚熱情。',
              imagePath: 'assets/images/high_school.svg',
            ),
            LearningCard(
              title: '大學生活',
              description:
              '投入學習基礎資訊科學及數學，深度研究多種程式語言，逐步建立堅實的理論基礎。透過探索，擴展對程式設計世界的認知，奠定深厚技術基礎。',
              imagePath: 'assets/images/university.svg',
            ),
            LearningCard(
              title: '專業領域',
              description:
              '拓展學習領域，深入研究資料結構、演算法、資料庫管理，以及網路技術。積極探索不同範疇，擴充對計算機科學的知識與應用，培養多元技能。',
              imagePath: 'assets/images/professional.svg',
            ),
            LearningCard(
              title: '技術社群',
              description:
              '積極參與專題製作，擴展視野，透過與同儕學生深入交流，分享想法。這種協作經驗不僅豐富了我的視野，也促進了彼此的專業成長。',
              imagePath: 'assets/images/community.svg',
            ),
          ],
        )
    );
  }
}
class LearningCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const LearningCard({
    Key? key,
    required this.title,
    required this.description,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(description),
            SizedBox(height: 10),
            SvgPicture.asset(
              imagePath,
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

class screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('大一時期'),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 150,
              width: 200,
              child: ListView(
                children: [
                  Text('1. 學好英文'),
                  Text('2. 組合語言'),
                  Text('3. 考取證照'),
                  Text('4. 人際關係'),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('大二時期'),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 150,
              width: 200,
              child: ListView(
                children: [
                  Text('1. 學好英文'),
                  Text('2. C#,python'),
                  Text('3. 人際關係'),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('大三時期'),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 150,
              width: 200,
              child: ListView(
                children: [
                  Text('1. 達到畢業所需多益門檻'),
                  Text('2. 資料庫'),
                  Text('3. 人際關係'),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('大四時期'),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 150,
              width: 200,
              child: ListView(
                children: [
                  Text('1. 準備研究所'),
                  Text('2. 人際關係'),
                ],
              ),
            ),
          ],
        ),
      ],),
    );
  }
}
class screen4 extends StatelessWidget {
  final String s4 = '對於成為遊戲工程師的夢想，我展開了多方面的努力。首先，我投入大量時間學習程式語言，如C++和Java，並深入研究遊戲開發框架，例如Unity和Unreal Engine。這不僅擴展了我的技術知識，也讓我能夠理解並應用複雜的遊戲邏輯。'

      '同時，我深入了解資料結構和演算法，以提高遊戲性能和處理大量數據的能力。我參與了各種遊戲開發專案，從小型遊戲到更複雜的模擬器，以實際應用我的知識。'

      '為了更好地了解遊戲設計和使用者體驗，我參與了許多遊戲測試和評估活動。這讓我能夠深入了解玩家的需求，並提高我的設計感和創造力。'

      '我也積極參與相關社群和遊戲開發活動，與其他遊戲愛好者和專業人士建立聯繫。參與遊戲開發社群讓我能夠分享我的經驗，同時從他人的經驗中學到更多。'

      '總的來說，我以不斷學習、參與實際專案、深化技術知識和積極參與社群的方式，努力實現成為遊戲工程師的目標。我深信這樣的努力將為我未來的遊戲開發生涯奠定穩固的基礎。';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //放標題
          Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Text('未來方向', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
          ),
          //自傳部份
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.fromLTRB(30, 0, 30, 50),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width:3),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(color: Colors.amberAccent, offset: Offset(6, 6)),
              ],
            ),
            child: Text(s4, style: TextStyle(fontSize: 20)),
          ),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}
