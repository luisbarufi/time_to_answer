class Question < ApplicationRecord
  belongs_to :subject, counter_cache: true, inverse_of: :questions
  has_many :answers
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true

  after_create :set_statistic

  scope :search_term_subject, ->(page, subject_id){ 
    includes(:answers, :subject).where(subject_id: subject_id).page(page) 
  }

  scope :search_term, ->(page, term){
    includes(:answers, :subject).where("lower(description) LIKE ?", "%#{term.downcase}%").page(page) 
  }

  scope :lest_questions, ->(page){ 
    includes(:answers, :subject).order('created_at desc').page(page) 
  }

  private

  def set_statistic
    AdminStatistic.set_event(AdminStatistic::EVENTS[:total_questions])
  end
end
