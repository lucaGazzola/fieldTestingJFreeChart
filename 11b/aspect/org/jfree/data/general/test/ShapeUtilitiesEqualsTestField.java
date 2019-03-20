package org.jfree.data.general.test;

import java.awt.geom.GeneralPath;

import org.jfree.chart.util.ShapeUtilities;
import org.jfree.data.general.aspect.TestStorage;

import junit.framework.TestCase;

public class ShapeUtilitiesEqualsTestField extends TestCase {
	
	// Adapted from ShapeUtilitiesTests.testEqualShapes()
	
    public void testEqualShapes() {

        GeneralPath p1 = (GeneralPath) TestStorage.p1.clone();
        GeneralPath p2 = TestStorage.p2;

        org.junit.Assume.assumeTrue(ShapeUtilities.equal(p1, p2));
        
        p1.moveTo(11.0f, 22.0f);
        assertFalse(ShapeUtilities.equal(p1, p2));

    }
        
        
}
