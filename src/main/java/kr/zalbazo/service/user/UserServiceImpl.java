package kr.zalbazo.service.user;

import kr.zalbazo.common.MailHandler;
import kr.zalbazo.exception.EmailConfirmFirstException;
import kr.zalbazo.mapper.user.UserMapper;
import kr.zalbazo.model.content.Content;
import kr.zalbazo.model.user.User;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.mail.MessagingException;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.UUID;

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

        Thread thread = new Thread(()->{
            try {
                sendEmail(user);
            } catch (MessagingException e) {
                e.printStackTrace();
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        });
        thread.start();

        user.encodePassword(encoder);


        userMapper.insert(user);
    }

    private void sendEmail(User user) throws MessagingException, UnsupportedEncodingException {
        MailHandler sendMail = new MailHandler(mailSender);
        sendMail.setSubject("잘바조 회원가입 인증 메일입니다.");
        sendMail.setText(
                "<h1>아래의 링크를 클릭해주세요</h1>" +
                        "<a href='http://localhost:8080/user/emailConfirm?userEmail=" +
                        user.getUserEmail() +
                        "&emailAuthKey=" + user.getEmailAuthKey() +
                        "' target='_blank'>이메일 인증 확인</a>"
        );

        sendMail.setFrom("zalbazo125@gmail.com", "zalbazo");
        sendMail.setTo(user.getUserEmail());
        sendMail.send();
    }

    @Override
    public User getUser(String userEmail) {
        return userMapper.getUser(userEmail);
    }

    @Override
    public boolean modify(User user) {
        return userMapper.update(user) == 1;
    }

    @Override
    public boolean remove(String userEmail) {
        return userMapper.delete(userEmail) == 1;
    }

    @Override
    public List<User> getList() {
        return userMapper.getList();
    }

    @Override
    public boolean updateEnabled(String userEmail) {
        User user = getUser(userEmail);
        user.setEmailAuthKey("");
        user.setEnabled("enabled");

        return userMapper.updateEnabled(user) == 1;
    }

    @Override
    public UserDetails loadUserByUsername(String userEmail) throws UsernameNotFoundException {
        User user = userMapper.getUser(userEmail);

        if (user == null) {
            throw new UsernameNotFoundException(userEmail);
        }

        if (user.getEnabled() == null) {
            throw new EmailConfirmFirstException(userEmail);
        }

        return org.springframework.security.core.userdetails.User.builder()
                .username(user.getUserEmail())
                .password(user.getPassword())
                .roles(user.getRole())
                .build();
    }

	@Override
	public Content getWriter(Long contentId) {
		return userMapper.getWriter(contentId);
	}
    
}