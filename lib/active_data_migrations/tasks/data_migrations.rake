require 'active_record'
require 'active_data_migrations/migration'

namespace :db do

    namespace :data do

        desc "Runs a migration, typically an alternative one to the defalt db/migrate schema migration. The default " +
             "for this task is to look in the /db/data directory. This can be changed by specifying an alternative " +
             "path by using the MIGRATE_PATH variable."
        task :migrate => [ :environment, :rails_env ] do
            Migration.migrate(ENV["MIGRATE_PATH"])
        end
    end
end