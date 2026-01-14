import 'package:flutter/material.dart';
import '../../model/contact_model.dart';
import '../../services/api_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ContactsModel> contacts = [];
  bool isLoading = false;

  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nomorController = TextEditingController();

  Future<void> refreshContactList() async {
    setState(() {
      isLoading = true;
    });

    try {
      final List<ContactsModel> result = await ApiServices().getAllContact();
      setState(() {
        contacts = result;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  Future<void> addContact() async {
    if (_namaController.text.trim().isEmpty ||
        _nomorController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nama dan nomor HP harus diisi')),
      );
      return;
    }

    try {
      await ApiServices().postContact(
        _namaController.text.trim(),
        _nomorController.text.trim(),
      );

      _namaController.clear();
      _nomorController.clear();
      Navigator.of(context).pop();
      await refreshContactList();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Kontak berhasil ditambahkan')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  Future<void> deleteContact(String id, String nama) async {
    final bool? confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Konfirmasi Hapus'),
        content: Text('Apakah Anda yakin ingin menghapus kontak "$nama"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      try {
        await ApiServices().deleteContact(id);
        await refreshContactList();

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Kontak berhasil dihapus')),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: $e')),
          );
        }
      }
    }
  }

  void showAddContactDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Tambah Kontak Baru'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _namaController,
              decoration: const InputDecoration(
                labelText: 'Nama Kontak',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _nomorController,
              decoration: const InputDecoration(
                labelText: 'Nomor HP',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              _namaController.clear();
              _nomorController.clear();
              Navigator.of(context).pop();
            },
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: addContact,
            child: const Text('Simpan'),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    refreshContactList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact API'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                final ContactsModel contact = contacts[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  elevation: 4,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue.shade100,
                      child: Text(
                        contact.nama_kontak.isNotEmpty
                            ? contact.nama_kontak[0].toUpperCase()
                            : '?',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    title: Text(
                      contact.nama_kontak,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(contact.nomor_hp),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => deleteContact(contact.id, contact.nama_kontak),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: refreshContactList,
            backgroundColor: Colors.blue,
            heroTag: "refresh",
            child: const Icon(Icons.refresh, color: Colors.white),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            onPressed: showAddContactDialog,
            backgroundColor: Colors.green,
            heroTag: "add",
            child: const Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
