require 'test_helper'

class SubGruposControllerTest < ActionController::TestCase
  setup do
    @sub_grupo = sub_grupos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sub_grupos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sub_grupo" do
    assert_difference('SubGrupo.count') do
      post :create, sub_grupo: { nome: @sub_grupo.nome }
    end

    assert_redirected_to sub_grupo_path(assigns(:sub_grupo))
  end

  test "should show sub_grupo" do
    get :show, id: @sub_grupo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sub_grupo
    assert_response :success
  end

  test "should update sub_grupo" do
    patch :update, id: @sub_grupo, sub_grupo: { nome: @sub_grupo.nome }
    assert_redirected_to sub_grupo_path(assigns(:sub_grupo))
  end

  test "should destroy sub_grupo" do
    assert_difference('SubGrupo.count', -1) do
      delete :destroy, id: @sub_grupo
    end

    assert_redirected_to sub_grupos_path
  end
end
