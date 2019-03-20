package org.jfree.data.general.aspect;

import java.util.List;
import java.util.logging.Logger;

import org.jfree.chart.plot.XYPlot;
import org.jfree.data.general.test.SetNullRendererTestField;
import org.jfree.logging.SingletonLogger;
import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;

public aspect CreateScatterPlotTester {
	
	pointcut callSetRenderer(XYPlot plot): call(* XYPlot.setRenderer(..)) && target(plot) && if(!TestFlag.testing) && if(TestFlag.instrumentationON);
	
	before(XYPlot plot): callSetRenderer(plot){
		
		TestFlag.testing = true;
		
		TestStorage.plot = plot;
		
		Logger logger = SingletonLogger.getInstance();
		
		JUnitCore jUnitCore = new JUnitCore();
        Result result = jUnitCore.run(SetNullRendererTestField.class);
        
        logger.info("test class: CreateScatterPlotTestField");
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
