---
layout: page
permalink: /publications/
title: publications
description: papers, reports, work in progress
years: [2020, 2019, 2018, 2016, 2014]
status: ["Peer Review", "Working Paper", "Report"]
---


- [Peer Review](#peer-review)
- [Working Papers](#working-papers)
- [Reports](#reports)

<hr>


{% for t in page.status %}
{% if t == "Peer Review" %}
  <h3>{{"Peer Review"}}</h3>
  {% bibliography -f sdaza -q @*[journaltitle!~Working|Report|ISUC, eventtitle!~PAA]* %}
{% elsif t == "Working Paper" %}
  <hr>
  <h3>{{"Working papers"}}</h3>
  {% bibliography -f sdaza -q @*[journaltitle~=Working || eventtitle~=PAA]* %}
{% elsif t == "Report" %}
  <hr>
  <h3>{{"Reports"}}</h3>
  {% bibliography -f sdaza -q @*[journaltitle~=Report]* %}
{% endif %}
{% endfor %}

<hr>