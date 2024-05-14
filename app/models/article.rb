class Article < ApplicationRecord
  include Visible

  has_many :comments, dependent: :destroy
  belongs_to :author

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  validates :author_id, presence: true

end
