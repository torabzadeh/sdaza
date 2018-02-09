---
layout: page
title: About
permalink: /
---


I am a Ph.D. candidate in Sociology at the [University of Wisconsin-Madison](http://www.ssc.wisc.edu/soc/). I received my Bachelors and Masters in Sociology from the [Catholic University of Chile](http://sociologia.uc.cl/).

My research focuses on how socio-economic mobility affects health and mortality, the consequences of incarceration for health, reentry experiences of women just released from prison, and social networks. I rely on statistical and computational methods in my research, with an emphasis on data science and agent-based modeling.


<br>
# Last Posts

<ul>
   {% for post in site.posts offset: 0 limit: 4 %}
    <li><span>{{ post.date | date_to_string }}</span> &raquo; <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a></li>
    {% endfor %}
</ul>

<!-- ## Contact

<a href="mailto:sebastian.daza@gmail.com"><i class="fa fa-envelope" aria-hidden="true" target="_blank"></i></a>
<a href="https://github.com/sdaza"><i class="fa fa-github" aria-hidden="true" target="_blank"></i></a>
<a href="https://linkedin.com/in/sebastian-daza-85a36884"><i class="fa fa-linkedin" aria-hidden="true" target="_blank"></i></a>
<a href="https://twitter.com/sebadaza"><i class="fa fa-twitter" aria-hidden="true" target="_blank"></i></a>
 -->
