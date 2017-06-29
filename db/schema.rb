# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170123191039) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "dblink"

  create_table "alunos", force: :cascade do |t|
    t.string   "nome"
    t.integer  "turma_id"
    t.integer  "situacao_matricula_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "alunos", ["turma_id"], name: "index_alunos_on_turma_id", using: :btree

  create_table "auditas", force: :cascade do |t|
    t.integer  "questao_id"
    t.integer  "useres_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "audits", force: :cascade do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "associated_id"
    t.string   "associated_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "username"
    t.string   "action"
    t.text     "audited_changes"
    t.integer  "version",         default: 0
    t.string   "comment"
    t.string   "remote_address"
    t.string   "request_uuid"
    t.datetime "created_at"
  end

  add_index "audits", ["associated_id", "associated_type"], name: "associated_index", using: :btree
  add_index "audits", ["auditable_id", "auditable_type"], name: "auditable_index", using: :btree
  add_index "audits", ["created_at"], name: "index_audits_on_created_at", using: :btree
  add_index "audits", ["request_uuid"], name: "index_audits_on_request_uuid", using: :btree
  add_index "audits", ["user_id", "user_type"], name: "user_index", using: :btree

  create_table "grupos", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "provaalunos", force: :cascade do |t|
    t.integer  "prova_id"
    t.integer  "aluno_id"
    t.integer  "status"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.datetime "data"
    t.integer  "duracao"
    t.integer  "mostraresultado"
  end

  add_index "provaalunos", ["aluno_id"], name: "index_provaalunos_on_aluno_id", using: :btree
  add_index "provaalunos", ["prova_id"], name: "index_provaalunos_on_prova_id", using: :btree

  create_table "provas", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "provas", ["user_id"], name: "index_provas_on_user_id", using: :btree

  create_table "questao_provas", force: :cascade do |t|
    t.integer  "prova_id"
    t.integer  "questao_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "questao_provas", ["prova_id"], name: "index_questao_provas_on_prova_id", using: :btree
  add_index "questao_provas", ["questao_id"], name: "index_questao_provas_on_questao_id", using: :btree

  create_table "questao_subgrupos", force: :cascade do |t|
    t.integer  "questao_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "tema_id"
  end

  add_index "questao_subgrupos", ["questao_id"], name: "index_questao_subgrupos_on_questao_id", using: :btree

  create_table "questoes", force: :cascade do |t|
    t.text     "descricao"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "figura_file_name"
    t.string   "figura_content_type"
    t.integer  "figura_file_size"
    t.datetime "figura_updated_at"
    t.integer  "SubGrupo_id"
  end

  create_table "respostaalunos", force: :cascade do |t|
    t.integer  "provaaluno_id"
    t.integer  "resposta_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "respostaalunos", ["provaaluno_id"], name: "index_respostaalunos_on_provaaluno_id", using: :btree
  add_index "respostaalunos", ["resposta_id"], name: "index_respostaalunos_on_resposta_id", using: :btree

  create_table "respostas", force: :cascade do |t|
    t.text     "descricao"
    t.integer  "correta"
    t.integer  "pergunta_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "resultados", force: :cascade do |t|
    t.integer  "provaaluno_id"
    t.integer  "questao_id"
    t.integer  "resposta_id"
    t.integer  "correta"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "resultados", ["provaaluno_id"], name: "index_resultados_on_provaaluno_id", using: :btree
  add_index "resultados", ["questao_id"], name: "index_resultados_on_questao_id", using: :btree
  add_index "resultados", ["resposta_id"], name: "index_resultados_on_resposta_id", using: :btree

  create_table "sub_grupos", force: :cascade do |t|
    t.string   "nome"
    t.integer  "grupo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "temas", force: :cascade do |t|
    t.string   "descricao"
    t.integer  "sub_grupo_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "temas", ["sub_grupo_id"], name: "index_temas_on_sub_grupo_id", using: :btree

  create_table "tempandos", force: :cascade do |t|
    t.datetime "horario"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "turmas", force: :cascade do |t|
    t.string   "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "useres", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nome"
    t.string   "perfil"
    t.string   "nome_completo"
  end

  add_index "useres", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "useres", ["nome"], name: "useres_nome_key", unique: true, using: :btree
  add_index "useres", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "alunos", "turmas"
  add_foreign_key "provaalunos", "alunos"
  add_foreign_key "provaalunos", "provas"
  add_foreign_key "provas", "useres"
  add_foreign_key "questao_provas", "provas"
  add_foreign_key "questao_provas", "questoes"
  add_foreign_key "respostaalunos", "provaalunos"
  add_foreign_key "respostaalunos", "respostas"
  add_foreign_key "resultados", "provaalunos"
  add_foreign_key "resultados", "questoes"
  add_foreign_key "resultados", "respostas"
  add_foreign_key "sub_grupos", "grupos", name: "grupos_pkey"
  add_foreign_key "temas", "sub_grupos"
end
