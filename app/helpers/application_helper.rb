module ApplicationHelper

	def acts_as_admin
		@user = current_user
		unless current_user && User.find_by(email: "sohrab.uob@gmail.com") == current_user
		flash[:alert] = 'Access denied..! Please login as admin.'
		end
	end
end 
