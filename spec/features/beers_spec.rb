require 'rails_helper'

include Helpers
describe "Beer" do
  let!(:brewery) { FactoryGirl.create :brewery, name:"Koff" }
  let!(:beer1) { FactoryGirl.create :beer, name:"iso 3", brewery:brewery }
  let!(:beer2) { FactoryGirl.create :beer, name:"Karhu", brewery:brewery }
  let!(:user) { FactoryGirl.create :user }

  before :each do
    sign_in(username:"Pekka", password:"Foobar1")
  end

  it "can be created when name is not empty" do
    visit new_beer_path
    select('Koff', from:'beer[brewery_id]')
    fill_in('beer[name]', with:'uusi bisse')
    
    expect{
      click_button "Create Beer"
    }.to change{Beer.count}.from(2).to(3)
  end

  it "is not created when name is empty" do
    visit new_beer_path
    select('Koff', from:'beer[brewery_id]')
    expect{
      click_button "Create Beer"
    }.not_to change{Beer.count}
    expect(current_path).to eq(beers_path)
    expect(page).to have_content 'prohibited this beer from'

  end
end
