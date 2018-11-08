package com.qf.manager.web;

import com.qf.common.pojo.dto.GoodsResult;
import com.qf.common.pojo.dto.PageInfo;
import com.qf.manager.pojo.po.Goods;
import com.qf.manager.pojo.vo.TbItemQuery;
import com.qf.manager.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@Controller
public class ManagerAction {

    @Autowired
    private GoodsService ser;

    @GetMapping("/{path}")
    public String  Index1(@PathVariable String path){
        return path;
    }

    @GetMapping("/pages/{path}")
    public String Index2(@PathVariable String path){

        return "pages/"+path;
    }

    @GetMapping("/pages/{path1}/{path2}")
    public String Index3(@PathVariable String path1, @PathVariable String path2){
        return "pages/"+path1+"/"+path2;
    }

    @RequestMapping(value="/items")
    @ResponseBody
    public GoodsResult<Goods> index4(PageInfo pageInfo , TbItemQuery query){
       // System.out.println(pageInfo);
        return ser.findAll(pageInfo,query);
    }

    @ResponseBody
    @PostMapping("/items/batch")
    public int batchItems(@RequestParam("ids[]") List<Long> ids){
        return ser.batchGoods(ids);

    }


    //新增：要新建一个页面add.jsp(与list.jsp在一个目录下)
    @RequestMapping(value="/add", method=RequestMethod.GET)
    public String add(){
        return "pages/items/add";
    }

    @RequestMapping(value="/add",method=RequestMethod.POST)
    @ResponseBody
    public GoodsResult<Goods> addPost(Goods goods){
        GoodsResult<Goods> result = new GoodsResult<>();
        result.setMsg("添加成功");
        ser.addGoods(goods);

        System.out.println(result);
        return result;
    }

    //manager/add
}
