class Category < ApplicationRecord

  has_many :comics, dependent: :destroy

end
