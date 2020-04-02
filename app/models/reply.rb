class Reply < ApplicationRecord
  include PublicActivity::Common
  #tracked owner: ->(controller, model) { controller && controller.current_user }
  has_many :likes, dependent: :destroy
  belongs_to :user
  belongs_to :conversation

  default_scope -> { order(created_at: :asc)}
  validates :user_id, presence: true
  validates :conversation_id, presence: true
  validates :content, presence: true
end
