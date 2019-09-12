package kr.zalbazo.config;


import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.PropertySource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

import java.util.Properties;
@PropertySource("classpath:mail.properties")
public class MailConfig {

    @Value("mail.host")
    private String host;
    @Value("mail.port")
    private int port;
    @Value("mail.username")
    private String username;
    @Value("mail.password")
    private String password;

    @Bean
    public JavaMailSender mailSender(){
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost(host);
        mailSender.setPort(port);

        mailSender.setUsername(username);
        mailSender.setPassword(password);


        Properties properties = new Properties();
        properties.setProperty("mail.transport.protocol", "smtp");
        properties.setProperty("mail.transport.auth", "true");
        properties.setProperty("mail.transport.starttls.enable", "true");
        properties.setProperty("mail.debug", "true");

        mailSender.setJavaMailProperties(properties);

        return mailSender;
    }
}
