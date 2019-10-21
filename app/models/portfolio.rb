class Portfolio < ApplicationRecord
  has_many :repositories

  accepts_nested_attributes_for :repositories, allow_destroy: true
end
