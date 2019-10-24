package kr.zalbazo.mapper.user;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.zalbazo.model.user.Reserve;

public interface ReserveMapper {
    void insert(Reserve reserve);
    Reserve read(String email);
    List<ReserveMapper> getList(Long hospitalId);
    int delete(Long reserveId);
    List<String> readTime(@Param("date") String date, @Param("hospitalId") String hospitalId);
   
}
