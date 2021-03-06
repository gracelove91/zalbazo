package kr.zalbazo.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.access.expression.SecurityExpressionHandler;
import org.springframework.security.access.hierarchicalroles.RoleHierarchyImpl;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.expression.DefaultWebSecurityExpressionHandler;

@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private UserDetailsService userServiceImpl;
    
    @Override
    protected void configure(HttpSecurity http) throws Exception {
//        http.csrf().ignoringAntMatchers("/user/jusoPopup/**");

        http.csrf().disable();

        http.authorizeRequests()
                .mvcMatchers("/hospitalinfo/register").anonymous();

        http.authorizeRequests()
                .mvcMatchers("/").permitAll()
                .mvcMatchers("/login").anonymous()
                .mvcMatchers("/user/register/**", "/user/jusoPopup").permitAll()
                .mvcMatchers("/**/register").hasAnyRole("user","admin","hospital") // 이런 패턴들을 모두 허용 (권한을 가지면)
                .mvcMatchers("/user/mypage").hasAnyRole("user","admin","hospital")
                .mvcMatchers("/jisikdong", "/jisikdong/list", "/jisikdong/get").permitAll()
                .mvcMatchers("/community", "/community/list", "/community/get").permitAll()
                .mvcMatchers("/hospital", "/hospital/list", "/hospital/get").permitAll()
                .mvcMatchers("/admin/**").hasRole("admin")
                .anyRequest().permitAll()
                .expressionHandler(expressionHandler());

        http.formLogin()
                .loginPage("/login")
                .usernameParameter("user-email");
        http.logout()
                .logoutSuccessUrl("/");
        http.httpBasic();

        http.rememberMe().key("remember-me-sample").userDetailsService(userServiceImpl);
    }

    private SecurityExpressionHandler<FilterInvocation> expressionHandler() {
        RoleHierarchyImpl roleHierarchy = new RoleHierarchyImpl();
        
        roleHierarchy.setHierarchy("ROLE_admin > ROLE_user");
        roleHierarchy.setHierarchy("ROLE_hospital > ROLE_user");
        

        DefaultWebSecurityExpressionHandler handler = new DefaultWebSecurityExpressionHandler();
        handler.setRoleHierarchy(roleHierarchy);

        return handler;
    }
    

    
    @Override
    public void configure(WebSecurity web)  { // 시큐리티 관련 필터 적용 없이 바로 들어오는 게 가능한 애들
        web.ignoring().mvcMatchers("/resources/**");
        web.ignoring().mvcMatchers("/webjars/**");
    }

    @Bean
    public PasswordEncoder passwordEncoder(){
        return PasswordEncoderFactories.createDelegatingPasswordEncoder();
    }
}