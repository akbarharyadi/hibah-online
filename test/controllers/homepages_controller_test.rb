require 'test_helper'

class HomepagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @homepage = homepages(:one)
  end

  test "should get index" do
    get homepages_url
    assert_response :success
  end

  test "should get new" do
    get new_homepage_url
    assert_response :success
  end

  test "should create homepage" do
    assert_difference('Homepage.count') do
      post homepages_url, params: { homepage: { gambar_1: @homepage.gambar_1, gambar_2: @homepage.gambar_2, gambar_3: @homepage.gambar_3, text_1_1: @homepage.text_1_1, text_1_2: @homepage.text_1_2, text_1_3: @homepage.text_1_3, text_2_1: @homepage.text_2_1, text_2_2: @homepage.text_2_2, text_3_1: @homepage.text_3_1, text_3_2: @homepage.text_3_2 } }
    end

    assert_redirected_to homepage_url(Homepage.last)
  end

  test "should show homepage" do
    get homepage_url(@homepage)
    assert_response :success
  end

  test "should get edit" do
    get edit_homepage_url(@homepage)
    assert_response :success
  end

  test "should update homepage" do
    patch homepage_url(@homepage), params: { homepage: { gambar_1: @homepage.gambar_1, gambar_2: @homepage.gambar_2, gambar_3: @homepage.gambar_3, text_1_1: @homepage.text_1_1, text_1_2: @homepage.text_1_2, text_1_3: @homepage.text_1_3, text_2_1: @homepage.text_2_1, text_2_2: @homepage.text_2_2, text_3_1: @homepage.text_3_1, text_3_2: @homepage.text_3_2 } }
    assert_redirected_to homepage_url(@homepage)
  end

  test "should destroy homepage" do
    assert_difference('Homepage.count', -1) do
      delete homepage_url(@homepage)
    end

    assert_redirected_to homepages_url
  end
end
