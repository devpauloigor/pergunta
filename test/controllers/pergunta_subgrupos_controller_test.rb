require 'test_helper'

class PerguntaSubgruposControllerTest < ActionController::TestCase
  setup do
    @pergunta_subgrupo = pergunta_subgrupos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pergunta_subgrupos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pergunta_subgrupo" do
    assert_difference('PerguntaSubgrupo.count') do
      post :create, pergunta_subgrupo: { pergunta_id: @pergunta_subgrupo.pergunta_id, sub_grupo_id: @pergunta_subgrupo.sub_grupo_id }
    end

    assert_redirected_to pergunta_subgrupo_path(assigns(:pergunta_subgrupo))
  end

  test "should show pergunta_subgrupo" do
    get :show, id: @pergunta_subgrupo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pergunta_subgrupo
    assert_response :success
  end

  test "should update pergunta_subgrupo" do
    patch :update, id: @pergunta_subgrupo, pergunta_subgrupo: { pergunta_id: @pergunta_subgrupo.pergunta_id, sub_grupo_id: @pergunta_subgrupo.sub_grupo_id }
    assert_redirected_to pergunta_subgrupo_path(assigns(:pergunta_subgrupo))
  end

  test "should destroy pergunta_subgrupo" do
    assert_difference('PerguntaSubgrupo.count', -1) do
      delete :destroy, id: @pergunta_subgrupo
    end

    assert_redirected_to pergunta_subgrupos_path
  end
end
