class App < ActiveRecord::Base
  belongs_to :user, inverse_of: :apps
  has_many :builds, inverse_of: :app

  def to_param
    name
  end

end