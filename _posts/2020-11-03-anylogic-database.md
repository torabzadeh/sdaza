---
layout: post
title: "From database to CSV using Anylogic"
# description: "How to transform a database into CSV using Anylogic"
author: Sebastian Daza
comments: true
date: 2020-11-03
published: false
---

When running a parameter variation experiment, that is, simulating over several iterations and replicates using parallelization, I would like to collect a huge amount of data in a format,  let's say a CSV file, that I can use with Python or R.

The best way to do that in Anylogic is by using a database and then export that information or read it directly from the software you use to process the data. Every time an experiment finishes, you will need to export the data to an Excel file manually. The issue with Excel files is, on the one hand, they are Excel files, and on the other, they are not suitable for big data (more than 1 million rows). You can still create a function to save all the tables of your simulation using Excel automatically, but you will have the limit-of-rows issue.

Here I show a way to export the database to a CSV file within Java. The general setup is:

- Create the databases you need for your experiment, and defining the columns iteration and replicate.
- Create a function to save the data of your simulation run.
- Define a parameter variation experiment.
- Define a variable or parameter to specify where to save the data (path).

{% highlight java %}

ResultSet rs = selectResultSet(query);

try {
	FileWriter fw = new FileWriter(filename + ".csv");
  	int cols = rs.getMetaData().getColumnCount();
	for(int i = 1; i <= cols; i ++){
		fw.append(rs.getMetaData().getColumnLabel(i).toLowerCase());
        if(i < cols) fw.append(';');
        else fw.append('\n');
    }
	while (rs.next()) {
		for(int i = 1; i <= cols; i ++){
            fw.append(rs.getString(i));
            if(i < cols) fw.append(';');
        }
        fw.append('\n');
     }
     fw.flush();
     fw.close();
} catch (Exception e) {
    getEngine().pause();
    traceln("--> An Exception happened during initialization, continue? ...");
    e.printStackTrace();
}
{% endhighlight %}
