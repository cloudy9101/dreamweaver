module Timeago
	def time_ago
		sec = DateTime.now.to_i - created_at.to_i
		case 
		when sec < 60
			"不到1分钟"
		when sec < 3600
			"约#{sec/60}分钟之前"
		when sec < 86400
			"约#{sec/3600}小时之前"
		when sec < 2592000
			"约#{sec/86400}天之前"
		when sec < 77760000
			"约#{sec/2592000}月之前"
		else
			created_at.strftime "%Y-%m-%m"
		end
	end
end