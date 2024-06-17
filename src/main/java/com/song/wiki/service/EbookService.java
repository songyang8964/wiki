package com.song.wiki.service;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.song.wiki.domain.Ebook;
import com.song.wiki.domain.EbookExample;
import com.song.wiki.mapper.EbookMapper;
import com.song.wiki.request.EbookQueryReq;
import com.song.wiki.request.EbookSaveReq;
import com.song.wiki.response.EbookQueryResp;
import com.song.wiki.response.PageResp;

import javax.annotation.Resource;

import com.song.wiki.utils.CopyUtil;
import com.song.wiki.utils.SnowFlake;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

import java.util.ArrayList;
import java.util.List;

@Service
public class EbookService {
    private static final Logger LOG = LoggerFactory.getLogger(EbookService.class);
    @Resource
    private EbookMapper ebookMapper;
    @Resource
    private SnowFlake snowFlake;

    // 如果程序代码没有错但是编译报错,那就是maven 的问题
    // if the program code is correct but the compilation error is reported, it is a problem with maven
    public PageResp<EbookQueryResp> list(EbookQueryReq req) {

        EbookExample ebookExample = new EbookExample();
        EbookExample.Criteria criteria = ebookExample.createCriteria();
        if (!ObjectUtils.isEmpty(req.getName())) {
            criteria.andNameLike("%" + req.getName() + "%");
        }
        if(!ObjectUtils.isEmpty(req.getCategoryId2())&&req.getCategoryId2() >0){
            criteria.andCategory2IdEqualTo(req.getCategoryId2());
        }
        //  page query
        PageHelper.startPage(req.getPage(), req.getSize());
        List<Ebook> ebookList = ebookMapper.selectByExample(ebookExample);

        PageInfo<Ebook> pageInfo = new PageInfo<>(ebookList);
        LOG.info("Total rows: {}", pageInfo.getTotal());
        LOG.info("Total pages: {}", pageInfo.getPages());
        List<EbookQueryResp> respList = new ArrayList<>();
        for (Ebook ebook : ebookList) {
            EbookQueryResp ebookQueryResp = new EbookQueryResp();
            BeanUtils.copyProperties(ebook, ebookQueryResp);
            respList.add(ebookQueryResp);
        }
        PageResp<EbookQueryResp> pageResp = new PageResp<>();
        pageResp.setTotal(pageInfo.getTotal());
        pageResp.setList(respList);
        return pageResp;
    }

    /**
     * 保存分为新增保存和编辑保存,这里是编辑保存实际上需要用update
     *
     * @param req
     */
    public void save(EbookSaveReq req) {
        Ebook ebook = CopyUtil.copy(req, Ebook.class);
        if (ObjectUtils.isEmpty(req.getId())) {
            ebook.setId(snowFlake.nextId());
            // insert
            ebookMapper.insert(ebook);

        } else {
            // update
            ebookMapper.updateByPrimaryKey(ebook);
        }
    }

    public void delete(Long id) {
        ebookMapper.deleteByPrimaryKey(id);
    }
}