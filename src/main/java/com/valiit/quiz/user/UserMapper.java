package com.valiit.quiz.user;

import org.mapstruct.Mapper;
import org.mapstruct.ReportingPolicy;
import org.mapstruct.factory.Mappers;

@Mapper(unmappedTargetPolicy = ReportingPolicy.IGNORE)
public interface UserMapper {
    UserMapper INSTANCE = Mappers.getMapper(UserMapper.class);

    // UserHighscoreDto toUserDto(User user);
    User toUser(CreateUserDto createUserDto);
    // method overloading
    CreateUserDto toUserDto(User user);
}

