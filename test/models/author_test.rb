require "test_helper"

class AuthorTest < ActiveSupport::TestCase
  def setup
    @author = authors(:one)
  end

  test "should not save author without data" do
    author = Author.new
    assert_not author.save, "Saved the author without any data"
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

  test "should save valid author" do
    author = Author.new(first_name: "Test", last_name: "Test", email: "testUnique@example.com")
    assert author.save, "Could not save valid author"
  end

  test "should find author by id" do
    assert_equal @author, Author.find(@author.id), "Could not find author by id"
  end

  test "should update author attributes" do
    new_first_name = "Jane"
    @author.update(first_name: new_first_name)
    assert_equal new_first_name, @author.reload.first_name, "Could not update author attributes"
  end

  test "should destroy author" do
    author_to_destroy = @author
    @author.destroy
    assert_not Author.exists?(author_to_destroy.id), "Could not destroy author"
  end

end
