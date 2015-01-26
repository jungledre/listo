Cloudinary.config do |c|
  c.api_key=ENV['cloudinary_key']
  c.api_secret=ENV['cloudinary_secret']
  c.cloud_name=ENV['cloud_name']
end
