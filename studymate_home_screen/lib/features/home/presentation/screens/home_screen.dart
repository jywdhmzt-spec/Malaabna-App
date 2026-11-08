import 'package:flutter/material.dart';
import '../widgets/dashboard_stat_card.dart';
import '../widgets/home_bottom_navigation.dart';
import '../widgets/quick_create_sheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _selectedIndex == 0 ? _buildDashboard() : _buildPlaceholder(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => QuickCreateSheet.show(context),
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: HomeBottomNavigation(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) => setState(() => _selectedIndex = index),
      ),
    );
  }

  Widget _buildDashboard() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('مرحباً بك 👋', style: TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w800,
                      color: Color(0xFF20243A),
                    )),
                    SizedBox(height: 5),
                    Text('لننجز شيئاً رائعاً اليوم',
                      style: TextStyle(color: Color(0xFF858CA0), fontSize: 13)),
                  ],
                ),
              ),
              Container(
                width: 46, height: 46,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: const Color(0xFFECEEF4)),
                ),
                child: const Icon(Icons.notifications_none_rounded),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF6677E8), Color(0xFF8793F0)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(22),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('خطّط ليومك', style: TextStyle(
                  color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800,
                )),
                SizedBox(height: 7),
                Text('رتّب مهامك وملاحظاتك وابقَ على المسار الصحيح.',
                  style: TextStyle(color: Colors.white, height: 1.5)),
              ],
            ),
          ),
          const SizedBox(height: 26),
          const Text('نظرة عامة', style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w800,
            color: Color(0xFF20243A),
          )),
          const SizedBox(height: 14),
          const GridView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.18,
            ),
            children: [
              DashboardStatCard(
                title: 'المهام النشطة', value: '08',
                subtitle: 'مهام قيد الإنجاز',
                icon: Icons.task_alt_rounded, color: Color(0xFF5B6CDE),
              ),
              DashboardStatCard(
                title: 'المهام المكتملة', value: '12',
                subtitle: 'إنجازاتك حتى الآن',
                icon: Icons.verified_outlined, color: Color(0xFF16A085),
              ),
              DashboardStatCard(
                title: 'الملاحظات', value: '24',
                subtitle: 'ملاحظات محفوظة',
                icon: Icons.sticky_note_2_outlined, color: Color(0xFFE39A35),
              ),
              DashboardStatCard(
                title: 'المواد الدراسية', value: '05',
                subtitle: 'موادك الحالية',
                icon: Icons.menu_book_outlined, color: Color(0xFF9872D8),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text('ابدأ بسرعة', style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w800,
            color: Color(0xFF20243A),
          )),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: () => QuickCreateSheet.show(context),
            icon: const Icon(Icons.add),
            label: const Text('إنشاء عنصر جديد'),
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(double.infinity, 52),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceholder() {
    const labels = ['الرئيسية', 'المهام', 'التقويم', 'ملفاتي'];
    return Center(
      child: Text('قسم ${labels[_selectedIndex]} قيد التطوير',
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
    );
  }
}
