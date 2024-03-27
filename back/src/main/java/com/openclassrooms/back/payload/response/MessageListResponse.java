package com.openclassrooms.back.payload.response;

import com.openclassrooms.back.models.Message;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MessageListResponse {
    private List<Message> messages;
}
