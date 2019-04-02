---
layout: page
permalink: /papers/
title: Publications
pubs:

    - title:   "Agent-Based Models for Assessing Complex Statistical Models: An Example Evaluating Selection and Social Influence Estimates from the SIENA model"
      author:  "Sebastian Daza and L. Kurt Kreuger"
      journal: "Sociological Methods and Research"
      year:    "2019"
      code:    https://github.com/sdaza/siena-paper
      doi:     https://doi.org/10.1177/0049124119826147

    - title:   "The Consequences of Incarceration for Mortality in the U.S."
      author:  "Sebastian Daza, Alberto Palloni and Jerrett Jones"
      journal: "Under Review"
      note:    "Presented at PAA"
      year:    "2019"
      code:    https://github.com/sdaza/mortality-incarceration-paper
      preview: https://osf.io/preprints/socarxiv/b8xe6/

    - title:   "Uncertainty and Mortality Estimates in the Latin American and Caribbean (LAC) Region"
      author:  "Alberto Palloni, Hiram Beltran-Sanchez, Sebastian Daza"
      journal: "Working Paper"
      year:    "2019"
      code:    https://github.com/sdaza/lambda

    - title:   "Addressing the Longevity Gap between the Rich and Poor: The Role of Social Mobility"
      author:  "Alberto Palloni, Sebastian Daza, Atheendar Venkataramani, Ezekiel J. Emanuel"
      journal: "Working Paper"
      year:    "2019"
      code:    https://github.com/sdaza/income-mobility-le-gap

    - title:   "Income Inequality, Social Mobility and Mortality in the U.S."
      author:  "Alberto Palloni and Sebastian Daza"
      journal: "Working Paper"
      note:    "Presented at PAA"
      preview: https://osf.io/preprints/socarxiv/gdz2a
      code:    https://github.com/sdaza/dissertation/tree/master/ch02
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
      preview: http://sociologia.uc.cl/wp-content/uploads/2016/12/articulo-nicols-somma.pdf
---


{% assign thumbnail="left" %}

{% for pub in page.pubs %}
{% if pub.image %}
{% include image.html url=pub.image caption="" height="100px" align=thumbnail %}
{% endif %}
<span style="color:#0868ac">**{{pub.title}}**</span> {% if pub.doi %} [[doi]({{pub.doi}})] {% endif %} {% if pub.preview %} [[preview]({{pub.preview}})] {% endif %} {% if pub.code %} [[code]({{pub.code}})] {% endif %}<br />
{{pub.author}}<br>
*{{pub.journal}}*
{% if pub.note %} *({{pub.note}})* {% endif %} *{{pub.year}}*
{% if pub.media %}<br />Media: {% for article in pub.media %}[[{{article.name}}]({{article.url}})]{% endfor %}{% endif %}<br />
{% endfor %}

