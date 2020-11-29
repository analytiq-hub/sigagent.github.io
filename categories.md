{% for category in site.categories %}
  <h4>Category: {{ category[0] }}</h4>
  <ul>
    {% for post in category[1] %}
      <li><a href="{{ post.url }}">{{ post.title }}</a></li>
    {% endfor %}
  </ul>
{% endfor %}


{%- assign date_format = site.minima.date_format | default: "%b %-d, %Y" -%}

{% for category in site.categories %}
  <h4>Category: {{ category[0] }}</h4>
  <ul class="post-list">
  {%- for post in category[1] -%}
  <li>
    <span class="post-meta">{{ post.date | date: date_format }}</span><br>
    <a class="post-link" href="{{ post.url | relative_url }}">
          {{ post.title | escape }}
    </a>
  </li>
  {%- endfor -%}
</ul>
{% endfor %}
