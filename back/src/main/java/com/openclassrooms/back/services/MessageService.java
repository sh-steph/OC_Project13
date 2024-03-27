package com.openclassrooms.back.services;

import com.openclassrooms.back.dto.MessageDto;
import com.openclassrooms.back.models.Message;
import com.openclassrooms.back.repositories.MessageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class MessageService {
    @Autowired
    private MessageRepository messageRepository;
    public List<Message> getAllMessages() {
        return messageRepository.findAll();
    }

    public Message addNewMessage(Message message) {
        message.setCreatedAt(LocalDateTime.now());
        return this.messageRepository.save(message);
    }
}
