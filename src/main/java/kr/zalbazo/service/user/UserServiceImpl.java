package kr.zalbazo.service.user;

import kr.zalbazo.mapper.user.UserMapper;
import kr.zalbazo.model.user.User;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j
public class UserServiceImpl implements UserService, UserDetailsService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private PasswordEncoder encoder;

    @Transactional
    @Override
    public void register(User user) {
        String uuid = UUID.randomUUID().toString();
        user.setEmailAuthKey(uuid);

        try {
            sendEmail(user);
        } catch (MessagingException | UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        user.encodePassword(encoder);


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

    @Override
    public boolean updateEnabled(String email) {
        User user = get(email);
        user.setEmailAuthKey("");
        user.setEnabled("enabled");

        return userMapper.updateEnabled(user) == 1;
    }

    @Override
    public UserDetails loadUserByUsername(String userEmail) throws UsernameNotFoundException {
        User user = userMapper.read(userEmail);

        if(user == null){
            throw new UsernameNotFoundException(userEmail);
        }

        return org.springframework.security.core.userdetails.User.builder()
                .username(user.getEmail())
                .password(user.getPassword())
                .roles(user.getRole())
                .build();
    }
}
