package org.jfree.data.general.test;


import org.jfree.data.KeyedObjects2D;
import org.jfree.data.general.aspect.TestStorage;

import junit.framework.TestCase;

public class GetValueByKeyTestField extends TestCase {
	
	// Adapted from KeyedObjects2Dtests.testGetValueByKey()
	// already exposes the failure in house
	
	public void testGetValueByKey() {
        KeyedObjects2D data = TestStorage.dataset;
        data.addObject(TestStorage.list, TestStorage.rowKey, TestStorage.columnKey);
        try {
        	assertEquals(TestStorage.list, data.getObject(TestStorage.rowKey, TestStorage.columnKey));
        }catch(Exception e) {}
        finally {
        	data.removeObject(TestStorage.rowKey, TestStorage.columnKey);
        }
	}
	
}
