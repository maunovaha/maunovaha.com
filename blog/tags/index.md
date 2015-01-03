---
title: Tags
layout: page
---

{% capture tags %}
  {% for tag in site.tags %}
    {{ tag[0] }}
  {% endfor %}
{% endcapture %}
{% assign sortedtags = tags | split:' ' | sort %}

{% for tag in sortedtags %}
  <h2 id="{{ tag }}">#{{ tag }} <span style="color: #999;">x 12</span></h2>
  <ul style="list-style-type: circle;">
  {% for post in site.tags[tag] %}
    <li style="margin-top: 6px;"><a href="{{ post.url }}">{{ post.title }}</a>
      {% if forloop.first %}
      <p>
        I've been programming for a quite sometime, many years actually. I got my first experiences to programming over 13 years ago when notepad was still a superb text editor and internet explorer 6 "amazing" browser.. <a href="#" style="font-size: 14px;">continue reading &raquo;</a>
      </p>
      {% endif %}
    </li>
    <li style="margin-top: 6px;"><a href="#">This is my interesting topic of something.</a></li>
    <li style="margin-top: 6px;"><a href="#">Looking back: what went wrong with my previous games.</a></li>
  {% endfor %}
  </ul>
{% endfor %}

<p style="margin-top: 40px; font-size: 14px; border-top: 1px solid #eee; padding-top: 40px; text-align: center;">
  <a href="{{ site.posts.first.url }}" style="border: 1px solid #ccc; padding: 6px 12px; border-radius: 6px; color: #3A4145;">Go back to blog</a>
</p>

<!--
<p style="margin-top: 40px; font-size: 14px; border-top: 1px solid #eee; padding-top: 20px;">
  <a href="#" style="float: left; border: 1px solid #ccc; padding: 6px 12px; border-radius: 6px; color: #3A4145;">&laquo; Previous post</a>
  <a href="#" style="float: right; border: 1px solid #ccc; padding: 6px 12px; border-radius: 6px; color: #3A4145;">Next post &raquo;</a>
</p>
-->
