package com.shan.reservation.service.impl;

import com.shan.reservation.bean.user;
import com.shan.reservation.mapper.userMapper;
import com.shan.reservation.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserSercieImpl implements UserService {
    @Autowired
    userMapper userMapper;

    @Override
    public List<user> selectUserByNickName(String nickname) {
        return null;
    }

    @Override
    public user selectUserById(int userid) {
        return userMapper.selectByPrimaryKey(userid);
    }
}
