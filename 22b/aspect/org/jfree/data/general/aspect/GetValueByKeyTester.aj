package org.jfree.data.general.aspect;


import java.util.List;
import java.util.logging.Logger;

import org.jfree.data.KeyedObjects2D;
import org.jfree.data.general.test.GetValueByKeyTestField;
import org.jfree.data.statistics.DefaultBoxAndWhiskerCategoryDataset;
import org.jfree.logging.SingletonLogger;
import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;

public aspect GetValueByKeyTester {
	
	pointcut callAdd(Object list, Comparable rowKey, Comparable columnKey, KeyedObjects2D dataset): call(* KeyedObjects2D.addObject(Object, Comparable, Comparable)) && args(list, rowKey, columnKey) && target(dataset) && if(!TestFlag.testing) && if(TestFlag.instrumentationON);
	
	before(Object list, Comparable rowKey, Comparable columnKey, KeyedObjects2D dataset): callAdd(list, rowKey, columnKey, dataset){
		
		TestFlag.testing = true;
		
		TestStorage.dataset = dataset;
		TestStorage.rowKey = rowKey;
		TestStorage.columnKey = columnKey;
		TestStorage.list = list;
		
		Logger logger = SingletonLogger.getInstance();
		
		JUnitCore jUnitCore = new JUnitCore();
        Result result = jUnitCore.run(GetValueByKeyTestField.class);
        
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
