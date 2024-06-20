package com.song.wiki.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.song.wiki.domain.Category;
import com.song.wiki.domain.CategoryExample;
import com.song.wiki.dto.req.CategoryQueryReqDto;
import com.song.wiki.dto.req.CategorySaveReqDto;
import com.song.wiki.dto.resp.CategoryQueryRespDto;
import com.song.wiki.dto.resp.PageRespDto;
import com.song.wiki.mapper.CategoryMapper;
import com.song.wiki.utils.CopyUtil;
import com.song.wiki.utils.SnowFlake;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CategoryService {

    private static final Logger LOG = LoggerFactory.getLogger(CategoryService.class);

    @Resource
    private CategoryMapper categoryMapper;

    @Resource
    private SnowFlake snowFlake;

    /**
     * 获取全部 Category
     */
    public List<CategoryQueryRespDto> fetchAllCategories() {
        CategoryExample categoryExample = new CategoryExample();
        categoryExample.setOrderByClause("sort asc");
        List<Category> categoryList = categoryMapper.selectByExample(categoryExample);
        return CopyUtil.copyList(categoryList, CategoryQueryRespDto.class);
    }


    /**
     * 根据query条件对数据库中的 category 进行query并返回query到的 category
     */
    public PageRespDto<CategoryQueryRespDto> queryCategorys(CategoryQueryReqDto reqDto) {
        CategoryExample categoryExample = new CategoryExample();
        CategoryExample.Criteria criteria = categoryExample.createCriteria();
        PageHelper.startPage(reqDto.getPageNum(), reqDto.getPageSize());
        List<Category> categoryList = categoryMapper.selectByExample(categoryExample);

        PageInfo<Category> pageInfo = new PageInfo<>(categoryList);
        LOG.info("总行数：{}", pageInfo.getTotal());
        LOG.info("总页数：{}", pageInfo.getPages());

        // 列表复制
        List<CategoryQueryRespDto> list = CopyUtil.copyList(categoryList, CategoryQueryRespDto.class);

        PageRespDto<CategoryQueryRespDto> pageRespDto = new PageRespDto<>();
        pageRespDto.setTotal(pageInfo.getTotal());
        pageRespDto.setList(list);

        return pageRespDto;
    }

    /**
     * 根据 CategorySaveReqDto 来保存一个 category 记录，若 id 为空则add，不为空则更新
     */
    public void save(CategorySaveReqDto reqDto) {
        Category categoryRecord = CopyUtil.copy(reqDto, Category.class);
        if (ObjectUtils.isEmpty(categoryRecord.getId())) {  // 判断 id 是否为空
            categoryRecord.setId(snowFlake.nextId());
            categoryMapper.insertSelective(categoryRecord);
        } else {
            categoryMapper.updateByPrimaryKey(categoryRecord);
        }
    }

    public void deleteOneCategory(Long categoryId) {
        categoryMapper.deleteByPrimaryKey(categoryId);
    }
}
