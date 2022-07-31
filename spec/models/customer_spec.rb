require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'relationships' do
    it { should belong_to :supermarket }
    it { should have_many(:customer_items)}
    it { should have_many(:items).through(:customer_items)}
  end

  describe "model methods" do 
      it "total_price" do 
        safeway = Supermarket.create!(name: "Safeway", location: "Fremont")
        customer_1 = Customer.create!(name: "John Bolt", supermarket_id: safeway.id )
        item_1 = Item.create!(name: "Cereal", price: 4)
        item_2 = Item.create!(name: "Banana", price: 1)
        customer_item1 = CustomerItem.create!(customer_id: customer_1.id, item_id: item_1.id)
        customer_item2 = CustomerItem.create!(customer_id: customer_1.id, item_id: item_2.id)

        expect(customer_1.total_price).to eq(5)
      end
    end
  end