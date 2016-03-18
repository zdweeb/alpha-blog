require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
  
  test "get new category form and create category" do
    get new_category_path # checks route
    assert_template "categories/new" # checks if template
    assert_difference "Category.count", 1 do
      post_via_redirect categories_path, category: {name: "sports"}  # checks for record in db
    end
    assert_template 'categories/index' # checks if it displayed in template
    assert_match "sports", response.body # checks if matches our category name of sports
  end
  
  test "invalid_category_submission_results_in_failure" do
    get new_category_path # checks route
    assert_template "categories/new" # checks if template
    assert_no_difference "Category.count" do
      post categories_path, category: {name: " "}  # checks for record in db
    end
    assert_template 'categories/new' # checks if it displayed in template
    assert_select "h4.title"
    assert_select "div.panel-body"
  end
  
end