package com.community;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {

    @GetMapping("/response")
    public ResponseEntity<String> getResponse(@RequestParam(value = "status", defaultValue = "200") int status) {
        if (status == 404) {
            return new ResponseEntity<>("Resource not found", HttpStatus.NOT_FOUND);
        } else {
            return new ResponseEntity<>("Everything is OK", HttpStatus.OK);
        }
    }
}