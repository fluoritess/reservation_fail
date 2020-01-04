package com.shan.reservation.controller;

import com.shan.reservation.bean.food;
import com.shan.reservation.bean.user;
import com.shan.reservation.mapper.foodUtilMapper;
import com.shan.reservation.service.FoodService;
import com.shan.reservation.util.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * @author wsw
 * @Package com.gabe.mychat.controller
 * @Description:
 * @date 2020年1月3日 21:42:54
 */
@Controller
public class FoofController {
//    @Autowired
//    FoodService foodService;
    @Autowired
    com.shan.reservation.mapper.foodUtilMapper foodUtilMapper;
    @ResponseBody
    @RequestMapping("/SelectFoodHighestSales" )
    public R SelectFoodHighestSales(){
        List<food> list=foodUtilMapper.SelectFoodHighestSales();
        return R.ok().put("foodlist",list);
    }
}
