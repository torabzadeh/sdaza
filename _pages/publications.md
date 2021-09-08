---
layout: page
permalink: /publications/
title: publications
description:
# years: [2021, 2020, 2019, 2018, 2016, 2014]
nav: true
---

<div class="publications">
 {% bibliography -f sdaza --group_by type %}
</div>


<!-- <div class="publications">
{% for y in page.years %}
  <h2 class="year">{{y}}</h2>
  {% bibliography -f sdaza -q @*[type={{y}}]* %}
{% endfor %}
</div>  -->

