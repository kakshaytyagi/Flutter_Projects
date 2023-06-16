package com.loginpage.user.service;

import java.awt.print.Printable;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.crossstore.ChangeSetPersister.NotFoundException;
import org.springframework.stereotype.Service;

import com.loginpage.user.dao.ContactRepo;
import com.loginpage.user.entity.Contacts;

@Service
public class ContactService {

    @Autowired
    private ContactRepo contactRepository;

    public Contacts createContact(Contacts contact) {
        return contactRepository.save(contact);
    }
    
    public List<Contacts> getAllContacts() {
        return contactRepository.findAll();
    }

    public Contacts updateContactById(Long id, Contacts updatedContact) {
        Optional<Contacts> optionalContact = contactRepository.findById(id);
        if (optionalContact.isPresent()) {
            Contacts existingContact = optionalContact.get();
            existingContact.setName(updatedContact.getName());
            existingContact.setContact_no(updatedContact.getContact_no());
            return contactRepository.save(existingContact);
        } else {
            return null; // Contact not found
        }
    }



    public boolean deleteContactByName(String name) {
        int deletedRows = contactRepository.deleteByName(name);
        return deletedRows > 0;
    }

}

