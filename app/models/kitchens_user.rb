class KitchensUser < ActiveRecord::Base
  belongs_to :kitchen
  belongs_to :user
end
