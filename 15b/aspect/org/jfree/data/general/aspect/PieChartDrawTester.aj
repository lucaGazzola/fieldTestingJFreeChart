package org.jfree.data.general.aspect;

import java.util.List;
import java.util.logging.Logger;

import org.jfree.chart.ChartFactory;
import org.jfree.data.general.PieDataset;
import org.jfree.data.general.test.PieChartDrawTestField;
import org.jfree.logging.SingletonLogger;
import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;

public aspect PieChartDrawTester {
	
	pointcut callJFreeChart(String title, PieDataset dataset, boolean legend, boolean tooltips, boolean urls): call(* ChartFactory.createPieChart3D(String, PieDataset, boolean, boolean, boolean)) && args(title, dataset, legend, tooltips, urls) && if(!TestFlag.testing) && if(TestFlag.instrumentationON);
	
	after(String title, PieDataset dataset, boolean legend, boolean tooltips, boolean urls): callJFreeChart(title, dataset, legend, tooltips, urls){
		
		TestFlag.testing = true;
		
		TestStorage.dataset = dataset;
		TestStorage.title = title;
		TestStorage.tooltips = tooltips;
		TestStorage.urls = urls;
		
		Logger logger = SingletonLogger.getInstance();
		
		JUnitCore jUnitCore = new JUnitCore();
        Result result = jUnitCore.run(PieChartDrawTestField.class);
        
        logger.info("test class: PieChartDrawTestField");
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
