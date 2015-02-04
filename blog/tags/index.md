---
title: Tags
layout: default
section: tags
---

<div class="pure-u-1">
  <header class="page-header">
    <h1 class="page-title">{{ page.title }}</h1>
    <p class="page-meta">Total of {{ site.tags.size }} unique tag{% if site.tags.size > 1%}s{% endif %} and {{ site.posts.size }} blog post{% if site.posts.size > 1%}s{% endif %}.</p>
  </header>
  {% capture tags %}{% for tag in site.tags %}{{ tag[0] }}{% if tag[1].size > 1 %}+{{ tag[1].size }}{% endif %}{% unless forloop.last %},{% endunless %}{% endfor %}{% endcapture %}
  {% assign sortedtags = tags | split: ',' | sort_by { |k, v| -v } %}
  {% for tag in sortedtags %}
    {% assign tag_name = tag %}
    {% assign tag_count = nil %}
    {% if tag contains '+' %}
      {% assign tag_name = tag | split: '+' | first %}
      {% assign tag_count = tag | split: '+' | last %}
    {% endif %}
    <h2 id="{{ tag_name }}">#{{ tag_name }}{% if tag_count %}<span class="tag-count"> x {{ tag_count }}</span>{% endif %}</h2>
    <ul>
    {% for post in site.tags[tag_name] %}
      <li><a href="{{ post.url }}">{{ post.title }}</a>
        {% if forloop.first %}
        <p>
          {{ post.excerpt | remove: '<p>' | replace: '</p>', ' ' | strip_html | strip_newlines | truncate: 180 }} <a href="{{ post.url }}" class="continue">continue reading</a>
        </p>
        {% endif %}
      </li>
    {% endfor %}
    </ul>
  {% endfor %}

  <p class="post-navigation">
    <a href="{{ site.first_post }}">&larr;&nbsp;&nbsp;Go back to blog</a>
  </p>
</div>
