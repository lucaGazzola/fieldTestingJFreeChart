package org.jfree.data.general.test;

import org.jfree.chart.block.BlockContainer;
import org.jfree.chart.util.Size2D;
import org.jfree.data.general.aspect.TestStorage;

import junit.framework.TestCase;

public class ContainerArrangeTestField extends TestCase {
	
	// Adapted from MultiPiePlotTests.testConstructor()
	
	public void testNN() {
        BlockContainer c = TestStorage.container;
        Size2D s = c.arrange(TestStorage.graphics, TestStorage.constraint);
        assertNotNull(s);
	}
}
