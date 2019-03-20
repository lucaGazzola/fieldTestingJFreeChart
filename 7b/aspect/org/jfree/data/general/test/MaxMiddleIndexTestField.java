package org.jfree.data.general.test;

import org.jfree.data.general.aspect.TestStorage;
import org.jfree.data.time.SimpleTimePeriod;
import org.jfree.data.time.TimePeriodValues;

import junit.framework.TestCase;

public class MaxMiddleIndexTestField extends TestCase {
	
	// Adapted from TimePeriodValuesTests.testGetMaxMiddleIndex() 
	// this is the test cases that already exposes the bug in-house,
	// TimePeriodValues.getMaxMiddleIndex() was not used elsewhere.
	
    public void testGetMaxMiddleIndex() {
        TimePeriodValues s = TestStorage.tpv;
        org.junit.Assume.assumeTrue(-1 == s.getMaxMiddleIndex());
        s.add(new SimpleTimePeriod(100L, 200L), 1.0);
        assertEquals(0, s.getMaxMiddleIndex());
        s.add(new SimpleTimePeriod(300L, 400L), 2.0);
        assertEquals(1, s.getMaxMiddleIndex());
        s.add(new SimpleTimePeriod(0L, 50L), 3.0);
        assertEquals(1, s.getMaxMiddleIndex());
        s.add(new SimpleTimePeriod(150L, 200L), 4.0);
        assertEquals(1, s.getMaxMiddleIndex());
    }

}
