package org.jfree.data.general.aspect;

import java.util.List;
import java.util.logging.Logger;

import org.jfree.data.category.DefaultIntervalCategoryDataset;
import org.jfree.data.general.test.DefaultIntervalCategoryDatasetTestField;
import org.jfree.logging.SingletonLogger;
import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;

public aspect DefaultIntervalCategoryDatasetTester {
	
	pointcut callDefaultIntervalCategoryDataset(DefaultIntervalCategoryDataset dataset): initialization(DefaultIntervalCategoryDataset.new(..)) && target(dataset) && if(!TestFlag.testing) && if(TestFlag.instrumentationON);
	
	after(DefaultIntervalCategoryDataset dataset): callDefaultIntervalCategoryDataset(dataset){
		
		TestFlag.testing = true;
		
		TestStorage.dataset = dataset;
		
		Logger logger = SingletonLogger.getInstance();
		
		JUnitCore jUnitCore = new JUnitCore();
        Result result = jUnitCore.run(DefaultIntervalCategoryDatasetTestField.class);
        
        logger.info("test class: DefaultIntervalCategoryDatasetTestField");
        logger.info("ran: " + result.getRunCount() + " failed: " + result.getFailureCount());
        
        List<Failure> failures = result.getFailures();
      
        if(!failures.isEmpty()) {
            for(Failure f : failures) {
                logger.info(f.getTrace());
            }
        }
        
        TestFlag.testing = false;
		
	}

}
