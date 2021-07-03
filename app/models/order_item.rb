class OrderItem < ApplicationRecord
  belongs_to :user

  def self.of_user(user)
    where(user_id: user.id)
  end
end
