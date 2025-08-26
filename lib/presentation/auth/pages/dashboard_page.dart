import 'package:flutter/material.dart';
import 'package:website_absensi/core/constans/colors.dart';
import 'package:website_absensi/presentation/widgets/sidebar.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: AppColors.white,
      ),
      drawer: Sidebar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              TextField(
                decoration: InputDecoration(
                  labelText: 'Search...',
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(20), // Menambahkan border radius
                  ),
                  prefixIcon: Icon(Icons.search),
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Dashboard Types',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              ResponsiveGrid(),
              const SizedBox(height: 20),

              _buildStatCard('Weekly Sales', 'Graph for Weekly Sales'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String description) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 5,
            spreadRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(child: Text('Graph for Weekly Sales')),
          ),
        ],
      ),
    );
  }
}

class ResponsiveGrid extends StatelessWidget {
  const ResponsiveGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int columns = constraints.maxWidth > 800 ? 4 : 2;

        return GridView.count(
          crossAxisCount: columns,
          childAspectRatio: 1.3,
          crossAxisSpacing: 11.0,
          mainAxisSpacing: 11.0,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            DashboardCard(
              title: 'Sales total',
              value: '\$97,155.05',
              percentageChange: '↑ 100.0% Compared to 2024',
              color: Colors.blue[100]!,
            ),
            DashboardCard(
              title: 'Average Order Value',
              value: '\$578.30',
              percentageChange: '↑ 100.0% Compared to 2024',
              color: Colors.green[100]!,
            ),
            DashboardCard(
              title: 'Total Orders',
              value: '168',
              percentageChange: '↑ 100.0% Compared to 2024',
              color: Colors.purple[100]!,
            ),
            DashboardCard(
              title: 'Sold Products',
              value: '243',
              percentageChange: '↑ 100.0% Compared to 2024',
              color: Colors.orange[100]!,
            ),
          ],
        );
      },
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final String value;
  final String percentageChange;
  final Color color;

  const DashboardCard({
    required this.title,
    required this.value,
    required this.percentageChange,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              value,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              percentageChange,
              style: const TextStyle(color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}