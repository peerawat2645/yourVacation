package th.ac.ku.kps.eng.cpe.ds.project.yourvacation;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@ComponentScan("th.ac.ku.kps.eng.cpe.ds.project")
@EnableJpaRepositories("th.ac.ku.kps.eng.cpe.ds.project.repository")
public class YourvacationApplication extends SpringBootServletInitializer{

	public static void main(String[] args) {
		SpringApplication.run(YourvacationApplication.class, args);
	}

}
