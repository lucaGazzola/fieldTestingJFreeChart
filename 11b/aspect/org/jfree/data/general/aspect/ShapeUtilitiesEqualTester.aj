package org.jfree.data.general.aspect;

import java.awt.geom.GeneralPath;
import java.util.List;
import java.util.logging.Logger;

import org.jfree.chart.imagemap.StandardToolTipTagFragmentGenerator;
import org.jfree.chart.util.ShapeUtilities;
import org.jfree.data.general.test.ShapeUtilitiesEqualsTestField;
import org.jfree.logging.SingletonLogger;
import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;

public aspect ShapeUtilitiesEqualTester {
	
	pointcut callShapeUtilitiesEquals(GeneralPath p1, GeneralPath p2): call(* ShapeUtilities.equal(GeneralPath, GeneralPath)) && args (p1,p2) && if(!TestFlag.testing) && if(TestFlag.instrumentationON);
	
	before(GeneralPath p1, GeneralPath p2): callShapeUtilitiesEquals(p1, p2){
		
		TestFlag.testing = true;
		
		TestStorage.p1 = p1;
		TestStorage.p2 = p2;
		
		Logger logger = SingletonLogger.getInstance();
		
		JUnitCore jUnitCore = new JUnitCore();
        Result result = jUnitCore.run(ShapeUtilitiesEqualsTestField.class);
        
        logger.info("test class: ShapeUtilitiesEqualsTestField");
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
