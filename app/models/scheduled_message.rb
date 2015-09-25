class ScheduledMessage < ActiveRecord::Base
  validates :body, presence: true
  validates :days_after_start, presence: true
  validates :title, presence: true

  before_save :escape_specific_characters

  def body
    self[:body].html_safe if self[:body]
  end

  protected

  def escape_specific_characters
    self.body = self[:body].gsub('&', '&amp;')
    self.body = self[:body].gsub('<', '&lt;')
    self.body = self[:body].gsub('>', '&gt;')
  end
end
