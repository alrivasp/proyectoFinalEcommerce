class Conversation < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :message
  belongs_to :received, class_name: "User"
end
