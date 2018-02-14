require 'test_helper'

class HibahsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hibah = hibahs(:one)
  end

  test "should get index" do
    get hibahs_url
    assert_response :success
  end

  test "should get new" do
    get new_hibah_url
    assert_response :success
  end

  test "should create hibah" do
    assert_difference('Hibah.count') do
      post hibahs_url, params: { hibah: { alamat: @hibah.alamat, judul_kegiatan: @hibah.judul_kegiatan, latar_belakang: @hibah.latar_belakang, maksud_dan_tujuan: @hibah.maksud_dan_tujuan, nama: @hibah.nama, on_process: @hibah.on_process, user_id: @hibah.user_id } }
    end

    assert_redirected_to hibah_url(Hibah.last)
  end

  test "should show hibah" do
    get hibah_url(@hibah)
    assert_response :success
  end

  test "should get edit" do
    get edit_hibah_url(@hibah)
    assert_response :success
  end

  test "should update hibah" do
    patch hibah_url(@hibah), params: { hibah: { alamat: @hibah.alamat, judul_kegiatan: @hibah.judul_kegiatan, latar_belakang: @hibah.latar_belakang, maksud_dan_tujuan: @hibah.maksud_dan_tujuan, nama: @hibah.nama, on_process: @hibah.on_process, user_id: @hibah.user_id } }
    assert_redirected_to hibah_url(@hibah)
  end

  test "should destroy hibah" do
    assert_difference('Hibah.count', -1) do
      delete hibah_url(@hibah)
    end

    assert_redirected_to hibahs_url
  end
end
