package kr.zalbazo.config;

import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;

@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Bean
    public PasswordEncoder passwordEncoder(){
        return PasswordEncoderFactories.createDelegatingPasswordEncoder();
    }
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable();

        http.authorizeRequests()
                .mvcMatchers("/resources/**").permitAll()
                .mvcMatchers("/webjars/**").permitAll()
                .mvcMatchers("/user/**").permitAll()
                .mvcMatchers("/", "/index").permitAll()
//                .mvcMatchers("/jisikdong/**", "/community/**", "/hospital/**").hasAnyRole("user","admin")
                .mvcMatchers("/jisikdong/**", "/community/**", "/hospital/**").permitAll()
                .mvcMatchers("/admin/**").hasRole("admin")
                .anyRequest().authenticated();


        http.formLogin();
        http.httpBasic();
    }

//    @Override
//    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//        auth.inMemoryAuthentication()
//                    .withUser("test").password("{noop}1234").roles("user")
//                .and()
//                    .withUser("admin").password("{noop}!@#$").roles("admin");
//    }
}
