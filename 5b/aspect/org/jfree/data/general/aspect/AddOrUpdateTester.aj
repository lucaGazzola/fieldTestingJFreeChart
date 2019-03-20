package org.jfree.data.general.aspect;

import java.util.List;
import java.util.logging.Logger;
import org.jfree.data.general.test.AddOrUpdateTestField;
import org.jfree.data.xy.XYSeries;
import org.jfree.logging.SingletonLogger;
import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;

public aspect AddOrUpdateTester {
	
	pointcut callAddOrUpdate(XYSeries series): call(* XYSeries.addOrUpdate(double, double)) && target(series) && if(!TestFlag.testing) && if(TestFlag.instrumentationON);
	
	before(XYSeries series): callAddOrUpdate(series){
		
		TestFlag.testing = true;
		
		TestStorage.series = series;
		
		Logger logger = SingletonLogger.getInstance();
		
		JUnitCore jUnitCore = new JUnitCore();
        Result result = jUnitCore.run(AddOrUpdateTestField.class);
        
        logger.info("test class: AddOrUpdateTestField");
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
