package kr.zalbazo.service.user;

import java.util.List;

import kr.zalbazo.model.content.Content;
import kr.zalbazo.model.user.User;

public interface UserService {
    void register(User user);
    boolean modify(User user);
    boolean remove(String email);
    List<User> getList();
    User getUser(String email);
    Content getWriter(Long contentId);

    boolean updateEnabled(String email);
}
