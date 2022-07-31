# As a visitor, 
# When I visit a customer show page,
# I see its a list of its items
# And the name of the supermarket that it belongs to

require 'rails_helper'
RSpec.describe "Customer show page" do 
   it "has a list of that customer's items, and the name of the Supermarket it belongs to" do 
      safeway = Supermarket.create!(name: "Safeway", location: "Fremont")
      vons = Supermarket.create!(name: "Vons", location: "Irvine")

      customer_1 = Customer.create!(name: "John Bolt", supermarket_id: safeway.id )
      customer_2 = Customer.create!(name: "Amy Adams", supermarket_id: safeway.id )
      customer_3 = Customer.create!(name: "Fred Rogers", supermarket_id: vons.id )

      item_1 = Item.create!(name: "Cereal", price: 4)
      item_2 = Item.create!(name: "Banana", price: 1)
      item_3 = Item.create!(name: "Cooking oil", price: 5)

      customer_item1 = CustomerItem.create!(customer_id: customer_1.id, item_id: item_1.id)
      customer_item2 = CustomerItem.create!(customer_id: customer_1.id, item_id: item_2.id)
      customer_item3 = CustomerItem.create!(customer_id: customer_2.id, item_id: item_3.id)

      visit "/customers/#{customer_1.id}"

      expect(page).to have_content("Safeway")
      expect(page).to have_content("Cereal")
      expect(page).to have_content("Banana")
      expect(page).to_not have_content("Cooking oil")

   end
end