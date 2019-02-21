require "application_system_test_case"

class DressesTest < ApplicationSystemTestCase
  setup do
    @dress = dresses(:one)
  end

  test "visiting the index" do
    visit dresses_url
    assert_selector "h1", text: "Dresses"
  end

  test "creating a Dress" do
    visit dresses_url
    click_on "New Dress"

    fill_in "Description", with: @dress.description
    fill_in "Price", with: @dress.price
    fill_in "Text", with: @dress.text
    fill_in "Title", with: @dress.title
    click_on "Create Dress"

    assert_text "Dress was successfully created"
    click_on "Back"
  end

  test "updating a Dress" do
    visit dresses_url
    click_on "Edit", match: :first

    fill_in "Description", with: @dress.description
    fill_in "Price", with: @dress.price
    fill_in "Text", with: @dress.text
    fill_in "Title", with: @dress.title
    click_on "Update Dress"

    assert_text "Dress was successfully updated"
    click_on "Back"
  end

  test "destroying a Dress" do
    visit dresses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dress was successfully destroyed"
  end
end
