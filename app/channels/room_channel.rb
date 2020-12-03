class RoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    received =  data['received'].to_i
    sender = data['sender'].to_i
    
    message = Message.create! content: data['message'], sender: sender ,received: received
    
    Conversation.create! message_id: message.id, sender_id: sender ,received_id: received
    
  end
end
