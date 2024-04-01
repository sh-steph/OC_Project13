package com.openclassrooms.back.models;

import lombok.*;
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Message {
    private String from;
    private String text;
}
