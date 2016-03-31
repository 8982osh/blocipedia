class Wiki < ActiveRecord::Base
  belongs_to :user

  scope :visisble_to, -> (user) { user ? all : where(public: true) }
end
