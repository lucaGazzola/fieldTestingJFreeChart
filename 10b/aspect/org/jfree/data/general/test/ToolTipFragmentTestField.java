package org.jfree.data.general.test;

import org.jfree.chart.imagemap.StandardToolTipTagFragmentGenerator;
import org.jfree.data.general.aspect.TestStorage;

import junit.framework.TestCase;

public class ToolTipFragmentTestField extends TestCase {
	
	// Adapted from StandardToolTipTagFragmentGeneratorTests.testGenerateURLFragment()
	// this test already exposed the fault in house, but no other tests exercised the faulty method
	
	public void testGenerateURLFragment() {
        StandardToolTipTagFragmentGenerator g = TestStorage.generator;
        
        org.junit.Assume.assumeTrue(TestStorage.tooltip.startsWith("\""));
        org.junit.Assume.assumeTrue(TestStorage.tooltip.endsWith("\""));
        
        assertEquals(" title=\"&quot;"+TestStorage.tooltip+"&quot;\" alt=\"\"", g.generateToolTipFragment(TestStorage.tooltip));
    }
        
        
        
}
