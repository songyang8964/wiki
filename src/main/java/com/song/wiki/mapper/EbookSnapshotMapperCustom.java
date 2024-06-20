package com.song.wiki.mapper;

import com.song.wiki.dto.resp.StatisticRespDto;

import java.util.List;

public interface EbookSnapshotMapperCustom {
    void genSnapshot();

    List<StatisticRespDto> getStatistic();

    List<StatisticRespDto> get30DayStatistic();
}
