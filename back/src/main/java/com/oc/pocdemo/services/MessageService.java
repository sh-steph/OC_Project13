package com.oc.pocdemo.services;

import com.oc.pocdemo.models.Message;
import com.oc.pocdemo.repositories.MessageRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Service
@RequiredArgsConstructor
public class MessageService {
    private final MessageRepository messageRepository;

    public void addMessage (String content, String sender) {
        Message message = new Message();
        message.setUsername(sender);
        message.setMessage(content);
        message.setCreatedAt(LocalDateTime.now());
        this.messageRepository.save(message);
    }
}
