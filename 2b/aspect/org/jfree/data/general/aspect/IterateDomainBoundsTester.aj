package org.jfree.data.general.aspect;

import java.util.List;
import java.util.logging.Logger;

import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;

import org.jfree.data.general.DatasetUtilities;
import org.jfree.data.general.test.DatasetUtilitiesTestField;
import org.jfree.data.xy.XYDataset;
import org.jfree.logging.SingletonLogger;

public aspect IterateDomainBoundsTester {
	
	pointcut callIterateDomainBounds(XYDataset dataset, boolean includeInterval): 
		call(* DatasetUtilities.iterateDomainBounds(XYDataset, boolean)) && 
		args (dataset, includeInterval) && if(!TestFlags.testing) && if(TestFlags.instrumentationON);
	
	before(XYDataset dataset, boolean includeInterval): callIterateDomainBounds(dataset, includeInterval){
		
		TestFlags.testing = true;
		
		TestStorage.dataset = dataset;
		
		Logger logger = SingletonLogger.getInstance();
		
		JUnitCore jUnitCore = new JUnitCore();
        Result result = jUnitCore.run(DatasetUtilitiesTestField.class);
        Result result1 = jUnitCore.run(DatasetUtilitiesTestField.class);
        
        if(result1.equals(result)) {
        
        	logger.info("test class: DatasetUtilitiesTestField");
        	logger.info("ran: " + result.getRunCount() + " failed: " + result.getFailureCount());
        
        	List<Failure> failures = result.getFailures();
      
        	if(!failures.isEmpty()) {
        		for(Failure f : failures) {
        			logger.info(f.getTrace());
        		}
        	}
        }
        
        TestFlags.testing = false;
		
	}

}
