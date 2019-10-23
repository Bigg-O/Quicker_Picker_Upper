class Room < ApplicationRecord
    has_many :roominfos
    has_many :tools
    has_many :messes, through: :roominfos
end
