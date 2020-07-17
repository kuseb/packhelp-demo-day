class PolyMailer < Product
  store_accessor :product_attributes, %w(width height material)
  validates :minimum_quantity, :maximum_quantity, numericality: { greater_than_or_equal_to: 50, less_than_or_equal_to: 2000 }
  
  validate :width_cannot_be_greater_than_200
  validate :height_cannot_be_greater_than_200
  validate :material_can_be_only_black_or_transparent

  def unit_price
    fee_factor = transparent_material_fee? ? 0.25 : 0.1
    (width + height) * fee_factor
  end

  private

  def width_cannot_be_greater_than_200
    errors.add(:poly_mailer, 'width should be between 0 and 200') if !width || width < 0 || width > 200
  end

  def height_cannot_be_greater_than_200
    errors.add(:poly_mailer, 'height should be between 0 and 200') if !height || height < 0 || height > 200
  end

  def material_can_be_only_black_or_transparent
    errors.add(:poly_mailer, 'material should be black or transparent') unless %w(black transparent).include? material
  end

  def transparent_material_fee?
    material == 'transparent'
  end
end
