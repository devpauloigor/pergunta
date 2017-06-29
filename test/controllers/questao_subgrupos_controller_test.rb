require 'test_helper'

class QuestaoSubgruposControllerTest < ActionController::TestCase
  setup do
    @questao_subgrupo = questao_subgrupos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:questao_subgrupos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create questao_subgrupo" do
    assert_difference('QuestaoSubgrupo.count') do
      post :create, questao_subgrupo: { questao_id: @questao_subgrupo.questao_id, sub_grupo_id: @questao_subgrupo.sub_grupo_id }
    end

    assert_redirected_to questao_subgrupo_path(assigns(:questao_subgrupo))
  end

  test "should show questao_subgrupo" do
    get :show, id: @questao_subgrupo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @questao_subgrupo
    assert_response :success
  end

  test "should update questao_subgrupo" do
    patch :update, id: @questao_subgrupo, questao_subgrupo: { questao_id: @questao_subgrupo.questao_id, sub_grupo_id: @questao_subgrupo.sub_grupo_id }
    assert_redirected_to questao_subgrupo_path(assigns(:questao_subgrupo))
  end

  test "should destroy questao_subgrupo" do
    assert_difference('QuestaoSubgrupo.count', -1) do
      delete :destroy, id: @questao_subgrupo
    end

    assert_redirected_to questao_subgrupos_path
  end
end
