---
layout: default
title: home
permalink: /
description: <a href="#">Affiliations</a>. Address. Contacts.

#profile:
#  align: right
#  image: prof_pic.jpg
# address: >
#    <p>Dept of Data Science, Dana Farber Cancer Institute</p>

news: false
social: true
---

We develop and apply computational methods to learn how spatial organization in tissues is related to normal and disease cell states. We study organization at multiple scales of organization, ranging from the tissue level architecture that governs cell-cell interactions, to the packaging of euchromatin and heterochromatin in the nucleus, down to the individual DNA loops that connect genes to their regulatory elements. 

<div class="d-flex justify-content-center">
  <h5>Gene expression is regulated by spatial organization at multiple scales:</h5>
</div>

<div class="multi-scale-bar"></div>

<div class="projects grid">
<div class="row">
  {% assign sorted_projects = site.projects | sort: "importance" %}
  {% for project in sorted_projects %}
  <div class="col-sm-1 mt-3 mt-md-0">
  <div class="grid-item">
    {% if project.redirect %}
    <a href="{{ project.redirect }}" target="_blank">
    {% else %}
    <a href="{{ project.url | relative_url }}">
    {% endif %}
      <div class="card hoverable">
        {% if project.img %}
        <img src="{{ project.img | relative_url }}" alt="project thumbnail">
        {% endif %}
        <div class="card-body">
          <h2 class="card-title">{{ project.title }}</h2>
          <p class="card-text">{{ project.description }}</p>
          <div class="row ml-1 mr-1 p-0">
            {% if project.github %}
            <div class="github-icon">
              <div class="icon" data-toggle="tooltip" title="Code Repository">
                <a href="{{ project.github }}" target="_blank"><i class="fab fa-github gh-icon"></i></a>
              </div>
              {% if project.github_stars %}
              <span class="stars" data-toggle="tooltip" title="GitHub Stars">
                <i class="fas fa-star"></i>
                <span id="{{ project.github_stars }}-stars"></span>
              </span>
              {% endif %}
            </div>
            {% endif %}
          </div>
        </div>
      </div>
    </a>
  </div>
  </div>
{% endfor %}

</div>






