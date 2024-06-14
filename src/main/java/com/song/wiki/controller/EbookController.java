package com.song.wiki.controller;

import com.song.wiki.request.EbookQueryReq;
import com.song.wiki.request.EbookSaveReq;
import com.song.wiki.response.EbookQueryResp;
import com.song.wiki.response.PageResp;
import com.song.wiki.service.EbookService;
import com.song.wiki.utils.Result;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/ebook")
public class EbookController {

    @Resource
    private EbookService ebookService;

    @GetMapping("/list")
    public Result list(@Valid EbookQueryReq req) {
        Result<PageResp<EbookQueryResp>> result = new Result<>();
        PageResp<EbookQueryResp> list = ebookService.list(req);
        //return result.setContent(list);
        result.setContent(list);
        return result;
    }

    //for save and udate methods, we use @PostMapping
    // why should I modify the query parameter to save? because the request data are different
    // postmapping 是用json方式的提交 只有加上@RequestBody,后端才能接收到数据
    // postmapping is used for json submission, only with @RequestBody can the backend receive the data
    // if postmapping used form submission, the backend can receive the data without @annotation
    @PostMapping("/save")
    public Result save(@Valid @RequestBody EbookSaveReq req) {
        Result result = new Result<>();
        ebookService.save(req);
        return result;
    }

    @DeleteMapping(value = "/delete/{id}")
    public Result delete(@PathVariable Long id) {
        Result result = new Result<>();
        ebookService.delete(id);
        return result;
    }
}
