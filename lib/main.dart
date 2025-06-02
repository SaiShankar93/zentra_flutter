import 'package:flutter/material.dart';
import 'dart:ui';

void main() {
  runApp(RealityVerseApp());
}

class RealityVerseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RealityVerse',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.transparent,
        colorScheme: ColorScheme.dark(
          primary: Colors.blueAccent,
          secondary: Colors.purpleAccent,
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            color: Colors.white70,
            fontFamily: 'Montserrat',
          ),
          titleLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Montserrat',
            letterSpacing: 1.2,
          ),
        ),
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  final Map<String, dynamic> profile = {
    'name': 'Arshad Aman',
    'avatar': 'https://randomuser.me/api/portraits/men/1.jpg',
    'posts': 32,
    'followers': 1200,
    'following': 180,
    'level': 7,
    'xp': 340,
    'xpMax': 500,
    'streak': 5,
    'badges': [
      Icons.emoji_events,
      Icons.star,
      Icons.local_fire_department,
    ],
  };

  final List<Map<String, dynamic>> stories = [
    {
      'name': 'You',
      'avatar': 'https://randomuser.me/api/portraits/men/1.jpg',
      'live': true,
    },
    {
      'name': 'Alice',
      'avatar': 'https://randomuser.me/api/portraits/women/2.jpg',
      'live': false,
    },
    {
      'name': 'Bob',
      'avatar': 'https://randomuser.me/api/portraits/men/3.jpg',
      'live': true,
    },
    {
      'name': 'Eve',
      'avatar': 'https://randomuser.me/api/portraits/women/4.jpg',
      'live': false,
    },
    {
      'name': 'Sam',
      'avatar': 'https://randomuser.me/api/portraits/men/5.jpg',
      'live': false,
    },
  ];

  final List<Map<String, String>> posts = [
    {
      'user': 'Alice',
      'avatar': 'https://randomuser.me/api/portraits/women/2.jpg',
      'image': 'https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=800&q=80',
      'caption': 'Exclusive sunset vibes 🌅',
      'locked': 'true',
    },
    {
      'user': 'Bob',
      'avatar': 'https://randomuser.me/api/portraits/men/3.jpg',
      'image': 'https://images.unsplash.com/photo-1465101046530-73398c7f28ca?auto=format&fit=crop&w=800&q=80',
      'caption': 'Adventure behind the scenes!',
      'locked': 'false',
    },
    {
      'user': 'Eve',
      'avatar': 'https://randomuser.me/api/portraits/women/4.jpg',
      'image': 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?auto=format&fit=crop&w=800&q=80',
      'caption': 'City lights ✨',
      'locked': 'true',
    },
  ];

  @override
  Widget build(BuildContext context) {
    double xpPercent = profile['xp'] / profile['xpMax'];
    return Stack(
      children: [
        // Gradient background
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF23243B),
                Color(0xFF0F0F1E),
                Color(0xFF3A1C71),
                Color(0xFFD76D77),
                Color(0xFFFFAF7B),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              'RealityVerse',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                fontSize: 26,
                letterSpacing: 1.5,
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(Icons.leaderboard, color: Colors.amberAccent),
                tooltip: "Leaderboard",
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.notifications_none, color: Colors.white),
                onPressed: () {},
                tooltip: "Notifications",
              ),
            ],
          ),
          body: ListView(
            padding: const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 0),
            children: [
              // Profile Header with gamification
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                child: GlassmorphicCard(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 18),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 38,
                              backgroundImage: NetworkImage(profile['avatar']),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 2),
                              ),
                              padding: EdgeInsets.all(6),
                              child: Text(
                                'Lv${profile['level']}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 18),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    profile['name'],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 21,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(width: 8),
                                  Icon(Icons.local_fire_department, color: Colors.orangeAccent, size: 20),
                                  Text(
                                    ' ${profile['streak']}d',
                                    style: TextStyle(
                                      color: Colors.orangeAccent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              // XP Progress Bar
                              Stack(
                                children: [
                                  Container(
                                    height: 8,
                                    decoration: BoxDecoration(
                                      color: Colors.white12,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  FractionallySizedBox(
                                    widthFactor: xpPercent,
                                    child: Container(
                                      height: 8,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [Colors.blueAccent, Colors.purpleAccent],
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 6),
                              Row(
                                children: [
                                  Text(
                                    '${profile['xp']} XP',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12,
                                      fontFamily: 'Montserrat',
                                    ),
                                  ),
                                  Spacer(),
                                  Row(
                                    children: List.generate(
                                      profile['badges'].length,
                                      (i) => Padding(
                                        padding: const EdgeInsets.only(left: 6),
                                        child: Icon(
                                          profile['badges'][i],
                                          color: Colors.amberAccent,
                                          size: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  _profileStat('Posts', profile['posts'].toString()),
                                  _profileStat('Followers', profile['followers'].toString()),
                                  _profileStat('Following', profile['following'].toString()),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                            elevation: 0,
                          ),
                          onPressed: () {},
                          icon: Icon(Icons.add, color: Colors.white, size: 18),
                          label: Text(
                            'New Post',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Stories Row
              Container(
                height: 98,
                margin: EdgeInsets.only(left: 10, right: 0, top: 0, bottom: 14),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  itemCount: stories.length,
                  separatorBuilder: (_, __) => SizedBox(width: 18),
                  itemBuilder: (context, index) {
                    final story = stories[index];
                    return Column(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.18),
                                    blurRadius: 8,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                                gradient: story['live'] == true
                                    ? LinearGradient(
                                        colors: [Colors.redAccent, Colors.orangeAccent],
                                      )
                                    : LinearGradient(
                                        colors: [Colors.blueAccent, Colors.purpleAccent],
                                      ),
                              ),
                              padding: EdgeInsets.all(3),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 27,
                                  backgroundImage: NetworkImage(story['avatar']!),
                                ),
                              ),
                            ),
                            if (story['live'] == true)
                              Positioned(
                                bottom: 2,
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: Colors.redAccent,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.redAccent.withOpacity(0.3),
                                        blurRadius: 6,
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    'LIVE',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                      fontFamily: 'Montserrat',
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        SizedBox(height: 7),
                        Text(
                          story['name']!,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              // Gamified daily streak and rewards
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: GlassmorphicCard(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
                    child: Row(
                      children: [
                        Icon(Icons.local_fire_department, color: Colors.orangeAccent, size: 28),
                        SizedBox(width: 10),
                        Text(
                          "Daily Streak: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "${profile['streak']} days",
                          style: TextStyle(
                            color: Colors.orangeAccent,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.card_giftcard, color: Colors.amberAccent, size: 28),
                        SizedBox(width: 6),
                        Text(
                          "Claim",
                          style: TextStyle(
                            color: Colors.amberAccent,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Posts Feed
              ...posts.map((post) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                child: GlassmorphicCard(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(post['avatar']!),
                              radius: 24,
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                post['user']!,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                  fontSize: 16,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            if (post['locked'] == 'true') ...[
                              SizedBox(width: 8),
                              ConstrainedBox(
                                constraints: BoxConstraints(maxWidth: 110),
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.purpleAccent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                    elevation: 0,
                                    minimumSize: Size(0, 36),
                                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  onPressed: () {},
                                  icon: Icon(Icons.lock, size: 16, color: Colors.white),
                                  label: Text(
                                    'Unlock',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    softWrap: false,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                        SizedBox(height: 10),
                        // Post image (blurred if locked)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Stack(
                            children: [
                              Image.network(
                                post['image']!,
                                height: 220,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                color: post['locked'] == 'true'
                                    ? Colors.black.withOpacity(0.5)
                                    : null,
                                colorBlendMode: post['locked'] == 'true'
                                    ? BlendMode.darken
                                    : null,
                              ),
                              if (post['locked'] == 'true')
                                Positioned.fill(
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                                    child: Container(
                                      color: Colors.black.withOpacity(0.2),
                                      alignment: Alignment.center,
                                      child: Icon(Icons.lock, color: Colors.white70, size: 48),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        // Caption
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
                          child: Text(
                            post['caption']!,
                            style: TextStyle(
                              color: Colors.white70,
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
              SizedBox(height: 28),
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              // TODO: Implement Go Live functionality
            },
            backgroundColor: Colors.redAccent,
            icon: Icon(Icons.videocam_rounded, color: Colors.white),
            label: Text(
              'Go Live',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black.withOpacity(0.85),
            selectedItemColor: Colors.blueAccent,
            unselectedItemColor: Colors.white54,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.emoji_events_rounded), label: 'Achievements'),
              BottomNavigationBarItem(icon: Icon(Icons.notifications_none_rounded), label: 'Notifications'),
              BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: 'Profile'),
            ],
            currentIndex: 0,
            onTap: (i) {
              // TODO: Handle navigation
            },
          ),
        ),
      ],
    );
  }

  Widget _profileStat(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(right: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
              fontSize: 15,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              color: Colors.white54,
              fontFamily: 'Montserrat',
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class GlassmorphicCard extends StatelessWidget {
  final Widget child;
  const GlassmorphicCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.09),
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: Colors.white.withOpacity(0.16),
              width: 1.2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.13),
                blurRadius: 16,
                offset: Offset(0, 6),
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}