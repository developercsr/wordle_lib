import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class reporting extends StatefulWidget {
  const reporting({super.key});
  @override
  State<reporting> createState() => _reportingState();
}

class _reportingState extends State<reporting> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(itemBuilder: (context)=>
      [
      const PopupMenuItem(
        child: Text("Report"),
        value: "Report",
      ),
      const PopupMenuItem(
        child: Text("Suggestions"),
        value: "suggestions",
      ),
      ],
      onSelected: (String value){
        if(value =="Report")
        {
          _launchGmailforReport();
        }
        else if(value=="suggestions")
        {
          _launchGmailforSuggestions();
        }
      },
    );
  }
}

void _launchGmailforReport() async {
  final Uri params = Uri(
    scheme: 'mailto',
    path: 'dhiyotek@gmail.com',
    query: 'Report',
  );
  if (await canLaunchUrl(params)) {
    await launchUrl(params);
  } else {
    throw 'Could not launch $Uri';
  }
}

void _launchGmailforSuggestions() async {
  final Uri params = Uri(
    scheme: 'mailto',
    path: 'dhiyotek@gmail.com',
    query: 'Suggestions', // Add subject and body if needed
  );
  if (await canLaunchUrl(params)) {
    await launchUrl(params);
  } else {
    throw 'Could not launch $Uri';
  }
}