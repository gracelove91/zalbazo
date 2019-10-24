package kr.zalbazo.dummy;

import kr.zalbazo.mapper.user.UserMapper;
import kr.zalbazo.model.user.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/root-context.xml")
public class DummyUser {

    String[] prefixes = {
            "생각이 ",
            "노력이 ",
            "열정이 ",
            "마음이 ",
            "사랑이 ",
    };

    String[] middle = {
            "많은 ", "복잡한 ", "따뜻한 ", "차가운 ", "좋은 ", "훌륭한 ", "넘치는 "
    };

    String[] suffixes = {
            "김은진", "김성은", "김태완", "윤혜리", "정하영", "홍은모"
    };

    @Autowired
    private UserMapper mapper;


    @Test
    @Transactional
    public void create_user() {
        for(int i = 0; i < 10; i ++) {
            String username = createDummyName();
            User user = User.builder()
                    .userEmail(username)
                    .password("123")
                    .role("user")
                    .build();
            mapper.insert(user);
        }
    }

    private String createDummyName() {
        int prefixIndex = (int)(Math.random() * prefixes.length);
        int middleIndex = (int)(Math.random() * middle.length);
        int suffixIndex = (int)(Math.random() * suffixes.length);
        int lastIndex = (int)(Math.random() * 10);

        return prefixes[prefixIndex] + middle[middleIndex] + suffixes[suffixIndex] + lastIndex;
    }
}
