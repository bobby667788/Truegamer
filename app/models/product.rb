class Product < ApplicationRecord
    validates_presence_of :name, :price
    validates_numericality_of :price
    belongs_to :category
end
