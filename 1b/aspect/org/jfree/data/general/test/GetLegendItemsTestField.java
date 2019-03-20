package org.jfree.data.general.test;

import junit.framework.TestCase;

import org.jfree.chart.LegendItemCollection;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.renderer.category.AbstractCategoryItemRenderer;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.aspect.TestStorage;

public class GetLegendItemsTestField extends TestCase {
	
	// Adapted from AbstractCategoryItemRendererTests.test2947660()
	// this is the test cases that already exposes the bug in-house,
	// AbstractCategoryItemRenderer.getLegendItems() is not used
	// in any other test case.
    public void testGetLegendItems() {
    	
    	AbstractCategoryItemRenderer r = TestStorage.render;
    	
    	DefaultCategoryDataset dataset = new DefaultCategoryDataset();
        CategoryPlot plot = new CategoryPlot();
        plot.setDataset(dataset);
        plot.setRenderer(r);
        org.junit.Assume.assumeTrue(r.getLegendItems().getItemCount()==0);
        dataset.addValue(1.0, "S1", "C1");
        LegendItemCollection lic = r.getLegendItems();
        assertEquals(1, lic.getItemCount());
        assertEquals("S1", lic.get(0).getLabel());
    }

}
