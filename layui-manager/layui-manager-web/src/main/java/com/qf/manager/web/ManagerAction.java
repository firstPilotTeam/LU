package com.qf.manager.web;

import com.qf.common.pojo.dto.GoodsResult;
import com.qf.common.pojo.dto.PageInfo;
import com.qf.manager.pojo.po.Goods;
import com.qf.manager.pojo.vo.GoodsCustom;
import com.qf.manager.pojo.vo.GoodsQuery;
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
    public String  Index(@PathVariable String path){
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

   //包括分页
    @RequestMapping(value="/items")
    @ResponseBody
    //虽然此方法返回的是一个对象，但是使用@ResponseBody将会返回给前端一个json字符串格式
   public GoodsResult<GoodsCustom> index4(PageInfo pageInfo,GoodsQuery query){
       System.out.println("++++++++++"+query.getGname());
        System.out.println("++++++++++"+pageInfo.getLimit());
       return ser.findAll(pageInfo,query);
   }

    @ResponseBody
    @PostMapping("/items/batch")
    public int batchItems(@RequestParam("ids[]") List<Integer> ids){
       return ser.batchGoods(ids);

    }


    //新增：要新建一个页面add.jsp(与list.jsp在一个目录下)
    @RequestMapping(value="/add", method=RequestMethod.GET)
    public String add(){
        return "pages/item/add";
    }

    @RequestMapping(value="/add",method=RequestMethod.POST)
    @ResponseBody
    public GoodsResult<GoodsCustom> addPost(GoodsCustom goods){
        GoodsResult<GoodsCustom> result = new GoodsResult<>();
        result.setMsg("添加成功");
        ser.addGoods(goods);

        System.out.println(result);
        return result;
    }

    //删除
    @ResponseBody
    @RequestMapping("/del")
    public GoodsResult<Object> delete(Integer id){
        GoodsResult<Object> result = new GoodsResult<>();
        result.setCode(0);
        result.setMsg("删除成功");
        ser.delGoods(id);
        return result;
    }


    //编辑

    //数据回显
    @RequestMapping(value="/edit", method=RequestMethod.GET)
    public String edit(){
        System.out.println("方法调用");
        return "pages/item/edit";
    }
   /* //从后台拿数据放到页面
    @RequestMapping("/edit2")
    @ResponseBody
    public GoodsResult<Goods> edit2(Integer id){
        List<Goods> goods = ser.editback(id);
        GoodsResult<Goods> result = new GoodsResult<>();
        result.setData(goods);
        result.setCode(0);
        System.out.println(result.getData().toString());
        return result;
    }*/

    //提交编辑之后的数据
    @RequestMapping(value="/edit3" ,method=RequestMethod.POST)
    @ResponseBody
    public GoodsResult<GoodsCustom> edit(GoodsCustom goods){
        GoodsResult<GoodsCustom> result = new GoodsResult<GoodsCustom>();
        result.setMsg("编辑成功");
        result.setCode(0);
        ser.modifyGoods(goods);
        //ser.edit();
        return result;
    }


}
