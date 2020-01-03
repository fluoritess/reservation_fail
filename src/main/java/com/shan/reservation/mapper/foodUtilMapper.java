package com.shan.reservation.mapper;

import com.shan.reservation.bean.food;
import com.shan.reservation.bean.foodExample;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface foodUtilMapper {
    List<food> SelectFoodHighestSales();
}
