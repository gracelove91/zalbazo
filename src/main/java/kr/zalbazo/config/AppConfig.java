package kr.zalbazo.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

@Configuration
@Import(DBConfig.class)
@MapperScan(basePackages = "kr.zalbazo.mapper")
public class AppConfig {
}
