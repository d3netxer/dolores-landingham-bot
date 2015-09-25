class ScheduledMessage < ActiveRecord::Base
  validates :body, presence: true
  validates :days_after_start, presence: true
  validates :title, presence: true

  before_save :escape_special_characters

  def body
    self[:body].html_safe
  end

  protected

  def escape_special_characters
    self.body = ERB::Util::html_escape(self[:body])
  end
end
