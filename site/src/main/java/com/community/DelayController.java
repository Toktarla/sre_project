package com.community;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DelayController {

    @GetMapping("/delay")
    public String delay(@RequestParam(value = "ms", defaultValue = "1000") int ms) throws InterruptedException {
        Thread.sleep(ms);
        return "Delayed response for " + ms + " milliseconds";
    }
}
