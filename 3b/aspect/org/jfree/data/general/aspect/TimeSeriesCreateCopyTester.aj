package org.jfree.data.general.aspect;

import java.util.List;
import java.util.logging.Logger;

import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;

import org.jfree.data.general.test.TimeSeriesTestField;
import org.jfree.data.time.TimeSeries;
import org.jfree.logging.SingletonLogger;

public aspect TimeSeriesCreateCopyTester {
	
	pointcut callTimeSeriesCreateCopy(int start, int end, TimeSeries timeSeries): call(* TimeSeries.createCopy(int, int)) && target(timeSeries) && args (start, end) && if(!TimeSeriesCreateCopyTestFlag.testing) && if(TimeSeriesCreateCopyTestFlag.instrumentationON);
	
	before(int start, int end, TimeSeries timeSeries): callTimeSeriesCreateCopy(start, end, timeSeries){
		
		TimeSeriesCreateCopyTestFlag.testing = true;
		
		System.out.println(start);
		System.out.println(end);
		System.out.println(timeSeries);
		
		TimeSeriesCreateCopyStorage.timeSeries = timeSeries;
		TimeSeriesCreateCopyStorage.start = start;
		TimeSeriesCreateCopyStorage.end = end;
		
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
        
        TimeSeriesCreateCopyTestFlag.testing = false;
		
	}

}
