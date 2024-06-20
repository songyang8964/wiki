package com.song.wiki.controller;

import com.song.wiki.dto.req.CategoryQueryReqDto;
import com.song.wiki.dto.req.CategorySaveReqDto;
import com.song.wiki.dto.resp.CategoryQueryRespDto;
import com.song.wiki.dto.resp.ErrorCode;
import com.song.wiki.dto.resp.PageRespDto;
import com.song.wiki.dto.resp.RestfulModel;
import com.song.wiki.service.CategoryService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping("/category")
public class CategoryController {

    @Resource
    private CategoryService categoryService;

    /**
     * 获取全部 Category 的接口
     */
    @GetMapping("/all")
    public RestfulModel<List<CategoryQueryRespDto>> allCategories() {
        List<CategoryQueryRespDto> categoryList = categoryService.fetchAllCategories();
        return new RestfulModel<>(ErrorCode.SUCCESS, "", categoryList);
    }

    /**
     * 对 category 进行query的接口
     * @param categoryQueryReqDto query条件的参数
     * @return query到的所有category
     */
    @GetMapping("/query")
    public RestfulModel<PageRespDto<CategoryQueryRespDto>> queryCategorys(@Valid CategoryQueryReqDto categoryQueryReqDto) {
        PageRespDto<CategoryQueryRespDto> bookList = categoryService.queryCategorys(categoryQueryReqDto);
        return new RestfulModel<>(ErrorCode.SUCCESS, "", bookList);
    }

    /**
     * 根据请求的参数保存一个 category，若id非空则为更新，否则为add
     */
    @PostMapping("/save")
    public RestfulModel<Integer> saveCategory(@RequestBody @Valid CategorySaveReqDto categorySaveReqDto) {
        categoryService.save(categorySaveReqDto);
        return new RestfulModel<>(ErrorCode.SUCCESS, "", 0);
    }

    @DeleteMapping("/delete/{categoryId}")
    public RestfulModel<Integer> deleteCategory(@PathVariable Long categoryId) {
        categoryService.deleteOneCategory(categoryId);
        return new RestfulModel<>(ErrorCode.SUCCESS, "", 0);
    }
}
