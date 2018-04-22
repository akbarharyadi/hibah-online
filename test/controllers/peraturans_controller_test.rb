require 'test_helper'

class PeraturansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @peraturan = peraturans(:one)
  end

  test "should get index" do
    get peraturans_url
    assert_response :success
  end

  test "should get new" do
    get new_peraturan_url
    assert_response :success
  end

  test "should create peraturan" do
    assert_difference('Peraturan.count') do
      post peraturans_url, params: { peraturan: { file: @peraturan.file, nama: @peraturan.nama } }
    end

    assert_redirected_to peraturan_url(Peraturan.last)
  end

  test "should show peraturan" do
    get peraturan_url(@peraturan)
    assert_response :success
  end

  test "should get edit" do
    get edit_peraturan_url(@peraturan)
    assert_response :success
  end

  test "should update peraturan" do
    patch peraturan_url(@peraturan), params: { peraturan: { file: @peraturan.file, nama: @peraturan.nama } }
    assert_redirected_to peraturan_url(@peraturan)
  end

  test "should destroy peraturan" do
    assert_difference('Peraturan.count', -1) do
      delete peraturan_url(@peraturan)
    end

    assert_redirected_to peraturans_url
  end
end
