package org.jfree.data.general.test;

import org.jfree.chart.plot.ValueMarker;
import org.jfree.data.general.aspect.TestStorage;

import junit.framework.TestCase;

public class ValueMarkerTestField extends TestCase {
	
	// Adapted from ValueMarkerTests.test1808376()
	// this test case already exposes the bug in house, this ValueMarker
	// constructor is not used elsewhere
	
    public void test1808376() {
        ValueMarker m = new ValueMarker(TestStorage.value, TestStorage.paint, TestStorage.stroke, TestStorage.outlinePaint, TestStorage.outlineStroke, TestStorage.alpha);
        assertEquals(TestStorage.value, m.getValue());
        assertEquals(TestStorage.paint, m.getPaint());
        assertEquals(TestStorage.stroke, m.getStroke());
        assertEquals(TestStorage.outlinePaint, m.getOutlinePaint());
        assertEquals(TestStorage.outlineStroke, m.getOutlineStroke());
        assertEquals(TestStorage.alpha, m.getAlpha());
    }
}
