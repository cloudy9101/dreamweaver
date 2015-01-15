class Category < ActiveRecord::Base
	has_many :abstract_targets
end
