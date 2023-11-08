package com.cleanup;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

@EnableAspectJAutoProxy
@SpringBootApplication
public class CleanupApplication {

	public static void main(String[] args) {
		SpringApplication.run(CleanupApplication.class, args);
	}

}
