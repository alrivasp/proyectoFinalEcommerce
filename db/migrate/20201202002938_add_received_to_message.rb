class AddReceivedToMessage < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :received, :integer
  end
end
