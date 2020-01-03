package com.shan.reservation.service.impl;

import com.shan.reservation.bean.food;
import com.shan.reservation.mapper.foodUtilMapper;
import com.shan.reservation.service.FoodService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class FoodServiceImpl implements FoodService {
    @Autowired
    foodUtilMapper foodUtilMapper;
    @Override
    public List<food> SelectFoodHighestSales() {
        List<food> list=foodUtilMapper.SelectFoodHighestSales();
        return list;
    }
}
