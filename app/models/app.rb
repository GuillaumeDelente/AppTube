class App < ActiveRecord::Base
  belongs_to :user, inverse_of: :apps
  has_many :builds, inverse_of: :app
  validates :name, presence: true

  def to_param
    name
  end

end