import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class DashboardScreen extends StatefulWidget {
  final Widget child;
  const DashboardScreen({super.key, required this.child});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final tabs = [
    '/dashboard/home',
    '/dashboard/campaign_list',
    '/dashboard/my_donations',
    '/dashboard/account',
  ];

  int currentIndex = 0;

  List<NavigationDestination> get _appBarDestinations => List.generate(
    tabs.length,
    (index) {
      final icons = [
        'assets/icons/icon-home.svg',
        'assets/icons/icon-campaign.svg',
        'assets/icons/icon-give.svg',
        'assets/icons/icon-person.svg',
      ];

      final labels = ['Home', 'Campaigns', 'Donations', 'Account'];

      return NavigationDestination(
        selectedIcon: SvgPicture.asset(
          icons[index],
          colorFilter: ColorFilter.mode(Colors.green.shade800, BlendMode.srcIn),
          width: 26,
          height: 26,
        ),
        icon: SvgPicture.asset(
          icons[index],
          colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
          width: 26,
          height: 26,
        ),
        label: labels[index],
      );
    },
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final location = GoRouterState.of(context).uri.toString();
    final index = tabs.indexWhere((tab) => location.startsWith(tab));
    setState(() {
      currentIndex = index == -1 ? 0 : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      extendBody: true,
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return NavigationBar(
      elevation: 2,
      surfaceTintColor: Colors.white,
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      selectedIndex: currentIndex,
      backgroundColor: Colors.green.shade50,
      labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((
        Set<WidgetState> states,
      ) {
        // Ketika dipilih, warna biru
        if (states.contains(WidgetState.selected)) {
          return TextStyle(
            color: Colors.green.shade800,
            fontWeight: FontWeight.bold,
          );
        }
        // Ketika tidak dipilih, warna abu-abu
        return TextStyle(color: Color(0xFFB0B0B0));
      }),
      onDestinationSelected: (index) {
        setState(() => currentIndex = index);
        context.go(tabs[index]);
      },
      destinations: _appBarDestinations,
    );
  }
}
