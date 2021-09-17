package com.pjt.ex22.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.mchange.v2.c3p0.ComboPooledDataSource;

@Configuration
public class DBConfig {
	
//	<beans:bean id="dataSource" class="com.mchange.v2.c3p0.ComboPooledDataSource">
//	<beans:property name="driverClass" value="oracle.jdbc.driver.OracleDriver" />
//	<beans:property name="jdbcUrl" value="jdbc:oracle:thin:@localhost:1521:xe" />
//	<beans:property name="user" value="scott" />
//	<beans:property name="password" value="tiger" />
	
	@Bean
	public ComboPooledDataSource dataSource() throws Exception{
		ComboPooledDataSource dataSource = new ComboPooledDataSource();
		dataSource.setDriverClass("oracle.jdbc.driver.OracleDriver");
		dataSource.setJdbcUrl("jdbc:oracle:thin:@localhost:1521:xe");
		dataSource.setUser("scott");
		dataSource.setPassword("tiger");
		return dataSource;
	}
}
