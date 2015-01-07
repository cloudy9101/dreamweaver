class Category < ActiveRecord::Base
	has_many :targets
end
