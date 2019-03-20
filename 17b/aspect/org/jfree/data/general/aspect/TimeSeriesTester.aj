package org.jfree.data.general.aspect;

import java.util.List;
import java.util.logging.Logger;

import org.jfree.data.category.DefaultIntervalCategoryDataset;
import org.jfree.data.general.test.TimeSeriesTestField;
import org.jfree.data.time.TimeSeries;
import org.jfree.logging.SingletonLogger;
import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;

public aspect TimeSeriesTester {
	
	pointcut callTimeSeries(TimeSeries series): initialization(TimeSeries.new(..)) && target(series) && if(!TestFlag.testing) && if(TestFlag.instrumentationON);
	
	after(TimeSeries series): callTimeSeries(series){
		
		TestFlag.testing = true;
		
		TestStorage.series = series;
		
		Logger logger = SingletonLogger.getInstance();
		
		JUnitCore jUnitCore = new JUnitCore();
        Result result = jUnitCore.run(TimeSeriesTestField.class);
        
        logger.info("test class: TimeSeriesTestField");
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
