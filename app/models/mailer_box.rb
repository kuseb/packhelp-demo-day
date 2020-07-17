class MailerBox < Product
  store_accessor :product_attributes, %w(width height length)
  validates :minimum_quantity, :maximum_quantity, numericality: { greater_than_or_equal_to: 200, less_than_or_equal_to: 1000 }
  validate :width_cannot_be_greater_than_200
  validate :height_cannot_be_greater_than_200
  validate :length_cannot_be_greater_than_200

  def unit_price
    (width + height + length) * 0.1
  end

  private

  def width_cannot_be_greater_than_200
    errors.add(:poly_mailer, 'width should be between 0 and 200') unless !width || width < 0 || width > 200
  end

  def height_cannot_be_greater_than_200
    errors.add(:poly_mailer, 'width should be between 0 and 200') unless !height || height < 0 || height > 200
  end

  def length_cannot_be_greater_than_200
    errors.add(:poly_mailer, 'width should be between 0 and 200') unless !length || length < 0 || length > 200
  end
end
