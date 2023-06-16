package com.loginpage.user.dao;

import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.loginpage.user.entity.Contacts;

@Repository
@Transactional
public interface ContactRepo extends JpaRepository<Contacts, Long> {
	@Modifying
    @Query("DELETE FROM Contacts c WHERE c.name = :name")
    int deleteByName(String name);
	
}

