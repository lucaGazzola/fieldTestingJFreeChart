package org.jfree.data.general.test;

import static org.junit.Assume.assumeTrue;

import org.jfree.chart.plot.MultiplePiePlot;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.aspect.TestStorage;

import junit.framework.TestCase;

public class MultiPiePlotTestField extends TestCase {
	
	// Adapted from MultiPiePlotTests.testConstructor()
	// The test already exposes the bug in house, this specific
	// MultiPiePlotTests constructor is not used elsewhere in the test suite
	
	public void testConstructor() {
    	MultiplePiePlot plot = TestStorage.plot;
    	
        assumeTrue(plot.getDataset() instanceof DefaultCategoryDataset);
    	
    	DefaultCategoryDataset dataset =  (DefaultCategoryDataset) plot.getDataset();
    	assertTrue(dataset.hasListener(plot));
    }
        
        
}
