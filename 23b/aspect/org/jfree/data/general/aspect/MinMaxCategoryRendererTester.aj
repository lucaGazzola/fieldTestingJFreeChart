package org.jfree.data.general.aspect;

import java.util.List;
import java.util.logging.Logger;


import org.jfree.chart.renderer.category.MinMaxCategoryRenderer;
import org.jfree.data.general.test.MinMaxCategoryRendererTestField;
import org.jfree.logging.SingletonLogger;
import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;

public aspect MinMaxCategoryRendererTester {
	
	pointcut callMinMaxCategoryRenderer(MinMaxCategoryRenderer r1): initialization(MinMaxCategoryRenderer.new(..)) && target(r1) && if(!TestFlag.testing) && if(TestFlag.instrumentationON);
	
	after(MinMaxCategoryRenderer r1): callMinMaxCategoryRenderer(r1){
		
		TestFlag.testing = true;
		
		TestStorage.r1 = r1;
		
		Logger logger = SingletonLogger.getInstance();
		
		JUnitCore jUnitCore = new JUnitCore();
        Result result = jUnitCore.run(MinMaxCategoryRendererTestField.class);
        
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
