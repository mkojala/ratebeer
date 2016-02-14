include Helpers
describe "User" do
  let!(:brewery) { FactoryGirl.create :brewery, name:"Koff" }
  let!(:beer1) { FactoryGirl.create :beer, name:"iso 3", brewery:brewery }
  let!(:beer2) { FactoryGirl.create :beer, name:"Karhu", brewery:brewery }
  let!(:user) { FactoryGirl.create :user }
  let!(:user1) {FactoryGirl.create :user, username:"Mandu", password:"1Salainen", password_confirmation:"1Salainen"}

  before :each do
    sign_in(username:"Pekka", password:"Foobar1")
  end

  it "when on user page show own ratings" do
    beer = create_beer_with_rating(user, 10)
    beer2 = create_beer_with_rating(user1, 15)
    visit user_path(user)
    expect(page).to have_content 'Ratings: '
    expect(user.ratings.count).to eq(1)
    end

  it "when deletes rating, it gets removed from database" do
    beer = create_beer_with_rating(user, 10)
    visit user_path(user)
    expect{
      click_link "delete"
    }.to change{user.ratings.count}.from(1).to(0)
  end

  def create_beer_with_rating(user, score)
    beer = FactoryGirl.create(:beer)
    FactoryGirl.create(:rating, score:score,  beer:beer, user:user)
    beer
    end
end
