package kr.zalbazo.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .mvcMatchers("/resources/**").permitAll()
                .mvcMatchers("/webjars/**").permitAll()
                .mvcMatchers("/", "/index").permitAll()
                .mvcMatchers("/jisikdong/*", "/community/*", "/hospital/*").hasAnyRole("user","admin")
                .anyRequest().authenticated();
        http.formLogin();
        http.httpBasic();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.inMemoryAuthentication()
                    .withUser("test").password("{noop}1234").roles("user")
                .and()
                    .withUser("admin").password("{noop}!@#$").roles("admin");
    }
}
