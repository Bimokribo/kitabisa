import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import  static org.junit.Assert.assertEquals;

public class TestRunner {

   public static void generateReport(String karateOutputPath) {
       Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
       List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
       jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
       Configuration configuration = new Configuration(new File("target"), "src/test/java");
       ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, configuration);
       reportBuilder.generateReports();
   }

   @Test
   public void runTestParallel() {
       Results results = Runner.path("classpath:posts")
               .outputCucumberJson(true)
               .parallel(2);
       generateReport(results.getReportDir());
       assertEquals(results.getErrorMessages(), 0, results.getFailCount());
   }
}