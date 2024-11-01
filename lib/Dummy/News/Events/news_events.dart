import 'package:flutter/material.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/custom_loarder.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/exports/exports.dart';

class EventsScreen extends StatefulWidget {
  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  bool isLoading = true;

  // Sample data that simulates a network call
  final List<Map<String, String>> events = [
    {
      "title": "Affordable Housing Initiative Launch",
      "date": "November 10, 2024",
      "description":
          "Join us for the launch of the affordable housing initiative aimed at providing homes for all.",
      "imagePath": "assets/png/img_background.jpeg",
    },
    {
      "title": "Groundbreaking Ceremony for New Housing Project",
      "date": "November 15, 2024",
      "description":
          "The PHA is set to begin construction on a new housing project in Islamabad.",
      "imagePath": "assets/png/img_background.jpeg",
    },
    // Additional events...
  ];

  final List<Map<String, String>> news = [
    {
      "title": "PHA Announces New Housing Scheme in Karachi",
      "date": "October 28, 2024",
      "description":
          "The Pakistan Housing Authority has announced a new housing scheme in Karachi.",
      "imagePath": "assets/png/img_background.jpeg",
    },
    {
      "title": "Minister of Housing Visits Development Sites",
      "date": "October 30, 2024",
      "description":
          "The Minister of Housing conducted a site visit to inspect the progress of ongoing projects.",
      "imagePath": "assets/png/img_background.jpeg",
    },
    // Additional news items...
  ];

  @override
  void initState() {
    super.initState();
    // Simulate data loading
    _loadData();
  }

  Future<void> _loadData() async {
    // Simulate a network call with a delay
    await Future.delayed(Duration(seconds: 2));
    // Set loading to false after data is "loaded"
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.AppSecondary,
      appBar: CustomAppBar(title: "Upcoming Events & News"),
      body: isLoading
          ? Center(child: PHALoader()) // Show loader while loading
          : ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: PHAText(
                    text: "Upcoming Events",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ...events.map((event) => EventCard(
                      title: event["title"]!,
                      date: event["date"]!,
                      description: event["description"]!,
                      imagePath: event["imagePath"]!,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EventDetailScreen(event: event),
                          ),
                        );
                      },
                    )),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: PHAText(
                    text: "Latest News",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ...news.map((newsItem) => EventCard(
                      title: newsItem["title"]!,
                      date: newsItem["date"]!,
                      description: newsItem["description"]!,
                      imagePath: newsItem["imagePath"]!,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EventDetailScreen(event: newsItem),
                          ),
                        );
                      },
                    )),
              ],
            ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String title;
  final String date;
  final String description;
  final String imagePath;
  final VoidCallback onTap;

  const EventCard({
    required this.title,
    required this.date,
    required this.description,
    required this.imagePath,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              offset: const Offset(0, 5),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
              Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      date,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EventDetailScreen extends StatelessWidget {
  final Map<String, String> event;

  const EventDetailScreen({required this.event, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.AppSecondary,
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              PHAText(
              text: event["title"]!,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center, 
            ),
                        const SizedBox(height: 16),

            Image.asset(event["imagePath"]!),
            const SizedBox(height: 16),
            PHAText(
             text:  event["title"]!,
              fontSize: 24, fontWeight: FontWeight.bold
            ),
            const SizedBox(height: 8),
            PHAText(
             text:  event["date"]!,
              fontSize: 18, color: Colors.grey
            ),
            const SizedBox(height: 16),
            PHAText(
             text:  event["description"]!,
              fontSize: 16
            ),
          ],
        ),
      ),
    );
  }
}
