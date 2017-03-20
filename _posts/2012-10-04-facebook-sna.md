---
layout: post
title: "My Facebook Network"
description: ""
category: SNA
---


I am taking a [coursera](https://www.coursera.org) class on Social Network Analysis. The first assignment consisted of ploting my Facebook network. Below I show how I did it using the R package __igraph__. In order to get your Facebook Network you can use the [Netvizz](https://apps.facebook.com/netvizz/) app. This application allows you to create gdf files (a simple text format that specifies an undirected graph) from the friendship relations. I used this [simplified Netvizz version](http://snacourse.com/getnet/) from [coursera](https://www.coursera.org)  that generates .gml files directly.







{% highlight r %}
library(igraph)

# read the facebook network from a .gml file
f <- read.graph("sdaza.gml", format = "gml")
{% endhighlight %}



In order to plot my Facebook network, I extract the following attributes: gender, wall posts count, and interface language. I also assign some colors and shapes to those attributes. 


{% highlight r %}
# gender, assigning shapes
ssex <- V(f)$sex
table(ssex)
{% endhighlight %}



{% highlight text %}
## ssex
## female   male 
##    218    188
{% endhighlight %}



{% highlight r %}
ssex[ssex == "female"] <- "circle"
ssex[ssex == "male"] <- "square"
table(ssex)
{% endhighlight %}



{% highlight text %}
## ssex
## circle square 
##    218    188
{% endhighlight %}



{% highlight r %}

# interface language, assigning colors
cloc <- V(f)$locale
table(cloc)
{% endhighlight %}



{% highlight text %}
## cloc
## en_GB en_US es_CL es_ES es_LA it_IT nl_NL pt_BR 
##    13   132     2     9   245     1     1     3
{% endhighlight %}



{% highlight r %}

cloc[cloc %in% c("es_ES", "it_IT", "nl_NL", "en_GB", "gl_ES", "ko_KR")] <-  "Yellow"
cloc[cloc %in% c("es_CL", "pt_BR", "es_LA")] <- "Green"
cloc[cloc == c("en_US")] <- "Blue"
table(cloc)
{% endhighlight %}



{% highlight text %}
## cloc
##   Blue  Green Yellow 
##    132    250     24
{% endhighlight %}



{% highlight r %}

# wall posts count, assigning node size
nsize <- (V(f)$wallcount/max(V(f)$wallcount) + 0.1) * 15
{% endhighlight %}


Now, I can plot the network:


{% highlight r %}
plot(f, layout = layout.fruchterman.reingold, edge.arrow.size = 0.5, 
    vertex.label = NA, vertex.size = 3, vertex.color = cloc, 
    vertex.shape = ssex)
{% endhighlight %}

![center](/images/2012-10-04-facebook-sna/fig1.png) 


If we use __wall posts count__ to size the nodes: 


{% highlight r %}
plot(f, layout = layout.fruchterman.reingold, edge.arrow.size = 0.5, 
    vertex.label = NA, vertex.size = nsize, vertex.color = cloc, 
    vertex.shape = ssex)
{% endhighlight %}

![center](/images/2012-10-04-facebook-sna/fig2.png) 


We can also obtain some basic descriptive statistics of the network using a `graph.basic.stats` function (see [here](http://www.isk.kth.se/~shahabm/WSAnalysis/networks/NetworkAnalysis.r) to obtain it): 


{% highlight r %}
graph.basic.stats(f)
{% endhighlight %}



{% highlight text %}
## Number of nodes: 406 
## Number of edges: 4415 
## 
## Degree
##   Average: 21.7 
## 
## 
## Giant component  Size: 397 
## Giant component  As perc.: 0.978 
## Second Giant component: 1 
## Second Giant component As perc.: 0.00246 
## 
## Isolated nodes
##   Number: 9 
##   As perc.: 0.0222
{% endhighlight %}


As can be seen, I have relatively compact and homogeneous components (or clusters) regarding language interface on Facebook. You can see now how your own Facebook network looks like.
