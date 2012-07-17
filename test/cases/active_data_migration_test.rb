# test/test_helper.rb
$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'lib')

require 'rubygems'
require 'active_record'
require 'test/unit'

require 'config'
require 'active_data_migrations'
require 'active_data_migrations/migration'

require "#{MODEL_ROOT}/person"
require "#{MODEL_ROOT}/place"
require "#{MODEL_ROOT}/thing"

ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")

# Test to ensure that the schema is still being migrated as expected.
class ActiveDataMigrationTest < Test::Unit::TestCase

    # TODO: TEST LOCALLY WITH MLT
    # TODO: CREATE README
    # TODO: UPDATE .gitignore
    # TODO: PUBLISH TO RubyGems.org
    # TODO: PUBLISH TO github


    def setup
        Migration.migrate("/test/migrations/schema_migrations")
        assert_schema_structure_valid
    end

    def teardown
        ActiveRecord::Base.connection.tables.each {|table|
            puts "Teardown: Dropping table #{table}"
            ActiveRecord::Base.connection.execute("drop table #{table}")
        }
        assert 0, ActiveRecord::Base.connection.tables.size
    end

    def test_data_migrations_do_not_overwrite_existing_migration_identifier

        # Ensure we are in a known state to start with.
        person_cnt = Person.count
        place_cnt = Place.count
        thing_cnt = Thing.count

        assert_equal 1, person_cnt
        assert_equal 1, place_cnt
        assert_equal 1, thing_cnt

        # Migrate the data
        Migration.migrate("/test/migrations/skip_data_migrations")

        # Make sure we have the expected number of results
        # after all the data migrations have run.
        assert_equal person_cnt, Person.count
        assert_equal place_cnt, Place.count
        assert_equal thing_cnt, Thing.count
    end

    def test_data_migrations

        # Ensure we are in a known state to start with.
        person_cnt = Person.count
        place_cnt = Place.count
        thing_cnt = Thing.count

        assert_equal 1, person_cnt
        assert_equal 1, place_cnt
        assert_equal 1, thing_cnt

        # Migrate the data
        Migration.migrate("/test/migrations/data_migrations")

        # Make sure we have the expected number of results
        # after all the data migrations have run.
        assert_equal person_cnt + 10, Person.count
        assert_equal place_cnt + 10, Place.count
        assert_equal thing_cnt + 10, Thing.count
    end

    private


    def assert_schema_structure_valid
        person_cnt = Person.count
        place_cnt = Place.count
        thing_cnt = Thing.count

        person = Person.new
        person.name = "TestPerson"
        person.save

        place = Place.new
        place.name = "TestPlace"
        place.person = person
        place.save

        thing = Thing.new
        thing.name = "TestThing"
        thing.person = person
        thing.save

        assert_equal person_cnt + 1, Person.count
        assert_equal place_cnt + 1, Place.count
        assert_equal thing_cnt + 1, Thing.count
    end
end