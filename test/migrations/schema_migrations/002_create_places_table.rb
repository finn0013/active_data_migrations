class CreatePlacesTable < ActiveRecord::Migration

    def self.up
        create_table :places do |t|
            t.references :people
            t.string :name
        end
    end

    def self.down
        drop_table :places
    end
end