class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates :movie, uniqueness: { scope: :list, messages: "La liste ne peut contenir qu'une fois le même film" }

  validates :comment, length: { minimum: 6 }
end
