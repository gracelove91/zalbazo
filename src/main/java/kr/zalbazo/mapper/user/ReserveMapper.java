package kr.zalbazo.mapper.user;

import kr.zalbazo.model.user.Reserve;

import java.util.List;

public interface ReserveMapper {
    void insert(Reserve reserve);
    Reserve read(String email);
    List<ReserveMapper> getList(Long hospitalId);
    int delete(Long reserveId);
    List<String> readTime(String date);
   
}
