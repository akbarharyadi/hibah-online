require 'test_helper'

class TentangsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tentang = tentangs(:one)
  end

  test "should get index" do
    get tentangs_url
    assert_response :success
  end

  test "should get new" do
    get new_tentang_url
    assert_response :success
  end

  test "should create tentang" do
    assert_difference('Tentang.count') do
      post tentangs_url, params: { tentang: { gambar: @tentang.gambar, judul: @tentang.judul, konten: @tentang.konten } }
    end

    assert_redirected_to tentang_url(Tentang.last)
  end

  test "should show tentang" do
    get tentang_url(@tentang)
    assert_response :success
  end

  test "should get edit" do
    get edit_tentang_url(@tentang)
    assert_response :success
  end

  test "should update tentang" do
    patch tentang_url(@tentang), params: { tentang: { gambar: @tentang.gambar, judul: @tentang.judul, konten: @tentang.konten } }
    assert_redirected_to tentang_url(@tentang)
  end

  test "should destroy tentang" do
    assert_difference('Tentang.count', -1) do
      delete tentang_url(@tentang)
    end

    assert_redirected_to tentangs_url
  end
end
