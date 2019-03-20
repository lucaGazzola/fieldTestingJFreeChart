package usage;
import java.awt.Color;
import java.io.File;
import java.io.IOException;
 
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.CategoryLabelPositions;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.renderer.category.BarRenderer;
import org.jfree.chart.renderer.category.CategoryItemRenderer;
import org.jfree.data.Range;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DatasetUtilities;
import org.jfree.data.xy.XYIntervalSeries;
import org.jfree.data.xy.XYIntervalSeriesCollection;
 
public class UsageJFree2 {
 
	private CategoryDataset createCategoryDataset() {
		final DefaultCategoryDataset dataset = new DefaultCategoryDataset();
		dataset.addValue(225.0, "15-20 Years", "Male");
		dataset.addValue(419.0, "20-30 Years", "Male");
		dataset.addValue(141.0, "30-40 Years", "Male");
 
		dataset.addValue(634.0, "15-20 Years", "Female");
		dataset.addValue(229.0, "20-30 Years", "Female");
		dataset.addValue(433.0, "30-40 Years", "Female");
		return dataset;
 
}
 
	private JFreeChart create3DBarChart(CategoryDataset dataset, PlotOrientation plotOrientation) {
		JFreeChart chart = ChartFactory.createBarChart3D("3D Bar Chart Demo - www.sanjaal.com/java","Gender","Avg Minutes Spent On Sanjaal.com Per Day",dataset,true);
		CategoryPlot plot = chart.getCategoryPlot();
		CategoryAxis axis = plot.getDomainAxis();
		axis.setCategoryLabelPositions(CategoryLabelPositions.createUpRotationLabelPositions(Math.PI / 16.0));
		CategoryItemRenderer renderer = plot.getRenderer();
		BarRenderer r = (BarRenderer) renderer;
		r.setMaximumBarWidth(0.1);
		chart.setBackgroundPaint(Color.WHITE);
 
		return chart;
 
	}
 
	public void saveChart(JFreeChart chart, String fileLocation) {
		try {
			ChartUtilities.saveChartAsJPEG(new File(fileLocation), chart, 800,600);
		} catch (IOException e) {
			e.printStackTrace();
			System.err.println("Problem occurred creating chart.");
		}
	}
	
	public static void trigger() {
		XYIntervalSeriesCollection d = new XYIntervalSeriesCollection();
        XYIntervalSeries s = new XYIntervalSeries("S1");
        s.add(1.0, Double.NaN, Double.NaN, Double.NaN, 1.5, Double.NaN);
        d.addSeries(s);
        Range r = DatasetUtilities.iterateDomainBounds(d);

        System.out.println(r.getLowerBound());
        System.out.println(r.getUpperBound());
	}
 
	public static void main(String[] args) {
		UsageJFree2 chartCreator = new UsageJFree2();
 
		CategoryDataset categoryDataset = chartCreator.createCategoryDataset();
 
		JFreeChart chartHorizontal = chartCreator.create3DBarChart(categoryDataset, PlotOrientation.HORIZONTAL);
 
		String horizontalChartFileSaveLocation = "/Users/luca/work/buggy/jfreechart/jfree1b/testchart/my3DCategoryChartHorizontal.jpg";
 
		chartCreator.saveChart(chartHorizontal, horizontalChartFileSaveLocation);
		System.out.println("Horizontal Category Chart Created Successfully");
		System.out.println("Chart has been saved to: "+ horizontalChartFileSaveLocation);
 
		JFreeChart chartVertical = chartCreator.create3DBarChart(categoryDataset, PlotOrientation.VERTICAL);
 
		String verticalChartFileSaveLocation = "/Users/luca/work/buggy/jfreechart/jfree1b/testchart/my3DCategoryChartVertical.jpg";
 
		chartCreator.saveChart(chartVertical, verticalChartFileSaveLocation);
 
		System.out.println("nVertical Category Chart Created Successfully");
		System.out.println("Chart has been saved to: "+ verticalChartFileSaveLocation);
		
		long startTime = System.nanoTime();
		try {
			trigger();
		}catch(Exception e) {}
		long endTime   = System.nanoTime();
		long totalTime = endTime - startTime;
		System.out.println("time spent: "+totalTime);
		long memory = Runtime.getRuntime().totalMemory() - Runtime.getRuntime().freeMemory();
        System.out.println("Used memory is bytes: " + memory);
 
	}
 
}