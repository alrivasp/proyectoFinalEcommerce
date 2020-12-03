class RoomsController < ApplicationController
  def show_admin
    @messages = Message.joins(:conversations).where(conversations:{sender_id: [1,2]}).where(conversations:{received_id:[1,2]})
  end

  def show_user
    admin_id = 2
    @messages = Message.joins(:conversations).where(conversations:{sender_id: [admin_id,current_user.id]}).where(conversations:{received_id:[admin_id,current_user.id]})
  end
  
  def messenger_admin
    @users = User.all
    
  end
  
  def messenger_user
    @messages = Message.where("sender = ?  OR received = ?", current_user.id, current_user.id).order(created_at: :asc)
  end

  def get_messenger_info
    user = params[:user_id].to_i
    @user = User.find(user)
    @notifications = Message.where("sender = ?  OR received = ?", user, user).order(created_at: :asc)
  end

  def notification_message
    message = params[:msg_chat]
    user_id = params[:user_id].to_i
    message_new = Message.create(content: message, sender: current_user.id, received: user_id)
    Conversation.create(message_id: message_new.id, sender_id:current_user.id, received_id: user_id)
    @notifications = Message.where("sender = ?  OR received = ?", user_id, user_id).order(created_at: :asc)
    @user = User.find(user_id)
  end

  def notification_user_message
    message = params[:msg_chat_user]
    message_new = Message.create(content: message, sender: current_user.id, received: 2)
    Conversation.create(message_id: message_new.id, sender_id:current_user.id, received_id: 2)
    @messages = Message.where("sender = ?  OR received = ?", current_user.id, current_user.id).order(created_at: :asc)
  end

end
