class Migration

    class << self

        # Runs a migration, typically an alternative one to the defalt db/migrate schema migration. The default
        # for this task is to look in the /db/data directory. This can be changed by specifying an alternative
        # path by using the MIGRATE_PATH variable.
        def migrate(migration_path)

            puts "\n"

            curr_migration_path = ActiveRecord::Migrator.migrations_path
            puts "Rails migration path currently set to '#{curr_migration_path}'"

            # Configure the database connection.
            ActiveRecord::Base.configurations = Rails.application.config.database_configuration if defined?(Rails)

            # Set up the path to the migration if it is nil.
            migration_path ||= "/db/data"
            puts "Operating with migration path '#{migration_path}'"

            # Set the migration path to ActiveRecord.
            ActiveRecord::Migrator.migrations_path = migration_path
            puts "Updated Rails migration path to '#{ActiveRecord::Migrator.migrations_path}'"

            # Execute the ActiveRecord migration.
            ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
            ActiveRecord::Migrator.migrate(ActiveRecord::Migrator.migrations_paths, ENV["VERSION"] ? ENV["VERSION"].to_i : nil) do |migration|
                ENV["SCOPE"].blank? || (ENV["SCOPE"] == migration.scope)
            end
        ensure
            ActiveRecord::Migrator.migrations_path = curr_migration_path
        end
    end
end