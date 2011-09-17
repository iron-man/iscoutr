# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

  ActiveRecord::Base.connection.execute("TRUNCATE table meritbadges") 
  ActiveRecord::Base.connection.execute("TRUNCATE table requirements") 
  
  config = ActiveRecord::Base.configurations[RAILS_ENV]
  
  sql_meritbadges = ""
  sql_meritbadges = File.open("#{RAILS_ROOT}/db/seed_meritbadges.sql").read
  sql_meritbadges = sql_meritbadges.gsub(/\n/," ")
  sql_meritbadges = sql_meritbadges.gsub(/\"/,"'")
  sql_meritbadges = sql_meritbadges.gsub(/\`/,"'")
  Meritbadge.execute_sql(sql_meritbadges)
  
  sql_requirements = ""
  sql_requirements = File.open("#{RAILS_ROOT}/db/seed_requirements.sql").read
  sql_requirements = sql_requirements.gsub(/\n/," ")
  sql_requirements = sql_requirements.gsub(/\"/,"'")
  sql_requirements = sql_requirements.gsub(/\`/,"'")
  Requirement.execute_sql(sql_requirements)
  
  # system("mysql --user=#{config['username']} --password=#{config['password']} #{config['database']} < db/seed_meritbadges.sql")
  # system("mysql --user=#{config['username']} --password=#{config['password']} #{config['database']} < db/seed_requirements.sql")

  # system("psql -f db/seed_meritbadges.sql #{config['database']} ")
  # system("psql -f db/seed_requirements.sql #{config['database']} ")
