import 'dart:convert';
import 'package:http/http.dart' as http;
import 'contact.dart';

class ApiService {
  static Future<List<Contact>> fetchContacts() async {
    try {
      var response = await http.get(Uri.parse('http://10.0.2.2:9081/contacts'));
      // var response = await http.get(Uri.parse('http://127.0.0.1:9081/contacts'));

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        List<Contact> fetchedContacts = [];
        return List<Contact>.from(data?.map((contactData) {
          int? contactId = contactData['contact_id'] as int?;
          String? name = contactData['name'] as String?;
          String? contactNo = contactData['contact_no'] as String?;
          return Contact(contactId ?? 0, name ?? '', contactNo ?? '');
        }) ?? []);
      } else {
        print('API request failed with status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error occurred while fetching contacts: $error');
    }

    return []; // Return an empty list if fetching fails
  }

  static Future<void> createContact(String name, String contactNo) async {
    Map<String, dynamic> newContact = {
      'name': name,
      'contact_no': contactNo,
    };

    try {
      var response = await http.post(
        Uri.parse('http://10.0.2.2:9081/contacts/add'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(newContact),
      );

      if (response.statusCode == 201) {
        // Contact created successfully
      } else {
        print('API request failed with status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error occurred while creating contact: $error');
    }
  }

  static Future<void> updateContact(int contactId, String name, String contactNo) async {
    Map<String, dynamic> updatedContact = {
      'name': name,
      'contact_no': contactNo,
    };

    try {
      var response = await http.put(
        Uri.parse('http://10.0.2.2:9081/contacts/$contactId'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(updatedContact),
      );

      if (response.statusCode == 200) {
        // Contact updated successfully
        fetchContacts(); // Refresh the contact list
      } else {
        print('API request failed with status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error occurred while updating contact: $error');
    }
  }

  static Future<void> deleteContact(String contact) async {
    try {
      var response = await http.delete(Uri.parse('http://10.0.2.2:9081/contacts/$contact'));

      if (response.statusCode == 204) {
        // Contact deleted successfully
      } else {
        print('API request failed with status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error occurred while deleting contact: $error');
    }
  }
}
