class Mess < ApplicationRecord
    belongs_to :tool
    has_many :roominfos
    has_many :rooms, through: :roominfos
end
