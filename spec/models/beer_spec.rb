require 'rails_helper'

 RSpec.describe Beer, type: :model do


  it "has the name and style set" do
    beer = Beer.create name:"Bisse", style:"Lager"
    expect(beer).to be_valid
    expect(Beer.count).to eq(1)
  end
  it "does not have a name" do
    beer = Beer.create
    expect(beer).not_to be_valid
    expect(Beer.count).to eq(0)
  end
  it "does not have a style" do
    beer = Beer.create name:"Bisse"
    expect(beer).not_to be_valid
    expect(Beer.count).to eq(0)
  end

  end
