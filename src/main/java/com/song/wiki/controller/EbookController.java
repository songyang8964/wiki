package com.song.wiki.controller;

import com.song.wiki.domain.Ebook;
import com.song.wiki.request.EbookReq;
import com.song.wiki.response.EbookResp;
import com.song.wiki.service.EbookService;
import com.song.wiki.utils.Result;
import javax.annotation.Resource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/ebook")
public class EbookController {

    @Resource
    private EbookService ebookService;

    @GetMapping("/list")
    public Result list(EbookReq req) {
        Result<List<EbookResp>> result = new Result<>();
        List<EbookResp> list = ebookService.list(req);
        //return result.setContent(list);
        result.setContent(list);
        return result;
    }
}
