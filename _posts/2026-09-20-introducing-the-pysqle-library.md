---
layout: post
title: "Introducing the PySQLe-Library"
description: "With PySQLe you can easily write parameterized SQL queries in Python, and run it against any SQLAlchemy-supported database."
date: 2026-09-20
author: Doeke Zanstra
category: ICT
---

I've been using the excellent [PugSQL library][pugsql] for some years now. It's very easy to use: just annotate your SQL queries in a text-file with a name, result-type and parameters; then load the sql file with a PugSQL module and you can run queries by calling a method with the name of the query. The calling in Python is handled by the `__call__`-method of the module. While this is elegant by itself, you don't get to have all the standard goodness you get by using Python's native function definitions.

What if you could link a Python function to a SQL query in some way? That's exactly why I made __PySQLe__. Let me demonstrate how this works:

```python
from pysqle import PysqleModule, one

class MyQueries(PysqleModule):
    @one
    def find_user(self, user_id):
        return """select * from users where user_id = :user_id"""

queries = MyQueries("sqlite:///foo.db")
user = queries.find_user(user_id=666)
```

First you create a class (`MyQueries`) and subclassing it from the `PysqleModule`-class. Then you define a query by writing a method (`find_user`). This method can have arguments, which will be passed to the database when executing the queries. The query-method itself should returns the SQL query as a string. Finally, you decorate the class with one of the supplied query-decorators. That is where the magic happens: `@one` will take care of executing the SQL when the method is called, and will return the expected results.

By instantiating the class with a SQLAlchemy connection string, you create an object to call queries with. By calling `queries.find_user`, the SQL is executed with the `foo.db`-database, and `user` will contain a named tuple of the found user, just as SQLAlchemy would.

You can use other decorators, like `many` which returns a recordset, or `scalar` which returns one single value. Because it's standard Python, query parameters can have default values, type-annotations and be used as positional or keyword arguments. Example:

```python
    # ...
    # Omited class definition, assuming extending the class MyQueries from above
    @many
    def get_users(self, category_filter:Optional[str] = None):
        return """select * from users 
                   where :category_filter is null 
                      or :category_filter = category"""

    @scalar
    def get_username(self, user_id:int):
        return """select username from users 
                  where user_id = :user_id"""

# ...

all_users = queries.get_users()
admin_users = queries.get_users(category_filter='admin')
name = queries.get_username(user_id=666)
```

The [repository can be found at Codeberg][pysqle]. The library itself has been [published to PyPI.org][pypi], and can be installed via `pip install pysqle` or equivalent. The repo contains some documentation: an [overview with some more examples][overview], and there is [the complete guide][guide].


What's Next
-----------

Writing this library is a learning experience for me. I never had an idea for a reusable Python library until now. This is clearly a first version; I have some more ideas to make this library more usable. One thing is to make get the type annotations work everywhere (for example: `reveal_type` is not reporting the correct return type on annotated query-methods). Another idea is to add support for loading PugSQL annotated files. If you have any ideas or comments, I would like to hear them.


[pysqle]: https://codeberg.org/doekman/PySQLe/
[pypi]: https://pypi.org/project/pysqle/
[pugsql]: https://pugsql.org
[overview]: https://codeberg.org/doekman/PySQLe/src/branch/main/doc/overview.md
[guide]: https://codeberg.org/doekman/PySQLe/src/branch/main/doc/guide.md

<hr>

<small>Disclaimer: The design of [Maggie Appleton's website](https://maggieappleton.com/keyboard-fetishism/) was copied to this blog page using AI. No AI was otherwise used in creating this post.</small>

<link rel="stylesheet" href="/images/2026-09-20/the.css">
