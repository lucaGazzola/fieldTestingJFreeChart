package org.jfree.data.general.test;

import org.jfree.data.general.aspect.TestStorage;
import org.jfree.data.time.TimeSeries;
import org.jfree.data.time.Year;

import junit.framework.TestCase;

public class TimeSeriesTestField extends TestCase {
	
	// Adapted from TimeSeriesTests.testClone2()
	
    public void testClone2() {
    	TimeSeries s1 = TestStorage.series;
    	TimeSeries s2 = null;
    	try {
    		s2 = (TimeSeries) s1.clone();
    	}
    	catch (CloneNotSupportedException e) {
    		e.printStackTrace();
    	}
    	assertTrue(s1.equals(s2));
    	
    	// check independence
    	s2.addOrUpdate(new Year(2009), 300.0);
    	assertFalse(s1.equals(s2));

    }
}
