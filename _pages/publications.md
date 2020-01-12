---
layout: page
permalink: /publications/
title: publications
description: papers, reports, work in progress
---

{% for y in page.years %}
  <h3 class="year">{{y}}</h3>
  {% bibliography -f sdaza -q @*[year={{y}}]* %}
{% endfor %}
