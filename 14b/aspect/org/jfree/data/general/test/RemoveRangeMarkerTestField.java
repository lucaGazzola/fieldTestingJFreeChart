package org.jfree.data.general.test;

import java.util.Arrays;
import java.util.List;

import org.jfree.chart.event.MarkerChangeListener;
import org.jfree.chart.plot.Marker;
import org.jfree.chart.plot.ValueMarker;
import org.jfree.chart.plot.XYPlot;
import org.jfree.data.general.aspect.TestStorage;

import junit.framework.TestCase;

public class RemoveRangeMarkerTestField extends TestCase {
	
	// Adapted from XYPlotTests.testAddRangeMarker()
	
	public void testAddRangeMarker() {
        XYPlot plot;
		try {
			plot = (XYPlot) TestStorage.plot.clone();
			org.junit.Assume.assumeFalse(plot.removeDomainMarker(new ValueMarker(0.5)));
	        Marker m = new ValueMarker(0.5);
	        plot.addRangeMarker(m);
	        List listeners = Arrays.asList(m.getListeners(MarkerChangeListener.class));
	        assertTrue(listeners.contains(plot));
	        plot.clearRangeMarkers();
	        listeners = Arrays.asList(m.getListeners(MarkerChangeListener.class));
	        assertFalse(listeners.contains(plot));
	        plot.removeRangeMarker(m);
		} catch (CloneNotSupportedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
    }
}
