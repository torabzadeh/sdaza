---
layout: post
title: "Reading CDC mortality files in R"
description: ""
category: "R"
tags: [CDC, Mortality, R]
---



Reading  fixed-width text files can be challenging, especially when no manageable dictionary is provided. In this post, I show steps can save you time. In this example, I read a compress mortality file (CMF 1979-1988) available [here](http://www.cdc.gov/nchs/data_access/cmf.htm) using a layout (or dictionary) in [PDF format](http://www.cdc.gov/nchs/data/mortab/filelayout68_88.pdf).

So, to read this file (usually with extension `.txt` or `.dat`), I first need to know where each column starts and finishes. What I get from the pdf file is something like this:

![](/img/mortalityLayout.png)

The layout is usually a codebook in Word/PDF or just plain text file. Here, I copy the PDF text and put it in a plain text file. I use a text editor (e.g., [Sublime Text](https://www.sublimetext.com/)) and [regular expressions](https://en.wikipedia.org/wiki/Regular_expression) to extract the information I need.

I have to select every row with this pattern: `1-2 2 FIPS State code Numeric`. That is, a number follows by a hyphen (although not always, particularly when the width of the column is one), spaces, another number, spaces, and then any text. I use the following regular expression to get that pattern: `(^[0-9]+).([0-9]+)\s+([0-9])\s+(.+)`. Using the Sublime package [Filter Lines](https://packagecontrol.io/packages/Filter%20Lines) I get something like this (you can also just copy the selected lines):

![](/img/filterLinesRaw.png)

This approach might be particularly useful when you have a long PDF/Word file and you want to extract most of the variables of a dataset. You would need to adapt these regular expressions to the particular patterns of your codebook.

To simplify, I format this text as a comma-separated values file (csv) so that to read it in R. Replacing this regular expression `([0-9]+)(-)([0-9]+)(\s)([0-9]+)(\s)(.+)(\s)(Numeric)` by `\1,\3,\5,\7,\9` I get:

![](/img/filterLinesCSV.png)

Then, I read that file in R.

    
    {% highlight r %}
    # define names of columns
    colnames <- c("start", "end", "width", "name", "type")
    dict <- read.csv("data/dictMortality.csv", col.names = colnames, header = FALSE)
    {% endhighlight %}

    
    {% highlight text %}
    ##   start end width                                             name    type
    ## 1     1   2     2                                  FIPS State code Numeric
    ## 2     3   5     3                                 FIPS county code Numeric
    ## 3     6   9     4                                    Year of death Numeric
    ## 4    11  12     2                                     Age at death Numeric
    ## 5    13  16     4 ICD code for underlying cause-of-death 3 digits: Numeric
    ## 6    17  19     3                            Cause-of-Death Recode Numeric
    ## 7    20  23     4                                 Number of deaths Numeric
    {% endhighlight %}
Now, I can read the fixed-width text file. I use the [readr](https://github.com/hadley/readr) package (in my experience relatively fast for big databases, let's say, 1GB).

   
   {% highlight r %}
   library(readr)
   
   # create name of variables
   cnames <- c("state", "county", "year", "age", "icd", "cause", "deaths")
   
   # read mortality file
   mort <- read_fwf("data/mort7988.txt", fwf_positions(dict$start, dict$end, cnames))
   {% endhighlight %}

   
   {% highlight text %}
   ## # A tibble: 8,776,385 <U+00D7> 7
   ##    state county  year   age   icd cause deaths
   ##    <chr>  <chr> <int> <chr> <chr> <chr>  <int>
   ## 1     01    001  1979    04  5789   780      1
   ## 2     01    001  1979    04  7980   770      1
   ## 3     01    001  1979    08  8121   800      1
   ## 4     01    001  1979    09  3439   780      1
   ## 5     01    001  1979    09  8120   800      2
   ## 6     01    001  1979    09  8189   800      1
   ## 7     01    001  1979    10  1629   180      1
   ## 8     01    001  1979    10  2396   250      1
   ## 9     01    001  1979    10  4289   410      1
   ## 10    01    001  1979    10  8070   810      1
   ## # ... with 8,776,375 more rows
   {% endhighlight %}

    
    {% highlight r %}
       # year distribution
       table(mort$year)
    {% endhighlight %}
    
    
    
    {% highlight text %}
    ## 
    ##   1979   1980   1981   1982   1983   1984   1985   1986   1987   1988 
    ## 831605 854860 854198 850505 867280 875607 894176 905736 912551 929867
    {% endhighlight %}
    
    
    
    {% highlight r %}
       # number of deaths
       sum(mort$deaths)
    {% endhighlight %}
    
    
    
    {% highlight text %}
    ## [1] 20398153
    {% endhighlight %}

Hopefully, you will save some time.

**Last Update: 10/07/2016**
