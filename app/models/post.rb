class Post < ApplicationRecord
    belongs_to :user
    has_many :comments, as: :commentable, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_one_attached :image
    include PgSearch::Model
 pg_search_scope :search_full_text,
against: {
 title: 'A',
 body: 'B',
 }
end
