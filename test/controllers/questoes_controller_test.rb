require 'test_helper'

class QuestoesControllerTest < ActionController::TestCase
  setup do
    @questao = questoes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:questoes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create questao" do
    assert_difference('Questao.count') do
      post :create, questao: { descricao: @questao.descricao }
    end

    assert_redirected_to questao_path(assigns(:questao))
  end

  test "should show questao" do
    get :show, id: @questao
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @questao
    assert_response :success
  end

  test "should update questao" do
    patch :update, id: @questao, questao: { descricao: @questao.descricao }
    assert_redirected_to questao_path(assigns(:questao))
  end

  test "should destroy questao" do
    assert_difference('Questao.count', -1) do
      delete :destroy, id: @questao
    end

    assert_redirected_to questoes_path
  end
end
