---
layout: main
img: scribe
img_link: https://en.wikipedia.org/wiki/Scribe#/media/File:Escribano.jpg
img_credit: Escribano by Jean Le Tavernier. Public Domain via Wikimedia Commons.
title: Schedule
active_tab: schedule
---

<!--
<p style="text-align:center;"><strong>Schedule and readings are subject to change</strong></p>
-->

<h2>Schedule and Readings </h2>

{% capture current_date %}
{{ site.data.dates.start }}
{% endcapture %}

<!-- Create a counter for the current week, set initially to zero: {% increment current_week %} -->

{% assign allpagetotal = 0 %}

<table class="table table-striped"> 
  <tbody>
    <tr>
      <th class="col-xs-1">Week</th>
      <th class="col-xs-1">Date</th>
      <th class="col-xs-1">Topic</th>
      <th class="col-xs-6">Readings</th>
      <th class="col-xs-2">Totals (approximate)</th>
    </tr>
    {% for lecture in site.data.readings %}
        {% capture current_day %}{{ current_date | date: "%s" | date: "%a" }}{% endcapture %}
        {% assign pagetotal = 0 %}
        {% assign optionalpagetotal = 0 %}
        {% assign minutestotal = 0 %}
        {% assign optionalminutestotal = 0 %}
    <tr>
        {% if current_day == "Tue" %}
        <td>Week {{ current_week }}</td>
        <td>{{ current_date | date: "%A," }}<br/>{{ current_date | date: "%b %d" }}</td>
        {% capture current_date %}
        {{ current_date | date: "%s" | plus : 172800 | date: "%Y-%m-%d" }}
        {% endcapture %}
        {% else %}
        <td>Week {% increment current_week %}</td>
        <td>{{ current_date | date: "%A," }}<br/>{{ current_date | date: "%b %d" }}</td>
        {% capture current_date %}
        {{ current_date | date: "%s" | plus : 432000 | date: "%Y-%m-%d" }}
        {% endcapture %}
        {% endif %}      
      <td>
        {% if lecture.slides %}<a href="{{ lecture.slides }}">{{ lecture.title }}</a>
        {% else %}{{ lecture.title }}{% endif %}
	{% if lecture.language %}
	<br/><a href="lin10.html">Language in 10</a>: <a href="{{ lecture.language_slides }}">{{ lecture.language }}</a>
        {% endif %}
      </td>
      <td>
        {% if lecture.reading %}
          <ul class="fa-ul">
          {% for reading in lecture.reading %}
            <li>
            {% if reading.grad_level %}<i class="fa-li fa fa-star"> </i>
            {% elsif reading.optional %}<i class="fa-li fa fa-info-circle"> </i>
            {% else %}<i class="fa-li fa"> </i> {% endif %}
            {{ reading.author }},
            {% if reading.url %}
            <a href="{{ reading.url }}">{{ reading.title }}</a>
            {% else %}
            {{ reading.title }} 
            {% endif %}
            {% if reading.pages %}
            (p.&nbsp;{{ reading.pages }})
            {% elsif reading.times %}
            ({{ reading.times }})
            {% elsif reading.length and reading.length.unit and reading.length.value %}
            (~{{ reading.length.value }} {{ reading.length.unit }})
            {% endif %}
            </li>
            {% if reading.length and reading.length.unit and reading.length.value %}
                {% if reading.length.unit == "pages" %}
                    {% if reading.optional %}
                        {% capture optionalpagetotal %}{{ optionalpagetotal | plus: reading.length.value }}{% endcapture %}
                    {% else %}
                        {% capture pagetotal %}{{ pagetotal | plus: reading.length.value }}{% endcapture %}
                        {% capture allpagetotal %}{{ allpagetotal | plus: reading.length.value }}{% endcapture %}
                    {% endif %}
                {% elsif reading.length.unit == "minutes" %}
                    {% if reading.optional %}
                        {% capture optionalminutestotal %}{{ optionalminutestotal | plus: reading.length.value }}{% endcapture %}
                    {% else %}
                        {% capture minutestotal %}{{ minutestotal | plus: reading.length.value }}{% endcapture %}
                    {% endif %}                
                {% endif %}
            {% endif %}
          {% endfor %}
          </ul>
        {% endif %}
      </td>
      <td>
          <ul class="fa-ul">
			  {% if pagetotal != 0 %}
			      <li>{{ pagetotal }} pages of readings</li>
			  {% endif %}
			  {% if minutestotal != 0 %}
			      <li>{{ minutestotal }} minutes of video</li>
			  {% endif %}
			  {% if optionalpagetotal != 0 %}
			      <li>{{ optionalpagetotal }} pages of optional readings</li>
			  {% endif %}
			  {% if optionalminutestotal != 0 %}
			      <li>{{ optionalminutestotal }} minutes of optional video</li>
			  {% endif %}
          </ul>
      </td>
    </tr>
    {% endfor %}

  </tbody>
</table>

<p>
This course entails approximately {{ allpagetotal }} total pages of required readings for the semester.
</p>
