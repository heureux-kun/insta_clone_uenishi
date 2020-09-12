# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  body       :text(65535)
#  images     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Post < ApplicationRecord
  belongs_to :user
  mount_uploaders :images, PostImageUploader
  serialize :images, JSON # If you use SQLite, add this line.
end
