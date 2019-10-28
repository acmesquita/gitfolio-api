class Repository < ApplicationRecord
  belongs_to :portfolio

  def language_start
    {language: language, start: start.year}
  end
end
