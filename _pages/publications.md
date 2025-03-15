---
layout: archive
title: "Publications"
permalink: /publications/
author_profile: true
---

{% include base_path %}

{% for category in site.publication_category %}
  {% assign cat_key = category[0] %}
  {% assign cat = category[1] %}
  
  <h2>{{ cat.title }}</h2>
  
  {% for post in site.publications reversed %}
    {% if post.category == cat_key %}
      {% include archive-single.html %}
    {% endif %}
  {% endfor %}
{% endfor %}
