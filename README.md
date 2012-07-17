### Overview

ActiveDataMigrations is a Ruby gem that allows developers to set up multiple migration locations, each of which can be run independent of one another. This library sits on top of ActiveRecord so all standard migration features remain available.

This is particularly useful in cases where you want to separate your data migrations from your schema migrations or where you have multiple steps in your migration process that must have other steps invoked throughout.

### Installation

```sh
$ gem install whenever
```

### Usage

ActiveDataMigrations runs just like a normal migration only it has the ability to point to other source directories. 

Running the following will execute all migrations in the default 'db/data' directory:

```sh
$ rake db:data:migrate
```

To specify an alternative directory run this:

```sh
$ rake db:data:migrate MIGRATE_PATH=/db/alt_migration_path
```

### Example

For example if we have the following directory structure:

`
/db
    /schema
    /data
    /other_data
`

And you needed to run your migration, load some data, do some other task, then load the rest of your data you'd perform the following series of events.

Migrate your schema:

```sh
$ rake db:migrate
```

Migrate your initial data set:
```sh
$ rake db:data:migrate
```

After performing your other tasks, migrate your additional data set:
```sh
$ rake db:data:migrate MIGRATE_PATH=/db/other_data
```

### Things to Note

There are a couple things to note when using this tool:

- The schema_migrations directory is shared across ALL MIGRATIONS. This means that you should make it a practice to have unique identifiers for ALL migration files across ALL migration directories. A good way to use this is to use the date and time for the identifier, such as "201207062043\_update\_some\_data.rb".
- ActiveDataMigrations has been tested with Rails 3. It is not guaranteed to work with other versions of Rails or as a stand alone library.
- Since this simply sits on top of ActiveRecord migrations you can also use it to run a standard schema migration by settin the migrate path to /db/schema (or wherever you have configured your schema root to be).

### Contributing

I welcome any contributions anyone is wanting or willing to give. To contribute to the project you can contact me via <http://www.McDonaldLand.info>.

### License

ActiveDataMigrations is released under the MIT license:

<www.opensource.org/licenses/MIT>

----

Copyright &copy; 2012 Jason McDonald (www.McDonaldLand.info)