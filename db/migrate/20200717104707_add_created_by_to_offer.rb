class AddCreatedByToOffer < ActiveRecord::Migration[5.2]
  def change
    add_reference :offers, :user, index: true, foreign_key: true
  end
end
