class UpdateInitialData < ActiveRecord::Migration

    def self.up
        puts "== Destroying 10 place records and 10 thing records =============================================="

        Place.destroy_all("name like '%.2'")
        Thing.destroy_all("name like '%.2'")
    end

    def self.down
    end
end