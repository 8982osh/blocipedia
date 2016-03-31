class Amount < ActiveRecord::Base
	
 #default membership amount	 
 def self.default
    @amount = 15_00
  end
end
