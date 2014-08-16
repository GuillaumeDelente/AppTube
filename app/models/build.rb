class Build < ActiveRecord::Base
  has_attached_file :apk
  belongs_to :app
end
