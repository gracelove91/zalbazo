package kr.zalbazo.config;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

import javax.sql.DataSource;

@Configuration
@PropertySource("classpath:application-dev.properties")
public class DBConfig {

    @Value("${jdbc.driver-class}")
    String driverClass;

    @Value("${jdbc.url}")
    String jdbcUrl;

    @Value("${jdbc.username}")
    String username;

    @Value("${jdbc.password}")
    String password;


    @Bean
    public DataSource dataSource() {

        HikariConfig config = new HikariConfig();
        config.setDriverClassName(this.driverClass);
        config.setJdbcUrl(this.jdbcUrl);
        config.setUsername(this.username);
        config.setPassword(this.password);

        return new HikariDataSource(config);
    }

    @Bean
    public SqlSessionFactory sqlSessionFactory() throws Exception {
        SqlSessionFactoryBean sqlSessionFactory = new SqlSessionFactoryBean();
        sqlSessionFactory.setDataSource(dataSource());

        return sqlSessionFactory.getObject();

    }
}
