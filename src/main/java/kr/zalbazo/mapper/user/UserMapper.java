package kr.zalbazo.mapper.user;

import java.util.List;

import kr.zalbazo.model.user.User;

public interface UserMapper {
    void insert(User user);
    User read(String email);
    List<User> getList();
    int delete(String email);
    int update(User user);

    int updateEnabled(User user);
    User getUser(String userEmail);
}
