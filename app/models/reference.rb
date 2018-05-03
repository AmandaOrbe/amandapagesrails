class Reference < ApplicationRecord
  CATEGORIES = ["article", "page", "tool"]
  validates :url,  presence: true
  validates :category, presence: true, inclusion: {in: CATEGORIES}
end
