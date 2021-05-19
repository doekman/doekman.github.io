---
layout: post
title:  "Query Trello data with Postgres (JSON)"
date:   2020-04-03
is_listed: true
---

Recently, I was working on a project to automatically create Trello-cards via their API. To do that, I needed some _id_-values from the Trello-board which are not shown in the user-interface. But where does one get these values?

Glad you asked. Every Trello-board can be [exported to JSON][trello_export], and the values I was looking for are available in this export. However, _JSON_ gives you the data in one big piece of text. Wouldn't it be handier to have it available as **tabular data** in a database?

So I created [this git-repository][git_repo] to do just that (you will need the [Postgres][postgresql]-database for this).

The table in which the JSON is stored, is modelled after an [idea of Rob Conery][conery] which basically is: store the JSON in a column, along with another column that uniquely identifies the document. This unique value is also available within the JSON itself. 

For example:

	id, json
	12, '{"id":12, "other":"data"}
	13, '{"id":13, "other":"info"}

The actual table definition is different, but you get the idea. And don't worry about storing the id-value twice: this small abstraction will make your life a bit easier.

On top of this document table, I created views for most used objects, like _cards_ and _lists_. The pretty simple idea of "views on top of json" is pretty powerful. You get a lot of **bang for your buck**!

If you're on a Mac, [Postgres.app][postgresapp] is the easiest way to setup a database, but [Homebrew][brew] works fine too. As client, I use [Postico][] which I really like a lot.

So if you have a postgres database setup, and have cloned the [git project][git_repo], it's easy to create the database object via the terminal by typing:

	make trello

This will create the `trello` schema and within the schema the `document` table in which the json will be loaded and a bunch of views. I've included a Trello export file, so you can load it by running the following command:

	tool/loaddoc.sh data/simple_board_v1.json

`loaddoc` inserts the JSON-document in the database, unless it already exists. In that case it will update the row. To aid this _upsert_ behaviour, I've added a _trigger_ to the database schema that updates the id-column. Ideally, this would be handled by the tool itself. However: this is a minimum-imlementation. I couldn't find anything to load json into the database from the command line.

A note about the id-column. Trello uses hexadecimal identifiers of 24 positions. That's easy for computers, but a little harder for humans. So to ease filtering the views, I've added an integer-column with auto-numbering.

Below the screenshot showing the result in Postico with [this Trello-board][simple_board] loaded; the same one as we just loaded. On the left you see the table and views. Above I've applied a filter, so I only see the lists from the first JSON document. All columns are type-cast. When you hover the image, the right pane is shown which also show type information.

<html>
	<figure tabindex="0">
		<img src="{% link images/2020-03/Query-trello-json-with-postgres_A.png %}" alt="Screen-shot of the Postico application" class="non_hoover">
		<img src="{% link images/2020-03/Query-trello-json-with-postgres_B.png %}" alt="Screen-shot of the Postico application, with right pane" class="hoover">
		<figcaption>
			The trello_list-view, with a filter applied <span class="non_print comment">(mouseover to display right pane)</span>
		</figcaption>
	</figure>
</html>

Since I talked a lot about tooling: when you run `cat .ok` on the command line, you will find some often used commands on your screen. It's called an _ok-profile_. The [ok-bash][]-tool will make it easier to work with this. It also makes you smarter and more efficient.

So if you develop for Trello, you should really [give this a try][git_repo]. And if you are working with JSON documents from other origins, I'm very much interested in your ideas.


[trello_export]: https://help.trello.com/article/747-exporting-data-from-trello-1
[git_repo]: https://github.com/doekman/postgres-with-trello
[simple_board]: https://trello.com/b/ZWvFVK9Z/postgres-with-trello
[conery]: https://rob.conery.io/2015/02/28/document-storage-gymnastics-in-postgres/ "Don't forget to click on the POSTGRES-tag on his site, listing a lot of interesting posts..."
[ok-bash]: https://github.com/secretGeek/ok-bash
[postgresapp]: https://postgresapp.com
[Postico]: https://eggerapps.at/postico/
[postgresql]: https://www.postgresql.org
[brew]: https://brew.sh

---

Originally published <a href="https://gist.github.com/doekman/e9b1530f0150822b464c4f7b0262a4f3">at this gist</a> on GitHub.
