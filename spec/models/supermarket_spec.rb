require 'rails_helper'

RSpec.describe Supermarket, type: :model do
  describe 'relationships' do
    it { should have_many :customers }
    it { should have_many(:customer_items).through(:customers) }
    it { should have_many(:items).through(:customer_items) }
  end

  describe "model methods" do 
    it "has a unique list of items" do 
      safeway = Supermarket.create!(name: "Safeway", location: "Fremont")
      vons = Supermarket.create!(name: "Vons", location: "Irvine")

      customer_1 = Customer.create!(name: "John Bolt", supermarket_id: safeway.id )
      customer_2 = Customer.create!(name: "Amy Adams", supermarket_id: safeway.id )
      customer_3 = Customer.create!(name: "Fred Rogers", supermarket_id: vons.id )
      customer_4 = Customer.create!(name: "Kristin Stewart", supermarket_id: safeway.id )

      item_1 = Item.create!(name: "Cereal", price: 4)
      item_2 = Item.create!(name: "Banana", price: 1)
      item_3 = Item.create!(name: "Cooking oil", price: 5)
      item_4 = Item.create!(name: "Bread", price: 2)
      item_5 = Item.create!(name: "Pasta", price: 2)

      customer_item1 = CustomerItem.create!(customer_id: customer_1.id, item_id: item_1.id)
      customer_item2 = CustomerItem.create!(customer_id: customer_2.id, item_id: item_2.id)
      customer_item3 = CustomerItem.create!(customer_id: customer_2.id, item_id: item_3.id)
      customer_item4 = CustomerItem.create!(customer_id: customer_4.id, item_id: item_1.id)
      customer_item5 = CustomerItem.create!(customer_id: customer_4.id, item_id: item_4.id)
      customer_item6 = CustomerItem.create!(customer_id: customer_3.id, item_id: item_5.id)

      expect(safeway.unique_items).to eq([item_1.name, item_2.name, item_3.name, item_4.name])
    end
  end
end