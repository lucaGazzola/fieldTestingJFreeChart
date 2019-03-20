package org.jfree.data.general.test;

import junit.framework.TestCase;

import org.jfree.data.general.aspect.TimeSeriesCreateCopyStorage;
import org.jfree.data.time.TimeSeries;

public class TimeSeriesTestField extends TestCase {
	
	// Adapted from TimeSeriesTests.createCopy3() 
	// this is the test cases that already exposes the bug in-house,
	// getMinY() and getMaxY() were not used in combination with createCopy()
	// in any other test case.
	public void testCreateCopy3() throws CloneNotSupportedException {
        
		TimeSeries s1 = TimeSeriesCreateCopyStorage.timeSeries;
		int start = TimeSeriesCreateCopyStorage.start;
		int end = TimeSeriesCreateCopyStorage.end;
				
		double min = 0;
		double max = 0;
		
		for(int i=start; i<=end; i++) {
			if(i == start) {
				max = (double) s1.getValue(i);
				min = (double) s1.getValue(i);
			} else {
				if((double) s1.getValue(i) > max)
					max = (double) s1.getValue(i);
				if((double) s1.getValue(i) < min)
					min = (double) s1.getValue(i);
			}
		}

        TimeSeries s2 = s1.createCopy(start, end);
        assertEquals(min, s2.getMinY());
        assertEquals(max, s2.getMaxY());
    }

}
