---
layout: page
permalink: /pubs/
title: Publications
pubs:

    - title:   "Agent-Based Models for Assessing Complex Statistical Models: An Example Evaluating Selection and Social Influence Estimates from the SIENA model"
      author:  "Sebastian Daza and Kurt Kreuger"
      journal: "Sociological Methods and Research"
      note:    "In press"
      year:    "2018"
      url: https://github.com/sdaza/siena-paper

    - title:   "The Consequences of Incarceration for Mortality in the US"
      author:  "Sebastian Daza, Jerrett Jones and Alberto Palloni"
      journal: "Under Review"
      note:    "Presented at PAA"
      year:    "2018"
      url: https://github.com/sdaza/mortality-incarceration-paper

    - title:   "Income Inequality, Social Mobility and Mortality in the U.S. (Preprint)"
      author:  "Alberto Palloni and Sebastian Daza"
      journal: "Working Paper"
      note:    "Presented at PAA"
      url: http://www.ssc.wisc.edu/cde/cdewp/2016-02.pdf
      year:    "2017"

    - title:   "Addressing the Longevity Gap between the Rich and Poor: The Role of Social Mobility"
      author:  "Alberto Palloni, Sebastian Daza, Atheendar Venkataramani, Ezekiel J. Emanuel"
      journal: "Working Paper"
      year:    "2018"

    - title:   "Consequences of Childbearing in Delinquency and Substance Use"
      author:  "Sebastian Daza and Jason Fletcher"
      journal: "Working Paper"
      note:    "Presented at PAA"
      year:    "2016"

    - title:   "Intergenerational Transfers in the U.S., Economic Inequality, and Social Stratification"
      author:  "Alberto Palloni and Sebastian Daza"
      journal: "Working Paper"
      note:    "Presented at PAA"
      year:    "2014"

    - title:   "The Impact of Age, Egotropic Vote, and Political Divisions in the 2009-2010 Chilean Election"
      author:  "Nicolás Somma and Sebastián Daza"
      journal: "Cuadernos ISUC, Vol 1, Num 2"
      year:    "2016"
      url: http://sociologia.uc.cl/wp-content/uploads/2016/12/articulo-nicols-somma.pdf
---


{% assign thumbnail="left" %}

{% for pub in page.pubs %}
{% if pub.image %}
{% include image.html url=pub.image caption="" height="100px" align=thumbnail %}
{% endif %}
[**{{pub.title}}**]({% if pub.internal %}{{pub.url | prepend: site.baseurl}}{% else %}{{pub.url}}{% endif %})<br />
{{pub.author}}<br />
*{{pub.journal}}*
{% if pub.note %} *({{pub.note}})*
{% endif %} *{{pub.year}}* {% if pub.doi %}[[doi]({{pub.doi}})]{% endif %}
{% if pub.media %}<br />Media: {% for article in pub.media %}[[{{article.name}}]({{article.url}})]{% endfor %}{% endif %}

{% endfor %}
