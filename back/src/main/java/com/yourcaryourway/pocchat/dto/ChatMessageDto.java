package com.yourcaryourway.pocchat.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ChatMessageDto {

    private String content;

    private String sender;

    private LocalDateTime timestamp;
}
