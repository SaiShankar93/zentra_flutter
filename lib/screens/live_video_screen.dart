import 'package:flutter/material.dart';

class LiveVideoScreen extends StatefulWidget {
  const LiveVideoScreen({super.key});

  @override
  State<LiveVideoScreen> createState() => _LiveVideoScreenState();
}

class _LiveVideoScreenState extends State<LiveVideoScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> tabs = ['Main Stage', 'Backstage', 'Audience'];
  final List<Map<String, dynamic>> chatMessages = [
    {
      'user': 'Ethan',
      'avatar': 'https://randomuser.me/api/portraits/men/32.jpg',
      'message': ['This', 'is', 'insane!'],
      'isMe': false,
    },
    {
      'user': 'You',
      'avatar': 'https://randomuser.me/api/portraits/men/1.jpg',
      'message': ['I'],
      'isMe': true,
    },
    {
      'user': 'Sophia',
      'avatar': 'https://randomuser.me/api/portraits/women/44.jpg',
      'message': ['Best', 'concert', 'ever!'],
      'isMe': false,
    },
  ];
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF18151C),
      body: SafeArea(
        child: Column(
          children: [
            // AppBar with back button
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                const Spacer(),
              ],
            ),
            // Video preview with play button
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 220,
                  child: Image.network(
                    'https://images.unsplash.com/photo-1464983953574-0892a716854b?auto=format&fit=crop&w=800&q=80',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: Center(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.black45,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.play_circle, color: Colors.white, size: 72),
                    ),
                  ),
                ),
              ],
            ),
            // Tab bar
            Material(
              color: Colors.transparent,
              child: TabBar(
                controller: _tabController,
                indicatorColor: Colors.white,
                indicatorWeight: 3,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white54,
                labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, fontFamily: 'Montserrat'),
                unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal, fontSize: 18, fontFamily: 'Montserrat'),
                tabs: tabs.map((t) => Tab(text: t)).toList(),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _mainStageTab(context),
                  const Center(child: Text('Backstage', style: TextStyle(color: Colors.white54, fontSize: 20))),
                  const Center(child: Text('Audience', style: TextStyle(color: Colors.white54, fontSize: 20))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _mainStageTab(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        // Event info and stats
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const Text(
                'Live Concert',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  fontFamily: 'Montserrat',
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'The Neon Dreamers',
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 18,
                  fontFamily: 'Montserrat',
                ),
              ),
              const SizedBox(height: 16),
              const Row(
                children: [
                  Icon(Icons.favorite_border, color: Colors.white, size: 24),
                  SizedBox(width: 4),
                  Text('1.2k', style: TextStyle(color: Colors.white, fontFamily: 'Montserrat', fontSize: 16)),
                  SizedBox(width: 24),
                  Icon(Icons.emoji_emotions_outlined, color: Colors.white, size: 24),
                  SizedBox(width: 4),
                  Text('500', style: TextStyle(color: Colors.white, fontFamily: 'Montserrat', fontSize: 16)),
                  SizedBox(width: 24),
                  Icon(Icons.local_fire_department, color: Colors.white, size: 24),
                  SizedBox(width: 4),
                  Text('800', style: TextStyle(color: Colors.white, fontFamily: 'Montserrat', fontSize: 16)),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF23202A),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.people, color: Colors.white, size: 22),
                        SizedBox(width: 8),
                        Text('Viewers: 5.6k', style: TextStyle(color: Colors.white, fontFamily: 'Montserrat', fontSize: 16)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        // Chat area
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView(
              children: [
                // Ethan
                _chatBubble(
                  avatarUrl: chatMessages[0]['avatar'],
                  username: chatMessages[0]['user'],
                  messages: chatMessages[0]['message'],
                  isMe: false,
                  bubbleColor: const Color(0xFF23202A),
                  textColor: Colors.white,
                ),
                // You
                _chatBubble(
                  avatarUrl: chatMessages[1]['avatar'],
                  username: chatMessages[1]['user'],
                  messages: chatMessages[1]['message'],
                  isMe: true,
                  bubbleColor: const Color(0xFFD6C7F7),
                  textColor: Colors.black,
                ),
                // Sophia
                _chatBubble(
                  avatarUrl: chatMessages[2]['avatar'],
                  username: chatMessages[2]['user'],
                  messages: chatMessages[2]['message'],
                  isMe: false,
                  bubbleColor: const Color(0xFF23202A),
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
        // Chat input
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(chatMessages[1]['avatar']),
                radius: 20,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: _controller,
                  style: const TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
                  decoration: InputDecoration(
                    hintText: 'Send a message',
                    hintStyle: const TextStyle(color: Colors.white54, fontFamily: 'Montserrat'),
                    filled: true,
                    fillColor: const Color(0xFF23202A),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(Icons.emoji_emotions_outlined, color: Colors.white54),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _chatBubble({
    required String avatarUrl,
    required String username,
    required List<String> messages,
    required bool isMe,
    required Color bubbleColor,
    required Color textColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isMe) ...[
            CircleAvatar(backgroundImage: NetworkImage(avatarUrl), radius: 20),
            const SizedBox(width: 8),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    username,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontFamily: 'Montserrat',
                      fontSize: 13,
                    ),
                  ),
                  ...messages.map((msg) => Container(
                        margin: const EdgeInsets.symmetric(vertical: 2),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                          color: bubbleColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                            bottomLeft: Radius.circular(4),
                          ),
                        ),
                        child: Text(
                          msg,
                          style: TextStyle(
                            color: textColor,
                            fontFamily: 'Montserrat',
                            fontSize: 16,
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ],
          if (isMe) ...[
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    username,
                    style: const TextStyle(
                      color: Colors.white54,
                      fontFamily: 'Montserrat',
                      fontSize: 13,
                    ),
                  ),
                  ...messages.map((msg) => Container(
                        margin: const EdgeInsets.symmetric(vertical: 2),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        decoration: const BoxDecoration(
                          color: Color(0xFFD6C7F7),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(4),
                          ),
                        ),
                        child: Text(
                          msg,
                          style: const TextStyle(
                            color: Color(0xFF18151C),
                            fontFamily: 'Montserrat',
                            fontSize: 16,
                          ),
                        ),
                      )),
                ],
              ),
            ),
            const SizedBox(width: 8),
            CircleAvatar(backgroundImage: NetworkImage(avatarUrl), radius: 20),
          ],
        ],
      ),
    );
  }
}
