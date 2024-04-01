package com.openclassrooms.back.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;


@NoArgsConstructor
@AllArgsConstructor
@Data
public class OutputMessage {
    private String from;
    private String text;
    private String time;
}