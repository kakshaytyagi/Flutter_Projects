package com.loginpage.user.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Contacts {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private long contact_id;
    private String name;
    private String contact_no;
    
	public Contacts() {
		super();
	}

	public Contacts(long contact_id, String name, String contact_no) {
		super();
		this.contact_id = contact_id;
		this.name = name;
		this.contact_no = contact_no;
	}

	public long getContact_id() {
		return contact_id;
	}

	public void setContact_id(long contact_id) {
		this.contact_id = contact_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContact_no() {
		return contact_no;
	}

	public void setContact_no(String contact_no) {
		this.contact_no = contact_no;
	}

	@Override
	public String toString() {
		return "Contacts [contact_id=" + contact_id + ", name=" + name + ", contact_no=" + contact_no + "]";
	}
    
}
