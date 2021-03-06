class Problem
  include Mongoid::Document
  field :problem_id, type: Integer
  field :description, type: String
  field :answer, type: Integer

  field :wrong_number, type: Integer, default: 0
  field :n, type: Float, default: 0.01
  field :result, type: Float, default: 20
  field :time, type: Float, default: 0
  field :last, type: Float, default: 0
end