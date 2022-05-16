package runner;

import com.intuit.karate.junit5.Karate;

public class TestRunner {

    @Karate.Test
    Karate runScenario() {
        return Karate.run("classpath:features/project01").tags("@tc005");
    }
}