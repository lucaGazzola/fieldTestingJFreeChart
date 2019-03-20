package org.jfree.data.general.aspect;

import java.util.List;
import java.util.logging.Logger;

import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.ValueAxis;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.renderer.category.CategoryItemRenderer;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.general.test.CategoryPlotTestField;
import org.jfree.logging.SingletonLogger;
import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;

public aspect CategoryPlotTester {
	
	pointcut callCategoryPlot(CategoryPlot plot, CategoryDataset dataset, CategoryAxis catax, ValueAxis numax, CategoryItemRenderer sbr): initialization(CategoryPlot.new(CategoryDataset, CategoryAxis, ValueAxis, CategoryItemRenderer)) && target(plot) && args(dataset, catax, numax, sbr) && if(!TestFlag.testing) && if(TestFlag.instrumentationON);
	
	after(CategoryPlot plot, CategoryDataset dataset, CategoryAxis catax, ValueAxis numax, CategoryItemRenderer sbr): callCategoryPlot(plot, dataset, catax, numax, sbr){
		
		TestFlag.testing = true;
		
		TestStorage.plot = plot;
		
		Logger logger = SingletonLogger.getInstance();
		
		JUnitCore jUnitCore = new JUnitCore();
        Result result = jUnitCore.run(CategoryPlotTestField.class);
        
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
