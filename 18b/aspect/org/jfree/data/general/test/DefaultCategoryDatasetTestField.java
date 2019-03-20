package org.jfree.data.general.test;

import static org.junit.Assume.assumeTrue;

import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.aspect.TestStorage;

import junit.framework.TestCase;

public class DefaultCategoryDatasetTestField extends TestCase {
	
	// Adapted from DefaultCategoryDatasetTests.testBug1835955()
	// this test case already exposes the bug in house, removeColumn()
	// is not used elsewhere
	
	public void testBug1835955() {
    	DefaultCategoryDataset d = null;
    	boolean cloned = true;
    	try{
    		d = (DefaultCategoryDataset) TestStorage.dataset.clone();
    	}catch(Exception e) {
    		System.out.println("error");
    		cloned = false;
    	}
    	assumeTrue(cloned);
    	d.clear();
    	d.addValue(1.0, "R1", "C1");
    	d.addValue(2.0, "R2", "C2");
    	d.removeColumn("C2");
    	d.addValue(3.0, "R2", "C2");
    	assertEquals(3.0, d.getValue("R2", "C2").doubleValue());
    }
}
