class JobPost < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :min_salary, numericality: { greater_than_or_equal_to: 30_000 }
  validates :description, presence: true, length: { minimum: 100 }
  validates :location, presence: true 

  def self.search(search_term)
    where("title ILIKE ?", "%#{search_term}%")
  end
end
