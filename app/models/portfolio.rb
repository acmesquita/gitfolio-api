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
  
    map_languages = repositories.map{|r| r.language_start }
    map_languages.sort_by! {|s| s[:start]}
    languages = map_languages.map{|s| s[:language]}.uniq

    languages.each do |language|
      if !language.nil?
        start = map_languages.filter{|l| l[:language] == language}.first[:start]
        count_project = repositories.select{ |r| r.language == language}.size
        last_project = map_languages.filter{|l| l[:language] == language}.last[:start]

        description = "Iniciou em #{start} - Possui #{count_project} projetos - Último projeto em #{last_project}"
        Ability.find_or_create_by({language: language, description: description, kind: 'start_at', portfolio: self}) 
      end
    end
  end
end
