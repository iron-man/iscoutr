# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

  ActiveRecord::Base.connection.execute("TRUNCATE table meritbadges") 
  ActiveRecord::Base.connection.execute("TRUNCATE table requirements") 
  
  config = ActiveRecord::Base.configurations['production']
  # system("mysql --user=#{config['username']} --password=#{config['password']} #{config['database']} < db/seed_meritbadges.sql")
  # system("mysql --user=#{config['username']} --password=#{config['password']} #{config['database']} < db/seed_requirements.sql")

  system("psql db/seed_meritbadges.sql #{config['database']} ")
  system("psql db/seed_requirements.sql #{config['database']} ")
