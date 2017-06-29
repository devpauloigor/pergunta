require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe QuestaoProvasController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # QuestaoProva. As you add validations to QuestaoProva, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # QuestaoProvasController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all questao_provas as @questao_provas" do
      questao_prova = QuestaoProva.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:questao_provas)).to eq([questao_prova])
    end
  end

  describe "GET #show" do
    it "assigns the requested questao_prova as @questao_prova" do
      questao_prova = QuestaoProva.create! valid_attributes
      get :show, {:id => questao_prova.to_param}, valid_session
      expect(assigns(:questao_prova)).to eq(questao_prova)
    end
  end

  describe "GET #new" do
    it "assigns a new questao_prova as @questao_prova" do
      get :new, {}, valid_session
      expect(assigns(:questao_prova)).to be_a_new(QuestaoProva)
    end
  end

  describe "GET #edit" do
    it "assigns the requested questao_prova as @questao_prova" do
      questao_prova = QuestaoProva.create! valid_attributes
      get :edit, {:id => questao_prova.to_param}, valid_session
      expect(assigns(:questao_prova)).to eq(questao_prova)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new QuestaoProva" do
        expect {
          post :create, {:questao_prova => valid_attributes}, valid_session
        }.to change(QuestaoProva, :count).by(1)
      end

      it "assigns a newly created questao_prova as @questao_prova" do
        post :create, {:questao_prova => valid_attributes}, valid_session
        expect(assigns(:questao_prova)).to be_a(QuestaoProva)
        expect(assigns(:questao_prova)).to be_persisted
      end

      it "redirects to the created questao_prova" do
        post :create, {:questao_prova => valid_attributes}, valid_session
        expect(response).to redirect_to(QuestaoProva.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved questao_prova as @questao_prova" do
        post :create, {:questao_prova => invalid_attributes}, valid_session
        expect(assigns(:questao_prova)).to be_a_new(QuestaoProva)
      end

      it "re-renders the 'new' template" do
        post :create, {:questao_prova => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested questao_prova" do
        questao_prova = QuestaoProva.create! valid_attributes
        put :update, {:id => questao_prova.to_param, :questao_prova => new_attributes}, valid_session
        questao_prova.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested questao_prova as @questao_prova" do
        questao_prova = QuestaoProva.create! valid_attributes
        put :update, {:id => questao_prova.to_param, :questao_prova => valid_attributes}, valid_session
        expect(assigns(:questao_prova)).to eq(questao_prova)
      end

      it "redirects to the questao_prova" do
        questao_prova = QuestaoProva.create! valid_attributes
        put :update, {:id => questao_prova.to_param, :questao_prova => valid_attributes}, valid_session
        expect(response).to redirect_to(questao_prova)
      end
    end

    context "with invalid params" do
      it "assigns the questao_prova as @questao_prova" do
        questao_prova = QuestaoProva.create! valid_attributes
        put :update, {:id => questao_prova.to_param, :questao_prova => invalid_attributes}, valid_session
        expect(assigns(:questao_prova)).to eq(questao_prova)
      end

      it "re-renders the 'edit' template" do
        questao_prova = QuestaoProva.create! valid_attributes
        put :update, {:id => questao_prova.to_param, :questao_prova => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested questao_prova" do
      questao_prova = QuestaoProva.create! valid_attributes
      expect {
        delete :destroy, {:id => questao_prova.to_param}, valid_session
      }.to change(QuestaoProva, :count).by(-1)
    end

    it "redirects to the questao_provas list" do
      questao_prova = QuestaoProva.create! valid_attributes
      delete :destroy, {:id => questao_prova.to_param}, valid_session
      expect(response).to redirect_to(questao_provas_url)
    end
  end

end
