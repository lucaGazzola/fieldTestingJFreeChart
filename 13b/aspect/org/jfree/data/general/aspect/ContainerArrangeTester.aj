package org.jfree.data.general.aspect;

import java.awt.Graphics2D;
import java.util.List;
import java.util.logging.Logger;

import org.jfree.chart.block.BlockContainer;
import org.jfree.chart.block.RectangleConstraint;
import org.jfree.data.general.test.ContainerArrangeTestField;
import org.jfree.logging.SingletonLogger;
import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;

public aspect ContainerArrangeTester {
	
	pointcut callContainerArrange(RectangleConstraint constraint, Graphics2D graphics, BlockContainer container): call(* BlockContainer.arrange(Graphics2D, RectangleConstraint)) && args(graphics, constraint) && target(container) && if(!TestFlag.testing) && if(TestFlag.instrumentationON);
	
	before(RectangleConstraint constraint, Graphics2D graphics, BlockContainer container): callContainerArrange(constraint, graphics, container){
		
		TestFlag.testing = true;
		
		TestStorage.container = container;
		TestStorage.graphics = graphics;
		TestStorage.constraint = constraint;
		
		Logger logger = SingletonLogger.getInstance();
		
		JUnitCore jUnitCore = new JUnitCore();
        Result result = jUnitCore.run(ContainerArrangeTestField.class);
        
        logger.info("test class: ContainerArrangeTestField");
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
