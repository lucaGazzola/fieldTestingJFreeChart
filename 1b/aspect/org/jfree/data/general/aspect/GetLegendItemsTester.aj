package org.jfree.data.general.aspect;

import java.util.List;
import java.util.logging.Logger;

import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;
import org.jfree.chart.renderer.category.AbstractCategoryItemRenderer;
import org.jfree.data.general.test.GetLegendItemsTestField;
import org.jfree.logging.SingletonLogger;

public aspect GetLegendItemsTester {
	
	pointcut callGetLegendItems(AbstractCategoryItemRenderer r): call(* AbstractCategoryItemRenderer.getLegendItems()) && target(r) && if(!TestFlags.testing) && if(TestFlags.instrumentationON);
	
	before(AbstractCategoryItemRenderer r): callGetLegendItems(r){
		
		TestFlags.testing = true;
		
		System.out.println(r);
		
		TestStorage.render = r;
		
		Logger logger = SingletonLogger.getInstance();
		
		JUnitCore jUnitCore = new JUnitCore();
        Result result = jUnitCore.run(GetLegendItemsTestField.class);
        
        logger.info("test class: GetLegendItemsTestField");
        logger.info("ran: " + result.getRunCount() + " failed: " + result.getFailureCount());
        
        List<Failure> failures = result.getFailures();
      
        if(!failures.isEmpty()) {
            for(Failure f : failures) {
                logger.info(f.getTrace());
            }
        }
        
        TestFlags.testing = false;
		
	}

}
