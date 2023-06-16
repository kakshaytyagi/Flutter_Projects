import 'package:flutter/material.dart';
import 'api_service.dart';
import 'contact.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Contact> contacts = [];

  @override
  void initState() {
    super.initState();
    fetchContacts();
  }

  Future<void> fetchContacts() async {
    List<Contact> fetchedContacts = await ApiService.fetchContacts();
    print(fetchedContacts);
    setState(() {
      contacts = fetchedContacts;
    });
  }

  Future<void> createContact(String name, String contactNo) async {
    await ApiService.createContact(name, contactNo);
    fetchContacts();
  }

  Future<void> updateContact(int contactId, String name, String contactNo) async {
    await ApiService.updateContact(contactId, name, contactNo);
    fetchContacts();
  }

  Future<void> deleteContact(String contact) async {
    await ApiService.deleteContact(contact);
    fetchContacts();
  }

  Future<void> showAddContactDialog({Contact? contact}) async {
    TextEditingController nameController = TextEditingController(text: contact?.name ?? '');
    TextEditingController contactNoController = TextEditingController(text: contact?.contactNo ?? '');

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(contact != null ? 'Update Contact' : 'Add Contact'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
              ),
              TextField(
                controller: contactNoController,
                decoration: InputDecoration(
                  labelText: 'Contact Number',
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              child: Text(contact != null ? 'Update' : 'Add'),
              onPressed: () {
                String name = nameController.text;
                String contactNo = contactNoController.text;

                if (name.isNotEmpty && contactNo.isNotEmpty) {
                  if (contact != null) {
                    // Update contact
                    updateContact(contact.contactId, name, contactNo);
                  } else {
                    // Add contact
                    createContact(name, contactNo);
                  }
                  Navigator.of(context).pop(); // Close the dialog
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contact List',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple.shade400, Colors.purple.shade900],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: Colors.white),
            onPressed: () {
              showAddContactDialog();
            },
          ),
          IconButton(
            icon: Icon(Icons.refresh, color: Colors.white),
            onPressed: () {
              fetchContacts();
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              contacts[index].name,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              contacts[index].contactNo,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    showAddContactDialog(contact: contacts[index]);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    deleteContact(contacts[index].name);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
