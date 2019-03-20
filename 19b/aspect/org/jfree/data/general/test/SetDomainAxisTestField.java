package org.jfree.data.general.test;

import org.jfree.chart.plot.CategoryPlot;
import org.jfree.data.general.aspect.TestStorage;

import junit.framework.TestCase;

public class SetDomainAxisTestField extends TestCase {
	
	// Adapted from CategoryPlotTests.testGetDomainAxisIndex()
	// this test case already exposes the bug in house, getDomainAxisIndex()
	// is not used elsewhere
	
	public void testGetDomainAxisIndex() {
        CategoryPlot plot = TestStorage.plot;
        boolean pass = false;
        try {
            plot.getDomainAxisIndex(null);
        }
        catch (IllegalArgumentException e) {
            pass = true;
        }
        assertTrue(pass);
    }
}
