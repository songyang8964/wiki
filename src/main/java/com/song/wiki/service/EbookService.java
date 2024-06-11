package com.song.wiki.service;

import cn.hutool.core.bean.BeanUtil;
import com.song.wiki.domain.Ebook;
import com.song.wiki.domain.EbookExample;
import com.song.wiki.mapper.EbookMapper;
import com.song.wiki.request.EbookReq;
import com.song.wiki.response.EbookResp;
import com.song.wiki.utils.Result;
import javax.annotation.Resource;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class EbookService {
    @Resource
    private EbookMapper ebookMapper;

    // 如果程序代码没有错但是编译报错,那就是maven 的问题
    // if the program code is correct but the compilation error is reported, it is a problem with maven
    public List<EbookResp> list(EbookReq req) {
        EbookExample ebookExample = new EbookExample();
        EbookExample.Criteria criteria = ebookExample.createCriteria();
        criteria.andNameLike("%" + req.getName() + "%");
        List<Ebook> ebookList = ebookMapper.selectByExample(ebookExample);

        List<EbookResp> respList = new ArrayList<>();
        for (Ebook ebook : ebookList) {
            EbookResp ebookResp = new EbookResp();
            BeanUtils.copyProperties(ebook, ebookResp);
            respList.add(ebookResp);
        }
        return respList;
    }
}
