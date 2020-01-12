---
layout: page
permalink: /publications/
title: publications
description: papers, reports, work in progress
years: [2020, 2019, 2018, 2016, 2014]
---

{% for y in page.years %}
  <h3 class="year">{{y}}</h3>
  {% bibliography -f sdaza -q @*[year={{y}}]* %}
{% endfor %}
