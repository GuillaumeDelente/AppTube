class Build < ActiveRecord::Base
  belongs_to :app, inverse_of: :builds
  has_attached_file :apk
  validates :apk, presence: true
  validates_attachment_content_type :apk, content_type: 'application/zip'
end
