## Creating a Histogram

To create a histogram do a SELECT count(attr) and group and order by the same attribute. E.g.

    SELECT count(DATE(time)) FROM orders GROUP BY DATE(time) ORDER BY time;
    
## Converting timestamps

    DATE(time)                 # convert "2018-12-01 22:13:00" to "2018-12-01"
    FROM_UNIXTIMESTAMP(ts)     # convert 1534238370 to time string
    
