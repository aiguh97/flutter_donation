import 'package:flutter/material.dart';

class CampaignListScreen extends StatefulWidget {
  const CampaignListScreen({super.key});

  @override
  State<CampaignListScreen> createState() => _CampaignListScreen();
}

class _CampaignListScreen extends State<CampaignListScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Campaign List Page"));
  }
}
