class User
  include Mongoid::Document
  field :name, type: String
  field :age, type: Integer

  embeds_one :address
end
