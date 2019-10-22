class PortfolioSerializer < ActiveModel::Serializer
  attributes :id, :login, :avatar_url, :name, :location, :email, :start, :last_update, :bio, :start_year, :bio_full

  has_many :repositories

  def bio
    object.bio[0..100]+"..." if object.bio
  end

  def bio_full
    object.bio
  end

  def start_year
    object.start&.year
  end
end
