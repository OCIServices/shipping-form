require 'test_helper'

class ShipmentsControllerTest < ActionController::TestCase
  setup do
    @shipment = shipments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shipments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shipment" do
    assert_difference('Shipment.count') do
      post :create, shipment: { address1: @shipment.address1, address2: @shipment.address2, address3: @shipment.address3, address_type: @shipment.address_type, changepoint_code: @shipment.changepoint_code, city: @shipment.city, company: @shipment.company, contents: @shipment.contents, country: @shipment.country, delivery: @shipment.delivery, email: @shipment.email, instructions: @shipment.instructions, insurance: @shipment.insurance, insurance_amount: @shipment.insurance_amount, return_label: @shipment.return_label, sender_email: @shipment.sender_email, sender_name: @shipment.sender_name, sender_phone: @shipment.sender_phone, signature: @shipment.signature, state: @shipment.state, telephone: @shipment.telephone, zip: @shipment.zip }
    end

    assert_redirected_to shipment_path(assigns(:shipment))
  end

  test "should show shipment" do
    get :show, id: @shipment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shipment
    assert_response :success
  end

  test "should update shipment" do
    patch :update, id: @shipment, shipment: { address1: @shipment.address1, address2: @shipment.address2, address3: @shipment.address3, address_type: @shipment.address_type, changepoint_code: @shipment.changepoint_code, city: @shipment.city, company: @shipment.company, contents: @shipment.contents, country: @shipment.country, delivery: @shipment.delivery, email: @shipment.email, instructions: @shipment.instructions, insurance: @shipment.insurance, insurance_amount: @shipment.insurance_amount, return_label: @shipment.return_label, sender_email: @shipment.sender_email, sender_name: @shipment.sender_name, sender_phone: @shipment.sender_phone, signature: @shipment.signature, state: @shipment.state, telephone: @shipment.telephone, zip: @shipment.zip }
    assert_redirected_to shipment_path(assigns(:shipment))
  end

  test "should destroy shipment" do
    assert_difference('Shipment.count', -1) do
      delete :destroy, id: @shipment
    end

    assert_redirected_to shipments_path
  end
end
