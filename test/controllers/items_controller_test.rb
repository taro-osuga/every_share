require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get items_index_url
    assert_response :success
  end

  test "should get new" do
    get items_new_url
    assert_response :success
  end

  test "should get create" do
    get items_create_url
    assert_response :success
  end

  test "should get listing" do
    get items_listing_url
    assert_response :success
  end

  test "should get pricing" do
    get items_pricing_url
    assert_response :success
  end

  test "should get description" do
    get items_description_url
    assert_response :success
  end

  test "should get photo_upload" do
    get items_photo_upload_url
    assert_response :success
  end

  test "should get location" do
    get items_location_url
    assert_response :success
  end

  test "should get update" do
    get items_update_url
    assert_response :success
  end

end
