package org.jfree.data.general.aspect;

import java.util.List;
import java.util.logging.Logger;

import org.jfree.chart.util.ShapeList;
import org.jfree.data.general.test.MaxMiddleIndexTestField;
import org.jfree.data.time.TimePeriodValues;
import org.jfree.logging.SingletonLogger;
import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;

public aspect MaxMiddleIndexTester {
	
	pointcut callShapeList(TimePeriodValues tpv): initialization(TimePeriodValues.new(..)) && target(tpv) && if(!TestFlag.testing) && if(TestFlag.instrumentationON);
	
	after(TimePeriodValues tpv): callShapeList(tpv){
		
		TestFlag.testing = true;
		
		TestStorage.tpv = tpv;
		
		Logger logger = SingletonLogger.getInstance();
		
		JUnitCore jUnitCore = new JUnitCore();
        Result result = jUnitCore.run(MaxMiddleIndexTestField.class);
        
        logger.info("test class: MaxMiddleIndexTestField");
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
