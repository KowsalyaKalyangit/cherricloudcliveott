import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/livetv_category_controller.dart';
 
 
import 'news_page.dart';
 

class LiveChannels extends StatefulWidget {
  const LiveChannels({super.key});

  @override
  State<LiveChannels> createState() => _LiveChannelsState();
}

class _LiveChannelsState extends State<LiveChannels> {
  LiveCategoryController liveTvCategoryController =
      Get.put(LiveCategoryController());
  @override
  void initState() {
    liveTvCategoryController.liveTvcategoryController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Live TV '),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // EntertainmentPage(),
              
              NewsPage(),
            
            ],
          ),
        ),
      ),
    );
  }
}
