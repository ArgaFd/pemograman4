// lib/home_page.dart
import 'package:flutter/material.dart';
import 'data_service.dart';
import 'user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  final DataService _dataService = DataService(); // Menggunakan backend yang sama
  final TextEditingController _nameCtl = TextEditingController();
  final TextEditingController _jobCtl = TextEditingController();
  final TextEditingController _idDeleteCtl = TextEditingController();
  
  bool _isLoading = false;
  List<User> _users = [];
  UserCreate? _lastResponse;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _nameCtl.dispose();
    _jobCtl.dispose();
    _idDeleteCtl.dispose();
    super.dispose();
  }

  // --- Logic Wrappers (Tetap menggunakan fungsi dari data_service.dart) ---
  Future<void> _fetchUsers() async {
    setState(() => _isLoading = true);
    final res = await _dataService.getUserModel(); //
    setState(() {
      _users = res ?? [];
      _isLoading = false;
    });
  }

  Future<void> _handlePost() async {
    if (_nameCtl.text.isEmpty) return;
    setState(() => _isLoading = true);
    final model = UserCreate(name: _nameCtl.text, job: _jobCtl.text); //
    final res = await _dataService.postUser(model); //
    setState(() {
      _lastResponse = res;
      _isLoading = false;
    });
    _showStatus('User Berhasil Dibuat', Colors.green);
  }

  Future<void> _handleUpdate() async {
    setState(() => _isLoading = true);
    final res = await _dataService.putUser('2', _nameCtl.text, _jobCtl.text); //
    setState(() {
      _lastResponse = res;
      _isLoading = false;
    });
    _showStatus('User Berhasil Diupdate', Colors.blue);
  }

  Future<void> _handleDelete() async {
    if (_idDeleteCtl.text.isEmpty) return;
    final confirmed = await _showConfirmDialog();
    if (confirmed != true) return;

    setState(() => _isLoading = true);
    final res = await _dataService.deleteUser(_idDeleteCtl.text); //
    setState(() => _isLoading = false);
    
    if (res != null) {
      _showStatus('User ID ${_idDeleteCtl.text} Berhasil Dihapus', Colors.red);
      _idDeleteCtl.clear();
      _fetchUsers();
    }
  }

  void _showStatus(String msg, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg), 
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
      )
    );
  }

  Future<bool?> _showConfirmDialog() {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
... (166 lines left)