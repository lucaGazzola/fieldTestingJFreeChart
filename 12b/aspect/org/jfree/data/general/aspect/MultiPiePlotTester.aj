package org.jfree.data.general.aspect;

import java.util.List;
import java.util.logging.Logger;

import org.jfree.chart.plot.MultiplePiePlot;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.general.test.MultiPiePlotTestField;
import org.jfree.logging.SingletonLogger;
import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;

public aspect MultiPiePlotTester {
	
	pointcut callMultiplePiePlot(MultiplePiePlot plot, CategoryDataset dataset): initialization(MultiplePiePlot.new(CategoryDataset)) && target(plot) && args(dataset) && if(!TestFlag.testing) && if(TestFlag.instrumentationON);
	
	after(MultiplePiePlot plot, CategoryDataset dataset): callMultiplePiePlot(plot, dataset){
		
		TestFlag.testing = true;
		
		TestStorage.plot = plot;
		TestStorage.dataset = dataset;
		
		Logger logger = SingletonLogger.getInstance();
		
		JUnitCore jUnitCore = new JUnitCore();
        Result result = jUnitCore.run(MultiPiePlotTestField.class);
        
        logger.info("test class: MultiPiePlotTestField");
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
