package kr.zalbazo.service.user;

import kr.zalbazo.mapper.user.UserMapper;
import kr.zalbazo.model.user.User;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public void register(User user) {
        userMapper.insert(user);
    }

    @Override
    public User get(String email) {
        return userMapper.read(email);
    }

    @Override
    public boolean modify(User user) {
        return userMapper.update(user) == 1;
    }

    @Override
    public boolean remove(String email) {
        return userMapper.delete(email) == 1;
    }

    @Override
    public List<User> getList() {
        return userMapper.getList();
    }

}
