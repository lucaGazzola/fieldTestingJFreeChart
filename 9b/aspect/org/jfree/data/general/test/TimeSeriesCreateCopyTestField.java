package org.jfree.data.general.test;

import org.jfree.data.general.aspect.TestStorage;
import org.jfree.data.time.TimeSeries;

import junit.framework.TestCase;

public class TimeSeriesCreateCopyTestField extends TestCase {
	
	// Adapted from TimeSeriesTests.testCreateCopy1()
	
	public void testCreateCopy1() {

        TimeSeries series = TestStorage.series;
        try {
            TimeSeries result1 = series.createCopy(TestStorage.start, TestStorage.end);
            assertNotNull(result1);
        }catch (CloneNotSupportedException e) {
            assertTrue(false);
        }
	}
        
        
        
}
