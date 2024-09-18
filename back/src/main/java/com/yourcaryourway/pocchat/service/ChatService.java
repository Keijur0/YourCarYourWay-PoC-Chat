package com.yourcaryourway.pocchat.service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.yourcaryourway.pocchat.dto.ChatMessageDto;
import com.yourcaryourway.pocchat.model.ChatMessage;

@Service
public class ChatService {
    
    private final List<ChatMessage> messages = new ArrayList<>();

    public void saveMessage(ChatMessageDto chatMessageDto) {
        ChatMessage chatMessage = new ChatMessage();
        chatMessage.setContent(chatMessageDto.getContent());
        chatMessage.setSender(chatMessageDto.getSender());
        chatMessage.setTimestamp(LocalDateTime.now());
        messages.add(chatMessage);
    }

    public List<ChatMessageDto> getAllMessages() {
        List<ChatMessageDto> messageDtos = new ArrayList<>();
        for (ChatMessage message : messages) {
            messageDtos.add(new ChatMessageDto(message.getContent(), message.getSender(), message.getTimestamp()));
        }
        return messageDtos;
    }

}
