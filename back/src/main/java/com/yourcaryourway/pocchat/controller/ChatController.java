package com.yourcaryourway.pocchat.controller;

import java.util.List;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yourcaryourway.pocchat.dto.ChatMessageDto;
import com.yourcaryourway.pocchat.service.ChatService;

@RestController
public class ChatController {

    private final ChatService chatService;

    public ChatController(ChatService chatService) {
        this.chatService = chatService;
    }

    @MessageMapping("/sendMessage")
    @SendTo("/topic/messages")
    public void sendMessage(@Payload ChatMessageDto chatMessageDto) {
        chatService.sendMessage(chatMessageDto);
    }

    @GetMapping("/api/messages")
    public List<ChatMessageDto> getAllMessages() {
        return chatService.getAllMessages();
    }
}
