class CreateInitialData < ActiveRecord::Migration

    def self.up

        puts "== Creating 10 person records, 20 place records, and 20 thing records =============================================="

        (1..10).each {|i|

            person = Person.new
            person.name = "TestPerson#{i}"
            person.save

            place = Place.new
            place.name = "TestPlace#{i}"
            place.person = person
            place.save

            place = Place.new
            place.name = "TestPlace#{i}.2"
            place.person = person
            place.save

            thing = Thing.new
            thing.name = "TestThing#{i}"
            thing.person = person
            thing.save

            thing = Thing.new
            thing.name = "TestThing#{i}.2"
            thing.person = person
            thing.save
        }
    end

    def self.down
    end
end