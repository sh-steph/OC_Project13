package com.openclassrooms.back.dto;

import com.openclassrooms.back.models.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MessageDto {
    private long messageId;
    private User user;
    private String message;
    private LocalDateTime createdAt;
}
