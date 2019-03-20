package org.jfree.data.general.aspect;

import java.util.List;
import java.util.logging.Logger;

import org.jfree.chart.imagemap.StandardToolTipTagFragmentGenerator;
import org.jfree.data.general.test.ToolTipFragmentTestField;
import org.jfree.logging.SingletonLogger;
import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;

public aspect ToolTipFragmentTester {
	
	pointcut callGenerateToolTipFragment(StandardToolTipTagFragmentGenerator generator, String tooltip): call(* StandardToolTipTagFragmentGenerator.generateToolTipFragment(String)) && args (tooltip) && target(generator) && if(!TestFlag.testing) && if(TestFlag.instrumentationON);
	
	before(StandardToolTipTagFragmentGenerator generator, String tooltip): callGenerateToolTipFragment(generator, tooltip){
		
		TestFlag.testing = true;
		
		TestStorage.generator = generator;
		TestStorage.tooltip = tooltip;
		
		Logger logger = SingletonLogger.getInstance();
		
		JUnitCore jUnitCore = new JUnitCore();
        Result result = jUnitCore.run(ToolTipFragmentTestField.class);
        
        logger.info("test class: ToolTipFragmentTestField");
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
