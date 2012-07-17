require 'active_data_migrations'
require 'rails'

module ActiveDataMigrations

    class Railtie < Rails::Railtie

        railtie_name :active_data_migrations


        rake_tasks do
            load "active_data_migrations/tasks/data_migrations.rake"
        end
    end

end