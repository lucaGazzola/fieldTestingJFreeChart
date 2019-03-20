package org.jfree.logging;

import java.io.IOException;
import java.util.logging.FileHandler;
import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;

public class SingletonLogger {

    private static Logger instance;

    public static Logger getInstance() {
        synchronized (Logger.class) {
            if (instance == null) {
                Logger logger = Logger.getLogger("MyLog");
                FileHandler fh;

                try {

                    // This block configure the logger with handler and formatter
                    fh = new FileHandler("/Users/luca/work/jfree_logs/testLog_jfree_2.log");
                    logger.addHandler(fh);
                    SimpleFormatter formatter = new SimpleFormatter();
                    fh.setFormatter(formatter);
                    instance = logger;

                } catch (SecurityException e) {
                    e.printStackTrace();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return instance;
    }

}