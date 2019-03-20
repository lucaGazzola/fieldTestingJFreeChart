package org.jfree.data.general.aspect;

import java.util.List;
import java.util.logging.Logger;

import org.jfree.chart.renderer.GrayPaintScale;
import org.jfree.data.general.test.GrayPaintScaleTestField;
import org.jfree.logging.SingletonLogger;
import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;

public aspect GrayPaintScaleTester {
	
	pointcut callGrayPaintScale(GrayPaintScale gps): initialization(GrayPaintScale.new(..)) && target(gps) && if(!TestFlag.testing) && if(TestFlag.instrumentationON);
	
	after(GrayPaintScale gps): callGrayPaintScale(gps){
		
		TestFlag.testing = true;
		
		TestStorage.gps = gps;
		
		Logger logger = SingletonLogger.getInstance();
		
		JUnitCore jUnitCore = new JUnitCore();
        Result result = jUnitCore.run(GrayPaintScaleTestField.class);
        
        logger.info("test class: ValueMarkerTestField");
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
