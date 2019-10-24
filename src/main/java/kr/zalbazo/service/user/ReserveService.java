package kr.zalbazo.service.user;


import java.util.List;

import kr.zalbazo.model.user.Reserve;

public interface ReserveService {
    void register(Reserve reserve);
    Reserve get(String email);
    boolean remove(Long reserveId);
    List<Reserve> getList();
    List<String> getTime(String date, String hospitalId);
}
