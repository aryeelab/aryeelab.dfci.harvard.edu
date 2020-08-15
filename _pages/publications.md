---
layout: page
permalink: /publications/
title: selected publications
description: For a full list see <a href="https://www.ncbi.nlm.nih.gov/pubmed/?term=%22Aryee-MJ%22%5BAuthor%5D" target="_blank">PubMed</a>
years: [2020, 2019, 2018, 2017, 2016, 2015, 2014] 
nav: true
---

<div class="publications">

{% for y in page.years %}
  <h2 class="year">{{y}}</h2>
  {% bibliography -f papers -q @*[year={{y}}]* %}
{% endfor %}

</div>
