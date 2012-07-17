class CreateThingsTable < ActiveRecord::Migration

    def self.up
        create_table :things do |t|
            t.references :people
            t.string :name
        end
    end

    def self.down
        drop_table :things
    end
end