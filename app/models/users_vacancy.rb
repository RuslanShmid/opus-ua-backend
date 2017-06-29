class UsersVacancy < ApplicationRecord
  validate :image_size_validation

  def initialize(params = {})
    @file = params.delete(:file)
    super
    if @file
      self.filename = sanitize_filename(@file.original_filename)
      self.content_type = @file.content_type
      self.file_contents = @file.read
    end
  end

  def image_size_validation
    errors[:file] << 'should be less than 5 megabyte' if @file.size > 5.megabytes
  end
end
