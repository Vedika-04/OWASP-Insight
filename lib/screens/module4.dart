import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Module4Screen extends StatelessWidget {
  const Module4Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A04. Insecure Design', style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                'assets/images/insecure.jpg', // Make sure this image is added to assets
                height: 300,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sectionTitle('Overview:'),
                  Text(
                    'Insecure Design refers to the lack of secure design principles in software development, resulting in inherent vulnerabilities in the application’s architecture.',
                    style: bodyTextStyle(),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 10),
                  sectionTitle('Common Causes of Insecure Design:'),
                  // Add Pie Chart Here
                  const SizedBox(height: 16),
                  interactivePieChart(),
                  const SizedBox(height: 16),
                  sectionTitle('Real-World Example: Heartbleed'),
                  Text(
                    'Heartbleed (2014) was a serious vulnerability in OpenSSL. Due to improper design, heartbeat requests lacked bounds checking, allowing attackers to read sensitive memory data from servers, including passwords and encryption keys.',
                    style: bodyTextStyle(),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 16),
                  sectionTitle('Prevention Techniques:'),
                  sectionBulletPoints([
                    '1. Perform threat modeling during the early design stages.',
                    '2. Follow secure design principles (least privilege, defense in depth).',
                    '3. Use well-tested authentication and authorization mechanisms.',
                    '4. Encrypt sensitive data both in transit and at rest.',
                    '5. Conduct design reviews and security testing regularly.',
                  ]),
                  const SizedBox(height: 16),
                  sectionTitle('Interactive Labs and Resources:'),
                  simpleResourceLink('TryHackMe - Insecure Design Labs'),
                  simpleResourceLink('PortSwigger Labs - Insecure Design'),
                  const SizedBox(height: 16),
                  sectionTitle('Watch & Learn:'),
                  simpleResourceLink('Watch: Insecure Design Explained (YouTube)'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        fontFamily: 'Montserrat',
        color: Colors.black87,
      ),
    );
  }

  TextStyle bodyTextStyle() {
    return const TextStyle(
      fontSize: 18,
      fontFamily: 'Montserrat',
    );
  }

  Widget sectionBulletPoints(List<String> points, {double gap = 10.0}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: points.map((point) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: gap / 2),
          child: Text(
            point,
            style: const TextStyle(
              fontSize: 18,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w400,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget simpleResourceLink(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          const Icon(Icons.link, color: Colors.blue),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
                color: Colors.blueAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Create the Interactive Pie Chart Widget
  Widget interactivePieChart() {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PieChart(
            PieChartData(
              sectionsSpace: 2, // Space between each section
              centerSpaceRadius: 40, // Space in the center of the pie chart
              sections: [
                PieChartSectionData(
                  color: Colors.red,
                  value: 20,
                  title: '', // No title in the section, percentage only inside
                  radius: 40,
                  titleStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold, // Make labels bold
                    color: Colors.white,
                  ),
                ),
                PieChartSectionData(
                  color: Colors.orange,
                  value: 15,
                  title: '',
                  radius: 40,
                  titleStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                PieChartSectionData(
                  color: Colors.yellow,
                  value: 25,
                  title: '',
                  radius: 40,
                  titleStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                PieChartSectionData(
                  color: Colors.green,
                  value: 10,
                  title: '',
                  radius: 40,
                  titleStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                PieChartSectionData(
                  color: Colors.blue,
                  value: 30,
                  title: '',
                  radius: 40,
                  titleStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        // Legend section below the chart
        Center(
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 20, // space between items horizontally
            runSpacing: 10, // space between rows
            children: [
              legendItem('Input Validation', Colors.red),
              legendItem('Session Mgmt', Colors.orange),
              legendItem('Insecure Storage', Colors.yellow),
              legendItem('Threat Modeling', Colors.green),
              legendItem('Separation of Duties', Colors.blue),
            ],
          ),
        )
      ],
    );
  }

// Helper method for displaying legend
  Widget legendItem(String label, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 16,
          height: 16,
          color: color,
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
