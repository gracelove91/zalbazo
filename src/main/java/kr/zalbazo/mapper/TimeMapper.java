package kr.zalbazo.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

public interface TimeMapper {

    @Select("SELECT sysdate from dual")
    public String getTime2();

    public String getTime();
}
