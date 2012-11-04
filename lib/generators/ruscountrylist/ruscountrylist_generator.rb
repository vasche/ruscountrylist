# -*- encoding: utf-8 -*-

require 'rails/generators/migration'

module Ruscountrylist
  module Generators
    class RuscountrylistGenerator < Rails::Generators::Base
        include Rails::Generators::Migration

      namespace "ruscountrylist"
      source_root File.expand_path(File.join(File.dirname(__FILE__), 'templates'))

      class_option :model, :optional => true, :type => :string, :banner => "model",
                   :desc => "Specify the model class name if you will use anything other than 'Country'"


      #generate model file
      def create_model
        generate("model #{model_class_name} --skip-migration")
      end
      
      
      #copy migration file
      def copy_migration_file
        migration_template "migration.rb", "db/migrate/create_#{model_class_name.pluralize.underscore}.rb"
      end
      
      def self.next_migration_number(dirname) #:nodoc:
        next_migration_number = current_migration_number(dirname) + 1
        if ActiveRecord::Base.timestamped_migrations
          [Time.now.strftime("%Y%m%d%H%M%S"), "%.14d" % next_migration_number].max
        else
          "%.3d" % next_migration_number
        end
      end
      
      
      private
      
      def model_class_name
        options[:model] ? options[:model].classify : "Country"
      end
      
    end
  end
end