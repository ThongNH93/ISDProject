class AdCustomer < ActiveRecord::Base

  validates_presence_of :name, :email, :address, :phone, :credit_card
  validates_uniqueness_of :email, :phone, :credit_card

  has_many :ad_orders
  # has_many :places, :through => :ad_orders, :source => :ad_locations
end
