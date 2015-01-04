---
title: Tags
layout: default
---

<div class="pure-u-1">
  <header style="border-bottom: 1px solid #eee;">
    <h1>{{ page.title }}</h1>
    <p style="margin-bottom: 40px; color: #999; font-size: 14px;">Total of {{ site.tags.size }} unique tags and {{ site.posts.size }} blog posts.</p>
  </header>

<!--
  {% capture tags %}
    {% for tag in site.tags %}
      {{ tag[0] }}
    {% endfor %}
  {% endcapture %}
  {% assign sortedtags = tags | split: ' ' | sort %}
-->

  {% capture tags %}{% for tag in site.tags %}{{ tag[0] }}{% if tag[1].size > 1 %}+{{ tag[1].size }}{% endif %}{% unless forloop.last %},{% endunless %}{% endfor %}{% endcapture %}
  {% assign sortedtags = tags | split: ',' | sort_by { |k, v| -v } %}
  {% for tag in sortedtags %}
    {% assign tag_name = tag %}
    {% assign tag_count = nil %}
    {% if tag contains '+' %}
      {% assign tag_name = tag | split: '+' | first %}
      {% assign tag_count = tag | split: '+' | last %}
    {% endif %}
    <h2 id="{{ tag_name }}">#{{ tag_name }}{% if tag_count %}<span style="color: #999;"> x {{ tag_count }}</span>{% endif %}</h2>
    <ul style="list-style-type: circle;">
    {% for post in site.tags[tag_name] %}
      <li style="margin-top: 6px;"><a href="{{ post.url }}">{{ post.title }}</a>
        {% if forloop.first %}
        <p>
          {{ post.excerpt | remove: '<p>' | replace: '</p>', ' ' | strip_html | strip_newlines | truncate: 180 }} <a href="{{ post.url }}">continue reading</a>
        </p>
        {% endif %}
      </li>
    {% endfor %}
    </ul>
  {% endfor %}
  <p style="margin-top: 40px; font-size: 14px; border-top: 1px solid #eee; padding-top: 40px; text-align: center;">
    <a href="{{ site.posts.first.url }}" style="border: 1px solid #ccc; padding: 6px 12px; border-radius: 6px; color: #3A4145;">Go back to blog</a>
  </p>
</div>



<!--<a href="#" style="font-size: 14px;">continue reading</a>-->

<!--
<p style="margin-top: 40px; font-size: 14px; border-top: 1px solid #eee; padding-top: 20px;">
  <a href="#" style="float: left; border: 1px solid #ccc; padding: 6px 12px; border-radius: 6px; color: #3A4145;">&laquo; Previous post</a>
  <a href="#" style="float: right; border: 1px solid #ccc; padding: 6px 12px; border-radius: 6px; color: #3A4145;">Next post &raquo;</a>
</p>
-->
