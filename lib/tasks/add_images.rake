namespace :db do
  desc "Script to update or load in the meritbadge images based off a file that has already been generated"
  task :load_images => :environment do
    f = File.open("#{RAILS_ROOT}/doc/parsed_images_list.txt")
    s = f.read
    images = eval(s)
    Meritbadge.all.each do |meritbadge|
        images.each do |image|
        puts "image[:title] == #{image[:title]} \n"
        puts "meritbadge.name == #{meritbadge.name}\n"
        puts "\n"
        if meritbadge.name.to_s.downcase == image[:title].to_s.downcase
          meritbadge.image_url = image[:src]
          meritbadge.save
        end
      end
    end
    f.close
  end
end