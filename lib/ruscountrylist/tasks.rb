# -*- encoding: utf-8 -*-
namespace :ruscountrylist do
  desc "Populate country list"
  task :install, [:model] => :environment do |t, args|
    args.with_defaults(:model => "Country")
    model_name_for_country = args[:model].camelize
    
    require "rexml/document"

    begin
      model_name_for_country.constantize.first
    rescue ActiveRecord::StatementInvalid => e
      raise "Please run migration first"
    end
    
    xml = File.open(File.expand_path('../../../source', __FILE__) +'/country-list.xml')
    doc = REXML::Document.new(xml)
    h = REXML::XPath.each( doc, "//country" )
    h.each do |pars|
      country = model_name_for_country.constantize.new
      country.name = pars.elements[1].text
      country.fullname = pars.elements[2].text
      country.english = pars.elements[3].text
      country.alpha2 = pars.elements[4].text
      country.alpha3 = pars.elements[5].text
      country.iso = pars.elements[6].text
      country.location = pars.elements[7].text
      country.location_precise = pars.elements[8].text
      country.save
    end

  end
end