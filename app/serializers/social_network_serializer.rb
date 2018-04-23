class SocialNetworkSerializer < ActiveModel::Serializer
  attributes :id, :facebook, :google_plus, :skype, :twitter, :linkedin
end
