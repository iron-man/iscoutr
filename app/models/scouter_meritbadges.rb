class ScouterMeritbadges < ActiveRecord::Base
  serialize :requirements

#   serialized_attr_accessor :designation, :description, :goal, :completed_date
# 
#   def self.serialized_attr_accessor(*args)
#     args.each do |method_name|
#       method_declarations = <<<STRING
#         def #{method_name}
#           options[:#{method_name}]
#         end
#         def #{method_name}=(value)
#           self.options[:#{method_name}] = value
#         end
# STRING
#       eval method_declarations
#     end
#   end  
end
