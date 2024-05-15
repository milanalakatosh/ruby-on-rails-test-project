require "application_system_test_case"
require 'securerandom'

class AuthorsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit authors_url

    assert_selector "h1", text: "Authors"
  end

  test "should create Author" do
    visit authors_path

    click_on "New Author"

    fill_in "author_first_name", with: "Test name"
    fill_in "author_last_name", with: "Test surname"
    random_email = "test-#{SecureRandom.hex(4)}@example.com"
    fill_in "Email", with: random_email
  
    click_on "Create Author"
  
    assert_text "Test name"
    assert_text "Test surname"
  end

  setup do
    @author = authors(:one)
  end

  test "should edit Author" do
    visit edit_author_path(@author)

    fill_in "author_first_name", with: "Updated Name"
    fill_in "author_last_name", with: "Updated Last Name"

    click_on "Update Author"

    assert_text "Updated Name"
  end

  setup do
    @author = authors(:two)
  end

  test "should delete Author" do
    visit author_path(@author)

    assert_text "First Name: #{@author.first_name}"
    assert_text "Last Name: #{@author.last_name}"
    assert_text "Email: #{@author.email}"

    accept_confirm do
      click_on "Delete Author", match: :first
    end

    assert_no_text "#{@author.first_name} #{@author.last_name}", wait: 10
end
end
