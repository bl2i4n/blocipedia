class Wiki < ActiveRecord::Base
  default_scope { order('created_at DESC') }
  scope :public_wikis, -> (wikis) { where private: false }
  scope :user_wikis, -> (user) { where user_id: user.id }
  scope :visible_to, lambda { |user| where(:user_id => user.id, :private => true) }
  belongs_to :user
end
