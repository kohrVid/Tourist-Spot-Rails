class Service < ActiveRecord::Base

	def cart_action(current_user_id)
		if $redis.sismember "cart#{}", id
			"Remove from"
		else
			"Add to"
		end
	end
end
