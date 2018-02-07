class Plant < ApplicationRecord
  validates :name, :description, presence: true
  has_many :user_plants
  has_many :users, through: :user_plants

  has_attached_file :image,
                    styles: { medium: "300x300>",
                              thumb: "100x100>" },

                    storage: :s3,
                    s3_credentials: {
                        bucket: ENV['S3_BUCKET'],
                        access_key_id: ENV['S3_ACCESS_KEY'],
                        secret_access_key: ENV['S3_SECRET_KEY'],
                        s3_region: ENV['AWS_REGION'],
                        url: :s3_domain_url,
                        s3_host_name: "s3-#{ENV['AWS_REGION']}.amazonaws.com"
                    }
  validates_attachment_content_type :image,
                        content_type: %w(image/jpeg, image/jpg)
end
