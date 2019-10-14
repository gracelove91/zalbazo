package kr.zalbazo.mapper.user;

import java.util.List;

import kr.zalbazo.model.content.Content;
import kr.zalbazo.model.user.User;

public interface UserMapper {
    void insert(User user);
<<<<<<< HEAD
    User getUser(String email);
=======
>>>>>>> 6fcd3a42383c488effd3675864d9631a22adc872
    List<User> getList();
    int delete(String email);
    int update(User user);
    User getUser(String email);
    Content getWriter(Long contentId);

    int updateEnabled(User user);
}
