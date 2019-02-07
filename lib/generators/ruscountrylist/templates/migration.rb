# -*- encoding: utf-8 -*-
migration_class =
  if ActiveRecord::VERSION::MAJOR >= 5
    ActiveRecord::Migration[4.2]
  else
    ActiveRecord::Migration
  end

class Create<%= model_class_name.pluralize %> < migration_class
  def self.up
    create_table :<%= model_class_name.pluralize.underscore %> do |t|
      t.string :name, null: false           #Наименование
      t.string :fullname                    #Полное наименование
      t.string :english                     #На английском
      t.string :alpha2                      #Alpha2
      t.string :alpha3                      #Alpha3
      t.string :iso                         #ISO
      t.string :location                    #Часть света
      t.string :location_precise            #Расположение
      t.boolean :enabled, :default => true
      t.integer :show_order, :default => 0

      t.timestamps
    end
    add_index :<%= model_class_name.pluralize.underscore %> , :name, :unique => true
  end
  
  def self.down
    drop_table :<%= model_class_name.pluralize.underscore %>
  end
end

