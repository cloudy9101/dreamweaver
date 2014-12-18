module ApplicationHelper
	def get_title(title)
		if !title.blank?
			return "#{title} | 捕梦网"
		else
			return "捕梦网"
		end
	end
end
