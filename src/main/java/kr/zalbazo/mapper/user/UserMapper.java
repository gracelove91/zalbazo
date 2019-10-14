package kr.zalbazo.mapper.user;

import java.util.List;

import kr.zalbazo.model.content.Content;
import kr.zalbazo.model.user.User;

public interface UserMapper {
    void insert(User user);
    List<User> getList();
    int delete(String userEmail);
    int update(User user);
    User getUser(String userEmail);
    Content getWriter(Long contentId);

    int updateEnabled(User user);
}
