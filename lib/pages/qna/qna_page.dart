import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QAndAPage extends StatefulWidget {
  @override
  _QAndATabState createState() => _QAndATabState();
}
class _QAndATabState extends State<QAndAPage> with SingleTickerProviderStateMixin{
  TabController? _tabController;

  @override
  void initState(){
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
              tabs: [
                Tab(text: "최신 질문",),
                Tab(text: "답변을 기다리는 질문",),
              ]
          ),
          Expanded(child: TabBarView(
            controller: _tabController,
            children: [
              ,
              Container(color: Colors.blue),
            ],
          ),
          ),
        ],
      )
      ,
    );
  }
}
