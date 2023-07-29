# frozen_string_literal: true

# Active record
ActiveRecord::Schema[7.0].define(version: 20_230_405_103_452) do
  enable_extension 'plpgsql'

  create_table 'comments', force: :cascade do |t|
    t.bigint 'author_id'
    t.bigint 'post_id'
    t.text 'text'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['author_id'], name: 'index_comments_on_author_id'
    t.index ['post_id'], name: 'index_comments_on_post_id'
  end

  create_table 'likes', force: :cascade do |t|
    t.bigint 'author_id'
    t.bigint 'post_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['author_id'], name: 'index_likes_on_author_id'
    t.index ['post_id'], name: 'index_likes_on_post_id'
  end

  create_table 'posts', force: :cascade do |t|
    t.bigint 'author_id'
    t.string 'title'
    t.text 'text'
    t.integer 'comments_counter', default: 0
    t.integer 'likes_counter', default: 0
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['author_id'], name: 'index_posts_on_author_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.string 'photo'
    t.text 'bio'
    t.integer 'posts_counter'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'comments', 'posts'
  add_foreign_key 'comments', 'users', column: 'author_id'
  add_foreign_key 'likes', 'posts'
  add_foreign_key 'likes', 'users', column: 'author_id'
  add_foreign_key 'posts', 'users', column: 'author_id'
end
