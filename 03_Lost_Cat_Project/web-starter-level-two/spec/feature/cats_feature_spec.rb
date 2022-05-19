# type: :feature is from capybara test suit

RSpec.describe "Lost Cat - ", type: :feature do
  it "view no entries" do
    visit "/cats"
    expect(page).to have_content "No meow missing, happy day for everyone."
  end
  it "cat entry test" do
    visit "/cats"
    click_link "Missing Meow"
    fill_in "name", with: "Bob"
    fill_in "number", with: "07541545481"
    fill_in "description", with: "Brown fur, spotty face, meows all the time."
    click_button "Submit"
    expect(page).to have_content "Bob"
    expect(page).to have_content "07541545481"
    expect(page).to have_content "Brown fur, spotty face, meows all the time."
    expect(page).to have_no_content "No meow missing, happy day for everyone."
  end

  it("cat deletion test") do
    visit "/cats"
    click_link "Missing Meow"
    fill_in "name", with: "Bob"
    fill_in "number", with: "07541545481"
    fill_in "description", with: "Brown fur, spotty face, meows all the time."
    click_button "Submit"

    click_link "Missing Meow"
    fill_in "name", with: "Tom"
    fill_in "number", with: "07312312311"
    fill_in "description", with: "Blue eye, cheeky face, barks all the time."
    click_button "Submit"

    click_link "Missing Meow"
    fill_in "name", with: "Endre"
    fill_in "number", with: "075475638721"
    fill_in "description", with: "No fur. Doesnt understand the current task."
    click_button "Submit"

    click_button "Tom_delete_btn"
    expect(page).to have_content "Bob"
    expect(page).not_to have_content "Tom"
    expect(page).to have_content "Endre"
  end

  it("cat updating test") do
    visit "/cats"
    click_link "Missing Meow"
    fill_in "name", with: "Bob" #capybara refers to the name= part in the html
    fill_in "number", with: "242234234"
    fill_in "description", with: "Very funny cat. Big whiskers."
    click_button "Submit"
    #/redirect to /edit
    click_button "Bob_update_btn"
    expect(page).to have_content "Bob"
    expect(page).to have_content "242234234"
    expect(page).to have_content "Very funny cat. Big whiskers."
  end
end
