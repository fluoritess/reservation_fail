package com.shan.reservation.service;

import com.shan.reservation.bean.user;
import org.springframework.stereotype.Service;

import java.util.List;
/**
 * @author wsw
 * @Package com.gabe.mychat.service
 * @Description:
 * @date 2019年12月30日 19:25:31
 */
@Service
public interface UserService {
    //根据昵称查询用户
    List<user> selectUserByNickName(String nickname);
    //根据id查询用户
    user selectUserById(int userid);
}
