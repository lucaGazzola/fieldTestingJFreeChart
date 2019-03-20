package org.jfree.data.general.test;

import static org.junit.Assume.assumeTrue;

import java.awt.Graphics2D;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;

import org.jfree.data.general.aspect.TestStorage;

import junit.framework.TestCase;

public class PieChartDrawTestField extends TestCase {
	
	// Adapted from PieChart3DTests.testNullValueInDataset()
	
    public void testNullValueInDataset() {
    	
        assumeTrue(TestStorage.dataset == null);
    	
        JFreeChart chart = ChartFactory.createPieChart3D(TestStorage.title, TestStorage.dataset, TestStorage.legend, TestStorage.tooltips, TestStorage.urls);;
                
        boolean success = false;
        try {
            BufferedImage image = new BufferedImage(200 , 100, 
                    BufferedImage.TYPE_INT_RGB);
            Graphics2D g2 = image.createGraphics();
            chart.draw(g2, new Rectangle2D.Double(0, 0, 200, 100), null, null);
            g2.dispose();
            success = true;
        }
        catch (Throwable t) {
            success = false;
        }
        assertTrue(success);
    }
}
