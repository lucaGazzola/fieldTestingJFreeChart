package org.jfree.data.general.test;

import org.jfree.data.general.aspect.TestStorage;
import org.jfree.data.xy.XYSeries;

import junit.framework.TestCase;

public class AddOrUpdateTestField extends TestCase {
	
	// Test adapted from XYSeriesTests.testAddOrUpdate3()
	
    public void testAddOrUpdate3() {
        XYSeries series;
		try {
			series = (XYSeries) TestStorage.series.clone();
			series.addOrUpdate(1.0, 1.0);
	        series.addOrUpdate(1.0, 2.0);
	        series.addOrUpdate(1.0, 3.0);

	        assertTrue(series.getItemCount() >= 3);
		} catch (CloneNotSupportedException e) {
			e.printStackTrace();
		}      
    }

}
