package com.loginpage.user;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication   
@EnableAutoConfiguration
@ComponentScan(basePackages={"com.loginpage.user"})
@EnableJpaRepositories(basePackages="com.loginpage.user.dao")
@EnableTransactionManagement
@EntityScan(basePackages="com.loginpage.user.entity")
public class DemoApplication {

	public static void main(String[] args) {
		SpringApplication.run(DemoApplication.class, args);
	}

}
