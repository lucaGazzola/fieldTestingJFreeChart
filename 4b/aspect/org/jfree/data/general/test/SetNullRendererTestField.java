package org.jfree.data.general.test;

import org.jfree.chart.plot.XYPlot;
import org.jfree.chart.renderer.xy.XYItemRenderer;
import org.jfree.data.general.aspect.TestStorage;

import junit.framework.TestCase;

public class SetNullRendererTestField extends TestCase {
	
	// Test adapted from XYPlotTests.testSetNullRenderer()
	
    public void testSetNullRenderer() {
        boolean failed = false;
        XYPlot plot = TestStorage.plot;
        XYItemRenderer renderer = plot.getRenderer();
        try {
            plot.setRenderer(null);
        }
        catch (Exception e) {
            failed = true;
        }
        assertTrue(!failed);
        plot.setRenderer(renderer);    
    }
}
