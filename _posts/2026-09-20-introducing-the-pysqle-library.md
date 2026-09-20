---
layout: post
title: "Introducing the PySQLe-library"
date: 2026-09-20
author: Doeke Zanstra
category: ICT
---

I've been using the excellent [PugSQL library][pugsql] for some years now. It's very easy to use: just annotate your SQL queries in a text-file with a name, result-type and parameters; then load the sql file with a PugSQL module and you can run queries by calling a method with the name of the query. The calling in Python is handled by the `__call__`-method of the module. While this is elegant by itself, you don't get to have all the standard goodness you get by using Python's native function definitions.

I've been using SQL since ever, and I wanted a way to run it from within Python without much hassle. What if you could link a Python function to a SQL query in some way? That's exactly what I made __PySQLe__. Let me demonstrate how this could work:

```python
from pysqle import PysqleModule, one

class MyQueries(PysqleModule):
    @one
    def find_user(self, user_id):
        return """select * from users where user_id = :user_id"""

queries = MyQueries("sqlite:///foo.db")
user = queries.find_user(user_id=666)
```

First you create a class and subclassing it from the `PysqleModule`-class. Then you define your queries by writing methods. They can have arguments, which will be passed to the database when executing the queries. The query-method itself should returns the SQL query. Finally, you decorate the class with one of the supplied query-decorators. That is where the magic happens: `@one` will take of executing the SQL when the method is called. The `@one`-decorator will return one record (or `None` when nothing was found).

By instantiating the class with a SQLAlchemy connection string, you create an object to call queries with. By calling `queries.find_user`, the SQL is executed with the `foo.db`-database, and `user` will contain a named tuple of the found user, just as SQLAlchemy would.

You can use other decorators, like `many` which returns a recordset, or `scalar` which returns one single value. Because it's standard Python, query parameters can have default values, type-annotations and either positional or keyword arguments. Example:

```python
    # Omited class definition, assuming extending the class MyQueries from above
    # ...
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

The repository contains some documentation, like a little more elaborate [Overview][] and the complete [Guide][] until so far.


What's Next
-----------

Writing this library is a learning experience for me. I never had an idea for a reusable Python library until now. This is clearly a first version; I have some more ideas to make this library more usable. One thing is to make get the type annotations work everywhere (for example: `reveal_type` is not reporting the correct return type on annotated query-methods). Another idea is to add support for loading PugSQL annotated files. If you have any ideas or comments, I would like to hear them.


[pugsql]: https://pugsql.org
[Overview]: https://codeberg.org/doekman/PySQLe/src/branch/main/doc/overview.md
[Guide]: https://codeberg.org/doekman/PySQLe/src/branch/main/doc/guide.md


