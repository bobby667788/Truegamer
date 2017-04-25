class Comment < ApplicationRecord
    validates_presence_of :comment
    validates_length_of :name,:within => 1..70
end
