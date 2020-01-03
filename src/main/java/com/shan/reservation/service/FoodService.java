package com.shan.reservation.service;

import com.shan.reservation.bean.food;
import org.springframework.stereotype.Service;

import java.util.List;
/**
 * @author wsw
 * @Package com.gabe.mychat.service
 * @Description:
 * @date 2020年1月3日 21:01:25
 */
@Service
public interface FoodService {
    //查询销售额最高的10种菜品
    List<food> SelectFoodHighestSales();
}
