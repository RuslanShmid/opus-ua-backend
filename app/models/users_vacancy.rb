class UsersVacancy < ApplicationRecord
  validate :image_size_validation
  belongs_to :vacancy

  def initialize(params = {})
    @file = params.delete(:file)
    super
    if @file
      self.filename = @file.original_filename
      self.content_type = @file.content_type
      self.file_contents = @file.read
    end
  end

  def image_size_validation
    errors[:file] << 'should be less than 5 megabyte' if @file && @file.size > 5.megabytes
  end
end
