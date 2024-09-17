package com.yourcaryourway.pocchat.model;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class ChatMessage {

    private String content;

    private String sender;

    private LocalDateTime timestamp;
}
