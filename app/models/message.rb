class Message < ApplicationRecord
    after_create_commit { MessageBroadcastJob.perform_later self }
    has_many :conversations
end
