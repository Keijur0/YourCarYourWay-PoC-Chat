package com.yourcaryourway.pocchat.service;

import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;

import com.yourcaryourway.pocchat.model.ChatMessage;

@Service
public class ChatService {

    private final SimpMessagingTemplate messagingTemplate;

    public ChatService(SimpMessagingTemplate messagingTemplate) {
        this.messagingTemplate = messagingTemplate;
    }

    public void sendMessage(ChatMessage message) {
        messagingTemplate.convertAndSend("/topic/messages", message);
    }

}
