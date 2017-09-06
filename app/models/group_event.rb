class GroupEvent < ApplicationRecord
  belongs_to :user
  before_save :set_duration

  default_scope -> { where(deleted_at: nil) }
  scope :is_published,        ->{ where(published: true) }
  scope :is_draft,            ->{ where(published: false) }

  validates_presence_of :name, :start_date, :end_date
  validates_presence_of :description, :location, if: Proc.new { |e| e.published? }

  def destroy
    update(deleted_at: Time.current)
  end

  def set_duration
    self.duration = (start_date..end_date).to_a.size
  end
end