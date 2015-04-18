class Address
  include Mongoid::Document
  field :zipcode, type: String
  field :street, type: String

  embedded_in :user
end
