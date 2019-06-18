class Subscribtion < ApplicationRecord
  belongs_to :User
  belongs_to :Book
end
