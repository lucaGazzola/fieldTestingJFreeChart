package org.jfree.data.general.test;

import junit.framework.TestCase;

import static org.junit.Assume.assumeNotNull;
import static org.junit.Assume.assumeTrue;

import org.jfree.data.Range;
import org.jfree.data.general.DatasetUtilities;
import org.jfree.data.general.aspect.TestStorage;
import org.jfree.data.xy.XYDataset;

public class DatasetUtilitiesTestField extends TestCase {

	// Adapted from DatasetUtilitiesTests.testFindDomainBounds()
	
    public void testFindDomainBounds() {   	
        assumeTrue(TestStorage.dataset.getSeriesCount() >= 1);
        XYDataset dataset = TestStorage.dataset;
        Range r = DatasetUtilities.iterateDomainBounds(dataset);
        assertNotNull(r.getLowerBound());
        assertNotNull(r.getUpperBound());
    }

}
