class Reply < ApplicationRecord
  include PublicActivity::Common
  #tracked owner: ->(controller, model) { controller && controller.current_user }

  belongs_to :user
  belongs_to :conversation

  default_scope -> { order(created_at: :desc)}
  validates :user_id, presence: true
  validates :conversation_id, presence: true
  validates :content, presence: true
end
