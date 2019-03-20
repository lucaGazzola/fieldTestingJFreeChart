package org.jfree.data.general.test;

import static org.junit.Assume.assumeFalse;

import org.jfree.chart.renderer.category.MinMaxCategoryRenderer;
import org.jfree.data.general.aspect.TestStorage;

import junit.framework.TestCase;

public class MinMaxCategoryRendererTestField extends TestCase {
	
	// Adapted from MinMaxCategoryRendererTests.testEquals()
	// this test case already exposes the bug in house
	
    public void testEquals() {
        MinMaxCategoryRenderer r1 = TestStorage.r1;
        MinMaxCategoryRenderer r2 = TestStorage.r1;
        
        assumeFalse(r1.isDrawLines());
        
        r1.setDrawLines(true);
        try {
        	assertFalse(r1.equals(r2));
        }catch(Exception e) {
        	
        }finally {
        	r1.setDrawLines(false);
        }

    }
    
}
