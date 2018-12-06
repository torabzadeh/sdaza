---
layout: page
permalink: /research/
title: Research
---

<script>
var trackOutboundLink = function(url) {
   ga('send', 'event', 'outbound', 'click', url, {'hitCallback':
     function () {
     document.location = url;
     }
   });
}
</script>

My research interests are varied, and include social demography, health and mortality, deviance and crime, complexity and social network analysis, computational sociology, and quantitative methods. I am currently involved in the following research projects:


- [Income mobility and mortality](#income-mobility-health-and-mortality)
- [Incarceration and mortality](#the-consequences-of-incarceration-for-health-and-mortality)
- [Women re-entry study](#women-reentry-study)
- [RSiena and agent-based modeling](#rsiena-selection-and-influence-estimates-under-misspecification)
- [Lambda](#lambda)


Here a list of my [publications](/papers/).

<br>
## Income Mobility, Health and Mortality

Recent research on U.S. income mobility and health using community and individual data shows that higher  mobility is associated with lower mortality risks. That relationship seems to be stronger and more consistent than the relationship between income inequality and health (a topic widely studied), although considerably smaller than the impact of income on mortality. This preliminary evidence suggests that income mobility might be a relevant determinant of health and mortality. Surprisingly, this potential pathway has received little attention in the literature.

My **dissertation** builds on that small literature and examines the robustness of the relationship between income mobility and health at the aggregate and individual level. By using different data sources and modeling approaches, I describe the magnitude and variability of this association in the U.S., and explore the plausibility and consistency of explanations offered in the literature. The central argument is that the effect of income mobility on health is stronger and larger than the impact of income inequality and that the mechanisms behind it, although related to income inequality, are theoretically distinct and independent of those of income and inequality, and can have powerful and lasting consequences.

To ground this argument, I use two strategies. First, I analyze aggregate and individual data to assess the magnitude, robustness, and variability of the *effects* of income mobility, and empirically examine whether some of the potential pathways and mechanisms proposed in the literature are supported by the data. Secondly, building on this evidence, I use a theoretical model to assess the conditions and plausibility of the potential mechanisms involved in the  association between income mobility and health. By formulating a generative model, where I precisely define (represent) a set of mechanisms (causal relationships) likely to bring about the observed patterns, I am able to assess the internal consistency of the theory and evaluate its generative sufficiency.

[More info here.](https://github.com/sdaza/dissertation)

Below, an example of agents moving across counties / neighborhoods based on the income of their residents.

<p align='center'>
  <img class="fixed-ratio-resize" src='../images/abm.gif'>
</p>

### The Consequences of Incarceration for Health and Mortality
*with Alberto Palloni and Jerrett Jones*

In light of the expansion of the criminal justice system, researchers have become increasingly interested in the social consequences of incarceration. A line of this research suggests that incarceration has negative implications for individuals’ health and well-being at older ages. However, prior studies are limited in that they have not adequately followed former prisoners over a sufficient time period to determine whether incarceration significantly increases mortality.

This project contributes to this growing literature by employing the Panel Study of Income Dynamics (PSID), a long longitudinal data resource, to examine the consequences of incarceration for health and mortality. First, we estimate the effect of short and long-term effects of incarceration on mortality and disability over a period of nearly 40 years. Second, we use those estimates and different counterfactual scenarios to assess to what extent mass incarceration contributes to the so called U.S. health disadvantage. This project is funded by the The Panel Study of Income Dynamics (PSID), with support from the National Institute on Aging.

Thanks to an extension of this grant, we are also examining how contextual characteristics influence health and well-being over the life course. For this, we plan to expand the PSID data by merging them with incarceration information from the National Corrections Reporting Program (NCRP 2000-2014) at the county level, in addition to other crime and arrests data from Uniform Crime Reports (UCR), and socioeconomic information from the American Community Survey (e.g., employment, poverty, health, inequality).

<style>
.fixed-ratio-resize {
	max-width: 60%;
	height: auto;
	width: auto:
}
</style>

<br>

<p align='center'>
  <img class="fixed-ratio-resize" src='../images/incarceration.png'>
</p>

<br>

## Women Reentry Study
*with Pilar Larroulet and Catalina Droppelmann*

The re-entry study is an intensive longitudinal project that follows more than 200 women released from prison in Santiago, Chile. It is funded by the [San Carlos de Maipo](http://www.fsancarlos.cl/) and [Colunga](https://www.fundacioncolunga.org/) Foundation, and the [Inter-American Development Bank](http://www.iadb.org/). We used interviews over a period of one year to know their experiences on  family life, housing, employment, social capital and health. Data collection started in September 2016. [More details here](https://github.com/sdaza/reentry-chile).

<br>
<p align='center'>
  <img src='../images/reentry.png'>
</p>

<br>
<!-- ![](../images/reentry.png) -->

## Agent-Based Models for Assessing Complex Statistical Models: An Example Evaluating Selection and Social Influence Estimates from the SIENA model
*with Kurt Kreuger*

Although Agent-based models (ABM) have been increasingly accepted in social sciences as a valid tool to formalize theory, propose mechanisms able to recreate regularities, and guide empirical research, we are not aware of any research using ABMs to assess the robustness of our statistical methods. We argue that ABMs can be extremely helpful to assess models when the phenomena under study is complex. As an example, we create an agent-based model (ABM) to evaluate Stochastic Actor-Oriented Model (SIENA) estimation of selection and influence effects. The SIENA Model, proposed by Tom A. B. Snijders and colleagues, is a prominent network analysis method that has gained popularity during the last ten years and been applied to estimate selection and influence for a broad range of behaviors and traits such as substance use, delinquency, violence, health, and educational attainment. However, we know little about the conditions for which this method is reliable or the particular biases it might have. The results from our analysis show that selection and influence are estimated by SIENA asymmetrically, and that with very simple assumptions, we can generate data where selection estimates are highly sensitive to mis-specification, suggesting caution when interpreting SIENA analyses.

<br>
![](../images/action_chart.png)

<br>


## Lambda
*with Alberto Palloni and Hiram Beltran-Sanchez*

The [Latin American Mortality Database](https://www.ssc.wisc.edu/cdha/latinmortality/) (LAMBdA) was originally created to support the empirical study of the history of mortality trends in Latin American countries after independence. It now supports the study of very recent mortality trends and is particularly suited for the study of old age mortality during the post-WWII period. The database covers the interval between 1848 and 2014, it includes population censuses, age-specific (five year and single year age groups) total death counts (starting in 1900), and by causes of deaths (starting in 1945). It contains over 170 years of data including adjusted life tables (about 500 life tables). In this project, we assess estimate and model uncertainty of the association between life expectancy and economic progress using Bayesian models and stacking. [More info here.](https://github.com/sdaza/lambda)

<br />

