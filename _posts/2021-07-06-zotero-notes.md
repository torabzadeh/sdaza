---
layout: post
title: "Extracting Zotero's notes"
description: "How to extract zotero notes to CSV / Excel file"
author: Sebastian Daza
giscus_comments: true
date: 2021-07-06
tags: zotero
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


![center](/assets/img/zotnotes.png)
