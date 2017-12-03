class ChatroomUsersController < ApplicationController
	before_action :authenticate_user!
	before_action :setchatroom

	def create
		@chatroom_user = @chatroom.chatroom_users.where(user_id: current_user.id).first_or_create
		redirect_to chatrooms_path
	end

	def destroy
		@chatroom_user = @chatroom.chatroom_users.where(user_id:current_user.id).destroy_all
		redirect_to chatrooms_path
	end

	private
	def setchatroom
		@chatroom = Chatroom.find(params[:chatroom_id])
	end
end
