package com.song.wiki.mapper;

import com.song.wiki.domain.Test;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TestMapper {

    List<Test> list();
}
