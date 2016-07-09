class Problem
  include Mongoid::Document
  field :id, type: Integer
  field :description, type: String
  field :answer, type: String

  field :wrong_number, type: Integer, default: 0
  field :n, type: Float, default: 0.01
  field :result, type: Float, default: 20
end