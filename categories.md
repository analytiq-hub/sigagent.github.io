{% for category in site.categories %}
  <h3>{{ category[0] }}</h3>
{% endfor %}

{% for post in site.categories.self_driving_cars %}
 + [{{ post.title }}]({{ page.url }})
{% endfor %}
