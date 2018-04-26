class Reference < ApplicationRecord
  CATEGORIES = ["article", "page", "ressource"]
  validates :url,  presence: true
  validates :category, presence: true, inclusion: {in: CATEGORIES}
end
