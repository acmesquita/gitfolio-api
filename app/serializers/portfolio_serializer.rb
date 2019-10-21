class PortfolioSerializer < ActiveModel::Serializer
  attributes :id, :login, :avatar_url, :name, :location, :email, :bio, :start, :last_update

  has_many :repositories
end
