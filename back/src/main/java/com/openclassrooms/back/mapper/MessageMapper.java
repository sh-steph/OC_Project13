package com.openclassrooms.back.mapper;

import com.openclassrooms.back.dto.MessageDto;
import com.openclassrooms.back.models.Message;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.ReportingPolicy;

@Mapper(componentModel = "spring", unmappedTargetPolicy = ReportingPolicy.ERROR, uses = {})
public interface MessageMapper {
    @Mapping(target = "messageId", source = "message.id")
    @Mapping(target = "user", source = "message.userId")
    @Mapping(target = "message", source = "message.message")
//    @Mapping(target = "createdAt", source = "message.createdAt")
    MessageDto messageToMessageDto(Message message);

    @Mapping(target = "id", source = "messageDto.messageId")
    @Mapping(target = "userId", source = "messageDto.user")
    @Mapping(target = "message", source = "messageDto.message")
//    @Mapping(target = "createdAt", source = "messageDto.createdAt")
    Message messageDtotoMessage(MessageDto messageDto);

}
