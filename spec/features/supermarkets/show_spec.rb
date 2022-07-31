require 'rails_helper'

RSpec.describe "Supermarket show page" do 
   it "has the name of that supermarket and a link to view all of the items of that supermarket" do 
      safeway = Supermarket.create!(name: "Safeway", location: "Fremont")
      vons = Supermarket.create!(name: "Vons", location: "Irvine")

      customer_1 = Customer.create!(name: "John Bolt", supermarket_id: safeway.id )
      customer_2 = Customer.create!(name: "Amy Adams", supermarket_id: safeway.id )
      customer_3 = Customer.create!(name: "Fred Rogers", supermarket_id: vons.id )

      item_1 = Item.create!(name: "Cereal", price: 4)
      item_2 = Item.create!(name: "Banana", price: 1)
      item_3 = Item.create!(name: "Cooking oil", price: 5)

      customer_item1 = CustomerItem.create!(customer_id: customer_1.id, item_id: item_1.id)
      customer_item2 = CustomerItem.create!(customer_id: customer_2.id, item_id: item_2.id)
      customer_item3 = CustomerItem.create!(customer_id: customer_2.id, item_id: item_3.id)

      visit "/supermarkets/#{safeway.id}"

      expect(page).to have_content("Safeway")
      expect(page).to have_link("Items")
   end

   it "links to the supermarket's item index page" do 
      safeway = Supermarket.create!(name: "Safeway", location: "Fremont")
      vons = Supermarket.create!(name: "Vons", location: "Irvine")

      customer_1 = Customer.create!(name: "John Bolt", supermarket_id: safeway.id )
      customer_2 = Customer.create!(name: "Amy Adams", supermarket_id: safeway.id )
      customer_3 = Customer.create!(name: "Fred Rogers", supermarket_id: vons.id )

      item_1 = Item.create!(name: "Cereal", price: 4)
      item_2 = Item.create!(name: "Banana", price: 1)
      item_3 = Item.create!(name: "Cooking oil", price: 5)

      customer_item1 = CustomerItem.create!(customer_id: customer_1.id, item_id: item_1.id)
      customer_item2 = CustomerItem.create!(customer_id: customer_2.id, item_id: item_2.id)
      customer_item3 = CustomerItem.create!(customer_id: customer_2.id, item_id: item_3.id)

      visit "/supermarkets/#{safeway.id}"

      click_link("Items")

      expect(current_path).to eq("/supermarkets/#{safeway.id}/items")
   end
end

# And when I click on the link,
# I am taken to the supermarkets item index page,
# And I can see a UNIQUE list of all the items that the supermarket has