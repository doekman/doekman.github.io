---
layout: page
title: Pocket Archive
permalink: /archive/pocket/
---

Below the export of my [Pocket](https://support.mozilla.org/en-US/kb/future-of-pocket)-account.

{% assign pocket_export = site.data.pocket_export | sort:'time_added' | reverse %}
<ul>
{% for row in pocket_export %}
    <li>
        <a href="{{row.url}}">{{row.title}}</a> 
        saved on <time data-timestamp="{{row.time_added}}">calculating...</time>
        {% if row.tags %}<span class="tags">[{{row.tags}}]</span>{% endif %}
    </li>
{% endfor %}
</ul>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        let date = new Date();
        for(let ts of document.querySelectorAll('[data-timestamp]')) {
            // timestamp is in seconds since epoch, and JS needs milliseconds
            date.setTime(ts.dataset.timestamp * 1000);
            ts.setAttribute('datetime', date.toISOString());
            ts.innerText = date.toLocaleString();
        }
    });
</script>
