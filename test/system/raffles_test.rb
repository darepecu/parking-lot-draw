require "application_system_test_case"

class RafflesTest < ApplicationSystemTestCase
  setup do
    @raffle = raffles(:one)
  end

  test "visiting the index" do
    visit raffles_url
    assert_selector "h1", text: "Raffles"
  end

  test "creating a Raffle" do
    visit raffles_url
    click_on "New Raffle"

    fill_in "Applicant", with: @raffle.applicant_id
    check "Assigned" if @raffle.assigned
    fill_in "Parking", with: @raffle.parking_id
    fill_in "Random selected", with: @raffle.random_selected
    click_on "Create Raffle"

    assert_text "Raffle was successfully created"
    click_on "Back"
  end

  test "updating a Raffle" do
    visit raffles_url
    click_on "Edit", match: :first

    fill_in "Applicant", with: @raffle.applicant_id
    check "Assigned" if @raffle.assigned
    fill_in "Parking", with: @raffle.parking_id
    fill_in "Random selected", with: @raffle.random_selected
    click_on "Update Raffle"

    assert_text "Raffle was successfully updated"
    click_on "Back"
  end

  test "destroying a Raffle" do
    visit raffles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Raffle was successfully destroyed"
  end
end
