package org.jfree.data.general.aspect;

import java.util.List;
import java.util.logging.Logger;

import org.jfree.chart.plot.CategoryPlot;
import org.jfree.data.general.test.SetDomainAxisTestField;
import org.jfree.logging.SingletonLogger;
import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;

public aspect SetDomainAxisTester {
	
	pointcut callSetDomainAxis(CategoryPlot plot): call(* CategoryPlot.setDomainAxis(..)) && target(plot) && if(!TestFlag.testing) && if(TestFlag.instrumentationON);
	
	before(CategoryPlot plot): callSetDomainAxis(plot){
		
		TestFlag.testing = true;
		
		TestStorage.plot = plot;
		
		Logger logger = SingletonLogger.getInstance();
		
		JUnitCore jUnitCore = new JUnitCore();
        Result result = jUnitCore.run(SetDomainAxisTestField.class);
        
        logger.info("test class: SetDomainAxisTestField");
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
