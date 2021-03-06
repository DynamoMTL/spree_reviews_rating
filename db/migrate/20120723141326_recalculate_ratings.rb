class RecalculateRatings < ActiveRecord::Migration
  def change
    Spree::Product.reset_column_information
    Spree::Product.all.each do |p|
      Spree::Product.update_counters p.id, :reviews_count => p.reviews.length
      p.recalculate_rating
    end
  end
end
