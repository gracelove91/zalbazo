package kr.zalbazo.service.user;

import kr.zalbazo.model.user.User;
import org.springframework.validation.BindingResult;

import java.util.List;

public interface UserService {

    void register(User user);
    User get(String email);
    boolean modify(User user);
    boolean remove(String email);
    List<User> getList();
}
