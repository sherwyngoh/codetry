class Poem < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :language, :slug, :title, :tag_list

  extend FriendlyId
  friendly_id :title, use: :slugged

  acts_as_taggable
  acts_as_taggable_on :tags

  self.per_page = 1

  is_impressionable

  acts_as_votable

  default_scope order: 'poems.created_at DESC'

end
