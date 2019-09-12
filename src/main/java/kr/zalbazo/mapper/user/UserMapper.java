package kr.zalbazo.mapper.user;

import kr.zalbazo.model.user.User;

import java.util.List;

public interface UserMapper {
    void insert(User user);
    User read(String email);
    List<User> getList();
    int delete(String email);
    int update(User user);

    int updateEnabled(User user);
}
