class Image < ApplicationRecord
  belongs_to :product, dependent: :destroy
end
