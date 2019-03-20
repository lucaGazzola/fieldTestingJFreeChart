package org.jfree.data.general.aspect;

import java.util.List;
import java.util.logging.Logger;

import org.jfree.data.general.test.TimeSeriesCreateCopyTestField;
import org.jfree.data.time.Day;
import org.jfree.data.time.RegularTimePeriod;
import org.jfree.data.time.TimeSeries;
import org.jfree.logging.SingletonLogger;
import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;

public aspect CreateCopyTester {
	
	pointcut callCreateCopy(TimeSeries series, RegularTimePeriod start, RegularTimePeriod end): call(* TimeSeries.createCopy(RegularTimePeriod, RegularTimePeriod)) && args (start, end) && target(series) && if(!TestFlag.testing) && if(TestFlag.instrumentationON);
	
	before(TimeSeries series, RegularTimePeriod start, RegularTimePeriod end): callCreateCopy(series, start, end){
		
		TestFlag.testing = true;
		
		TestStorage.series = series;
		TestStorage.start = start;
		TestStorage.end = end;
		
		Logger logger = SingletonLogger.getInstance();
		
		JUnitCore jUnitCore = new JUnitCore();
        Result result = jUnitCore.run(TimeSeriesCreateCopyTestField.class);
        
        logger.info("test class: TimeSeriesCreateCopyTestField");
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
