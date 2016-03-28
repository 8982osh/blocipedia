class Amount < ActiveRecord::Base
	 
 def self.default
    @amount = 15_00
  end
end
