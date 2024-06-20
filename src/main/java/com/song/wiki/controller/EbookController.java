package com.song.wiki.controller;

import com.song.wiki.dto.req.EbookQueryReqDto;
import com.song.wiki.dto.req.EbookSaveReqDto;
import com.song.wiki.dto.resp.EbookQueryRespDto;
import com.song.wiki.dto.resp.ErrorCode;
import com.song.wiki.dto.resp.PageRespDto;
import com.song.wiki.dto.resp.RestfulModel;
import com.song.wiki.service.EbookService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;

@Api("电子书管理")
@RestController
@RequestMapping("/ebook")
public class EbookController {

    @Resource
    private EbookService ebookService;

    /**
     * @param ebookQueryReqDto query条件的参数
     * @return query到的所有ebook
     */
    @ApiOperation("对 ebook 进行query的接口")
    @GetMapping("/query")
    public RestfulModel<PageRespDto<EbookQueryRespDto>> queryEbooks(@Valid EbookQueryReqDto ebookQueryReqDto) {
        PageRespDto<EbookQueryRespDto> bookList = ebookService.queryEbooks(ebookQueryReqDto);
        return new RestfulModel<>(ErrorCode.SUCCESS, "", bookList);
    }

    /**
     * 根据请求的参数保存一个 ebook，若id非空则为更新，否则为add
     */
    @ApiOperation(value = "根据请求的参数保存一个 ebook",
            notes = "若id非空则为更新，否则为add")
    @PostMapping("/save")
    public RestfulModel<Integer> saveEbook(@RequestBody @Valid EbookSaveReqDto ebookSaveReqDto) {
        ebookService.save(ebookSaveReqDto);
        return new RestfulModel<>(ErrorCode.SUCCESS, "", 0);
    }

    @ApiOperation(value = "delete一个 ebook")
    @DeleteMapping("/delete/{ebookId}")
    public RestfulModel<Integer> deleteEbook(@PathVariable Long ebookId) {
        ebookService.deleteOneEbook(ebookId);
        return new RestfulModel<>(ErrorCode.SUCCESS, "", 0);
    }
}
