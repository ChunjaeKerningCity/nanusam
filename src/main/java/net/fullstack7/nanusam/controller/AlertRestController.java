package net.fullstack7.nanusam.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.fullstack7.nanusam.service.AlertService;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;

@RestController
@RequiredArgsConstructor
@Log4j2
public class AlertRestController {
    private final AlertService alertService;
    @GetMapping("/alertRest/unreadCount/{memberId}")
    public ResponseEntity<Integer> getUnreadCount(@PathVariable String memberId) {
        log.info("unreadCount");
        int unreadCount = alertService.unreadCount(memberId);
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(new MediaType("application", "json", StandardCharsets.UTF_8));
        return new ResponseEntity<>(unreadCount,headers, HttpStatus.OK);
    }
}
