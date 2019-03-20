package org.jfree.data.general.aspect;

import java.awt.Paint;
import java.awt.Stroke;
import java.util.List;
import java.util.logging.Logger;

import org.jfree.chart.plot.ValueMarker;
import org.jfree.data.general.test.ValueMarkerTestField;
import org.jfree.logging.SingletonLogger;
import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;

public aspect ValueMarkerTester {
	
	pointcut callValueMarkerTester(double value, Paint paint, Stroke stroke, Paint outlinePaint, Stroke outlineStroke, float alpha): initialization(ValueMarker.new(double, Paint, Stroke, Paint, Stroke, float)) && args(value, paint, stroke, outlinePaint, outlineStroke, alpha) && if(!TestFlag.testing) && if(TestFlag.instrumentationON);
	
	after(double value, Paint paint, Stroke stroke, Paint outlinePaint, Stroke outlineStroke, float alpha): callValueMarkerTester(value, paint, stroke, outlinePaint, outlineStroke, alpha){
		
		TestFlag.testing = true;
		
		TestStorage.value = value;
		TestStorage.paint = paint;
		TestStorage.stroke = stroke;
		TestStorage.outlinePaint = outlinePaint;
		TestStorage.outlineStroke = outlineStroke;
		TestStorage.alpha = alpha;
		
		Logger logger = SingletonLogger.getInstance();
		
		JUnitCore jUnitCore = new JUnitCore();
        Result result = jUnitCore.run(ValueMarkerTestField.class);
        
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
