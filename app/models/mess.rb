class Mess < ApplicationRecord
    has_many :roominfos
    has_many :rooms, through: :roominfos
end
