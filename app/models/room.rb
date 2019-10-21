class Room < ApplicationRecord
    has_many :roominfos
    has_many :messes, through: :roominfos
    has_many :tools, through: :roominfos
end
