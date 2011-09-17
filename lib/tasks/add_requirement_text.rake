namespace :db do
  desc "Script to update or load in the meritbadge requirement text, as contained on scouting.org"
  task :load_req_text => :environment do
    require 'rubygems'
    require 'nokogiri'
    require 'open-uri'
    
    url = "http://www.scouting.org/scoutsource/BoyScouts/GuideforMeritBadgeCounselors/Review/list.aspx"
    doc = Nokogiri::HTML(open(url))
    
    list_array = []
    
    doc.css("table td li a").each do |link|
      puts link.text
      puts link['href']
      
      list_array << {:title => link.text, :link => link['href']}
      
    end
    
    list_array.each_with_index do |meritbadge_entry, index|
      meritbadge_title = meritbadge_entry[:title].gsub(/[^0-9a-z ]/i, '').to_s.titleize
      if meritbadge_title =~ /Designand/
        meritbadge_title = meritbadge_title.gsub(/Designand/, "Design and")
      elsif meritbadge_title =~ /Inthe/
        meritbadge_title = meritbadge_title.gsub(/Inthe/, "In the")
      end
      
      new_url = "http://www.scouting.org/scoutsource" + meritbadge_entry[:link]
      new_doc = Nokogiri::HTML(open(new_url), 'UTF-8')
      new_doc.css("div#middle-element").each do |requirements|        
        meritbadge = Meritbadge.find_by_name_and_removed_date(meritbadge_title, nil)
        meritbadge.update_attributes(:requirements_text => requirements.inner_html, :requirements_path => new_url) unless meritbadge.nil?
        
        requirement_url = "http://www.scouting.org/scoutsource/BoyScouts/AdvancementandAwards/MeritBadges/~/media/Images/boyscouts/resources/"
        unless meritbadge.nil? || meritbadge.requirements_text.nil?
          new_requirements_text = nil
          if meritbadge.requirements_text =~ /\~\/media\/Images\/boyscouts\/resources\//
            new_requirements_text = meritbadge.requirements_text.gsub(/\~\/media\/Images\/boyscouts\/resources\//, requirement_url)
          elsif meritbadge.requirements_text =~ /\%7E\/media\/Images\/boyscouts\/resources\//i
            new_requirements_text = meritbadge.requirements_text.gsub(/\%7E\/media\/Images\/boyscouts\/resources\//i, requirement_url)
          else
            new_requirements_text = meritbadge.requirements_text
          end
          meritbadge.update_attributes(:requirements_text => new_requirements_text)
        end
        
        # puts meritbadge.requirements_text
      end
      puts "slurped " + meritbadge_title
      # if index > 0
      #   break
      # end     
    end
  end
end