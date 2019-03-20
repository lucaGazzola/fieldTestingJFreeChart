package org.jfree.data.general.test;

import java.awt.Rectangle;
import java.awt.geom.Line2D;

import org.jfree.chart.util.ShapeList;
import org.jfree.data.general.aspect.TestStorage;

import junit.framework.TestCase;

public class ShapeListTestField extends TestCase {
	
	// Adapted from ShapeListTests.testEquals() 
	// this is the test cases that already exposes the bug in-house,
	// ShapeList.equals(ShapeList) was not used elsewhere.
	
	public void testEquals() {
        ShapeList l1 = TestStorage.shapeList;
        
        org.junit.Assume.assumeTrue(l1.size() == 0);
        
        l1.setShape(0, new Rectangle(1, 2, 3, 4));
        l1.setShape(1, new Line2D.Double(1.0, 2.0, 3.0, 4.0));

        ShapeList l2 = new ShapeList();
        l2.setShape(0, new Rectangle(1, 2, 3, 4));
        l2.setShape(1, new Line2D.Double(1.0, 2.0, 3.0, 4.0));

        assertTrue(l1.equals(l2));
    }

}
