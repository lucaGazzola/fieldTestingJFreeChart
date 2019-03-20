package org.jfree.data.general.aspect;

import java.util.List;
import java.util.logging.Logger;

import org.jfree.chart.util.ShapeList;
import org.jfree.data.general.test.ShapeListTestField;
import org.jfree.logging.SingletonLogger;
import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;

public aspect ShapeListTester {
	
	pointcut callShapeList(ShapeList shapeList): initialization(ShapeList.new(..)) && target(shapeList) && if(!TestFlag.testing) && if(TestFlag.instrumentationON);
	
	after(ShapeList shapeList): callShapeList(shapeList){
		
		TestFlag.testing = true;
		
		TestStorage.shapeList = shapeList;
		
		Logger logger = SingletonLogger.getInstance();
		
		JUnitCore jUnitCore = new JUnitCore();
        Result result = jUnitCore.run(ShapeListTestField.class);
        
        logger.info("test class: ShapeListTestField");
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
