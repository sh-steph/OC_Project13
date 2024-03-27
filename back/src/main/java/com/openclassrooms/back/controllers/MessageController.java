package com.openclassrooms.back.controllers;

import com.openclassrooms.back.dto.MessageDto;
import com.openclassrooms.back.mapper.MessageMapper;
import com.openclassrooms.back.models.Message;
import com.openclassrooms.back.models.User;
import com.openclassrooms.back.payload.response.MessageListResponse;
import com.openclassrooms.back.payload.response.MessageResponse;
import com.openclassrooms.back.services.MessageService;
import com.openclassrooms.back.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/message")
public class MessageController {
    @Autowired
    MessageService messageService;
    @Autowired
    UserService userService;
    @Autowired
    MessageMapper messageMapper;

    @GetMapping
    public ResponseEntity<?> getAllMessage() {
        messageService.getAllMessages();
        return ResponseEntity.ok().body(new MessageListResponse(messageService.getAllMessages()));
    }

    @PostMapping
        public ResponseEntity<?> create(@RequestBody MessageDto messageDto) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User user = (User) authentication.getPrincipal();
        if (messageDto == null) {
            return ResponseEntity
                    .badRequest()
                    .body(new MessageResponse("Bad request comment"));
        } else {
            // Map MessageDto to Message entity
            Message message = messageMapper.messageDtotoMessage(messageDto);

            // Set the user ID based on the authenticated user
            message.setUserId(user);

            // Save the message using the service
            Message savedMessage = messageService.addNewMessage(message);

            // Map the saved message back to a DTO
            MessageDto savedMessageDto = messageMapper.messageToMessageDto(savedMessage);

            // Return a response with the saved message DTO
            return ResponseEntity.ok().body(new MessageResponse("The message was successfully created"));
        }
    }
}
