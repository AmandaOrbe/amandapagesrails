class Article < ApplicationRecord
  validates :title, presence: true
  validates :url, uniqueness: true, presence: true
end



