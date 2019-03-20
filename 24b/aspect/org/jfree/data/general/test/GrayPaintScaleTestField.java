package org.jfree.data.general.test;

import static org.junit.Assume.assumeTrue;

import java.awt.Color;

import org.jfree.chart.renderer.GrayPaintScale;
import junit.framework.TestCase;

public class GrayPaintScaleTestField extends TestCase {
	
	// Adapted from GrayPaintScaleTests.testGetPaint()
	// this test case already exposes the bug in house
	
    public void testGetPaint() {
        GrayPaintScale gps = new GrayPaintScale();
        
        assumeTrue(gps.getLowerBound()>=0);
        
        Color c = (Color) gps.getPaint(-0.5);
        assertTrue(c.equals(Color.black));

    }
    
}
