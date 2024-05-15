require "test_helper"

class AuthorTest < ActiveSupport::TestCase
  test "should not save author without data" do
    author = Author.new
    assert_not author.save, "Saved the author without any data"
  end
  
  def setup
    @author = authors(:one)
  end

  test "should be valid" do
    assert @author.valid?
  end

  test "first name should be present" do
    author = Author.new(last_name: "Doe", email: "john@example.com")
    assert_not author.valid?
  end

  test "last name should be present" do
    author = Author.new(first_name: "John", email: "john@example.com")
    assert_not author.valid?
  end

  test "email should be present" do
    author = Author.new(first_name: "John", last_name: "Doe")
    assert_not author.valid?
  end

  test "email should be unique" do
    duplicate_author = @author.dup
    @author.save
    assert_not duplicate_author.valid?
  end

end
