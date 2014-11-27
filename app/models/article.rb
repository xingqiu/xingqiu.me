class Article < ActiveRecord::Base
  belongs_to :author
  mount_uploader :cover, CoverUploader
end
