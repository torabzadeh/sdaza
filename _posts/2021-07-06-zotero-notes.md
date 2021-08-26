---
layout: post
title: "Extracting Zotero's  notes"
description: "How to extract zotero notes to CSV / Excel file"
author: Sebastian Daza
comments: true
date: 2021-07-06
---
When reviewing the literature, it's nice to have the notes linked to Zotero
references. It would also be great to compare them systematically. The idea
would be to have your notes in Zotero so that everyone in the group can access
and edit them and create a data file to explore your notes using, for instance,
text analysis techniques.

This small package extracts notes from a collection and creates a CSV file that
can be easily read using Excel. You only need to specify the collection ID. For
instance, if the location of my collection is
`https://www.zotero.org/groups/2406179/csic-echo/collections/M8N2VMAP`, the
collection ID would be `M8N2VMAP`. We also need the Zotero API's credentials.

To create a clean CSV, notes' headers would need a suitable separator. The
default is `#`. In this case, the text between headings mustn't include `#`.
Below an example:

```
# Research question

Estimates interaction effects between PGS of obesity and cohorts using HRS.

# Data

HRS

# Methods

Uses a HLM whereby they estimate effects of age and cohorts while making the
intercepts and slopes a function of individual factors.
```

## Installation

```
pip install git+https://github.com/sdaza/zotnote.git
```

## Credentials

You can save your Zotero API credentials in a `config.py` and load them using
`import config`:

```yaml
library_id = "0000000"
api_key = "key"
library_type = "group"
```

## Example

Let's try to extract some notes and read them using Pandas:



{% highlight python %}
import pandas as pd
import config
import zotnote as zn
{% endhighlight %}


{% highlight python %}
zn.exportNotes(collection = "M8N2VMAP", 
    library_id = config.library_id, api_key = config.api_key)
{% endhighlight %}

    Notes saved in zotero-notes.csv



{% highlight python %}
pd.read_csv("zotero-notes.csv")


{% endhighlight %}




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>id</th>
      <th>citation</th>
      <th>tags</th>
      <th>title</th>
      <th>reviewer</th>
      <th>research_question</th>
      <th>model</th>
      <th>data</th>
      <th>methods</th>
      <th>conclusions</th>
      <th>the_good</th>
      <th>limitations</th>
      <th>results</th>
      <th>context</th>
      <th>next</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>4ESWAPZY</td>
      <td>van Dijk et al. 2015</td>
      <td>NaN</td>
      <td>Recent developments on the role of epigenetics...</td>
      <td>Elena</td>
      <td>Knowledge about epigenetic marks related to ob...</td>
      <td>Human and animal</td>
      <td>Review</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Good summary tables of studies carried out in ...</td>
      <td>So far, a causal role of epigenetics in the de...</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>1</th>
      <td>5JNF33U8</td>
      <td>Fernandez-Twinn et al. 2019</td>
      <td>intrauterine effects, epigenetics</td>
      <td>Intrauterine programming of obesity and type 2...</td>
      <td>Elena</td>
      <td>Which are the relevant exposures related to th...</td>
      <td>Human and also murine models</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>-          The main exposures involved: fetal ...</td>
      <td>NaN</td>
      <td>limited evidence for  a causal role for epigen...</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>2</th>
      <td>S8FZS32L</td>
      <td>Ling 2019</td>
      <td>Elena</td>
      <td>Epigenetics in Human Obesity and Type 2 Diabetes</td>
      <td>Elena</td>
      <td>Summarizes epigenetic signatures from human ti...</td>
      <td>NaN</td>
      <td>Human</td>
      <td>Different large-scale methylation studies usin...</td>
      <td>NaN</td>
      <td>Also covers diet (methyl donnors) and epigenet...</td>
      <td>In epigenetic studies it’s important to unders...</td>
      <td>1) Evidence for DNA methylation sites that con...</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>3</th>
      <td>QY3Y7V6X</td>
      <td>Sharp et al. 2017</td>
      <td>Must read</td>
      <td>Maternal BMI at the start of pregnancy and off...</td>
      <td>Elena</td>
      <td>Is maternal bmi related with changes in the of...</td>
      <td>NaN</td>
      <td>meta-analysis across 19 cohorts using 450k ill...</td>
      <td>2 models: primary análisis used continous bmi ...</td>
      <td>They found evicence for a causal intrauterine ...</td>
      <td>Large sample size n=7523. Strong confounder co...</td>
      <td>Effects sizes were very small, les tan a 0.15%...</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5AMCHQMB</td>
      <td>Sulc et al. 2020</td>
      <td>NaN</td>
      <td>Quantification of the overall contribution of ...</td>
      <td>Sebastian</td>
      <td>Can we use a method to estimate GxE without me...</td>
      <td>NaN</td>
      <td>Simulation and application to complex traits f...</td>
      <td>Detect GxE based on the variance heterogeneity...</td>
      <td>NaN</td>
      <td>Interesting approach to GxE and GxG. The metho...</td>
      <td>The interaction effect estimates may depend to...</td>
      <td>Simulation results seem to show the method is ...</td>
      <td>GxE are challenging, E is not measured accurat...</td>
      <td>What would be the implications of these result...</td>
    </tr>
    <tr>
      <th>5</th>
      <td>U4MNK7QT</td>
      <td>Walter et al. 2016</td>
      <td>Genomics, HRS, GxE, BMI</td>
      <td>Association of a Genetic Risk Score With Body ...</td>
      <td>Sebastian</td>
      <td>Estimates interaction effects between PGS of o...</td>
      <td>NaN</td>
      <td>HRS</td>
      <td>Uses a HLM whereby they estimate effects of ag...</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Pays little attention to selection due to surv...</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Anything</td>
    </tr>
    <tr>
      <th>6</th>
      <td>RGDC9R9R</td>
      <td>Abadi et al. 2017</td>
      <td>Genomics, GxG, GxE, BMI</td>
      <td>Penetrance of Polygenic Obesity Susceptibility...</td>
      <td>Sebastian</td>
      <td>Are the effects of obesity-susceptibility loci...</td>
      <td>NaN</td>
      <td>Several studies, including the Framingham coho...</td>
      <td>Conditional quantile regression (CQR) to inves...</td>
      <td>NaN</td>
      <td>Interesting approach to GxE and GxG.</td>
      <td>European ancestry, how these results hold in d...</td>
      <td>Significant positive associations (adjusting f...</td>
      <td>The role of the individual and compound gene-e...</td>
      <td>What would be the implications of these result...</td>
    </tr>
  </tbody>
</table>
</div>




{% highlight python %}

{% endhighlight %}
