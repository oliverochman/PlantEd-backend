class Plant < ApplicationRecord
  validates :name, :description, presence: true
  has_many :user_plants
  has_many :users, through: :user_plants

  has_attached_file :image,
                    storage: :s3,
                    s3_credentials: {
                        bucket: ENV['AWS_BUCKET'],
                        access_key_id: ENV['AWS_ACCESS_KEY'],
                        secret_access_key: ENV['AWS_SECRET_KEY'],
                        s3_region: ENV['AWS_REGION'],
                        url: :s3_domain_url,
                        s3_host_name: "s3-#{ENV['AWS_REGION']}.amazonaws.com"
                    },
                    styles: { medium: '300x300>',
                              thumb: '100x100>' }

  validates_attachment :image,
                       content_type:
                           {content_type: %w(image/jpg image/jpeg image/png image/gif)}
end
