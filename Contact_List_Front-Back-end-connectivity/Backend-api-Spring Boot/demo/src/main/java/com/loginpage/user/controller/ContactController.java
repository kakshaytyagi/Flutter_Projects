package com.loginpage.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.loginpage.user.entity.Contacts;
import com.loginpage.user.service.ContactService;

@RestController
@RequestMapping(value = "/contacts")
public class ContactController {

    @Autowired
    private ContactService contactService;
    
    @GetMapping
    public ResponseEntity<List<Contacts>> getAllContacts() {
        List<Contacts> allContacts = contactService.getAllContacts();
        if (!allContacts.isEmpty()) {
            return ResponseEntity.ok(allContacts);
        } else {
            return ResponseEntity.noContent().build();
        }
    }

    @PostMapping("/add")
    public ResponseEntity<Contacts> createContact(@RequestBody Contacts contact) {
        Contacts createdContact = contactService.createContact(contact);
        return ResponseEntity.status(HttpStatus.CREATED).body(createdContact);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Contacts> updateContact(@PathVariable("id") Long id, @RequestBody Contacts updatedContact) {
        Contacts existingContact = contactService.updateContactById(id, updatedContact);
        if (existingContact != null) {
            return ResponseEntity.ok(existingContact);
        } else {
            return ResponseEntity.notFound().build();
        }
    }



    @DeleteMapping("/{name}")
    public ResponseEntity<Void> deleteContactByName(@PathVariable("name") String name) {
        boolean deleted = contactService.deleteContactByName(name);
        if (deleted) {
            return ResponseEntity.noContent().build();
        } else {
            return ResponseEntity.notFound().build();
        }
    }

}

