package ifua.pu.mathmaps.config;

import java.util.Properties;
import org.apache.commons.dbcp.BasicDataSource;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.*;
import org.springframework.core.env.Environment;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@EnableWebMvc
@Configuration
@ComponentScan({ "ifua.pu.mathmaps.*" })
@EnableTransactionManagement
@Import({ SecurityConfig.class })
@PropertySource("classpath:database.properties")
public class HibernateConfig {

    @Autowired
    Environment env;

    @Bean
    public SessionFactory sessionFactory() {
        LocalSessionFactoryBuilder builder =
                new LocalSessionFactoryBuilder(dataSource());
        builder.scanPackages("ifua.pu.mathmaps.model")
                .addProperties(getHibernateProperties());

        return builder.buildSessionFactory();
    }

    private Properties getHibernateProperties() {
        Properties prop = new Properties();
        prop.put("hibernate.format_sql", "true");
        prop.put("hibernate.show_sql", env.getProperty("show_sql"));
        prop.put("hibernate.dialect", env.getProperty("dialect"));
        prop.put("hibernate.enable_lazy_load_no_trans", env.getProperty("enable_lazy_load_no_trans"));
        prop.put("hibernate.connection.CharSet", env.getProperty("charSet"));
        prop.put("hibernate.connection.characterEncoding", env.getProperty("characterEncoding"));
        prop.put("hibernate.connection.useUnicode", env.getProperty("useUnicode"));
        prop.put("hibernate.hbm2ddl.auto", env.getProperty("hbm2ddl.auto"));
        return prop;
    }

    @Bean(name = "dataSource")
    public BasicDataSource dataSource() {
        BasicDataSource ds = new BasicDataSource();
        ds.setDriverClassName(env.getProperty("driverClassName"));
        ds.setUrl(env.getProperty("url"));
        ds.setUsername(env.getProperty("jdbc.username"));
        ds.setPassword(env.getProperty("jdbc.password"));
        return ds;
    }

    //Create a transaction manager
    @Bean
    public HibernateTransactionManager txManager() {
        return new HibernateTransactionManager(sessionFactory());
    }

}
