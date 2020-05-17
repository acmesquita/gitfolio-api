class Portfolio < ApplicationRecord
  has_many :repositories
  has_many :abilities

  accepts_nested_attributes_for :repositories, allow_destroy: true

  before_commit :process_program_at

  scope :by_login_name_or_email, -> (value) {
    where("login like ? or name like ? or email like ? ", "%#{value}%", "%#{value}%", "%#{value}%")
  }

  scope :no_query_value, -> (){
    self.order(:name).limit(10)
  }

  def process_program_at
    map_languages = repositories.map(&:language_start).sort_by(&:start)
    languages = map_languages.map(&:language).uniq.compact

    languages.each do |language|
      projects_to_language = map_languages.filter{|l| l[:language] == language}
      start = projects_to_language.first[:start]
      count_project = repositories.count{ |r| r.language == language}
      last_project = projects_to_language.last[:start]

      description = "Iniciou em #{start} - Possui #{count_project} projetos - Último projeto em #{last_project}"
      Ability.find_or_create_by({language: language, description: description, kind: 'start_at', portfolio: self}) 
    end
  end
end
