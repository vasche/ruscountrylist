# -*- encoding: utf-8 -*-
require 'ruscountrylist'
require 'rails'

module Ruscountrylist
  class Railtie < Rails::Railtie
    rake_tasks do
        load "ruscountrylist/tasks.rb"
    end
  end
end