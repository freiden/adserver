module NamingConcern
  extend ActiveSupport::Concern

  def full_name
    "#{first_name.humanize} #{last_name.humanize}"
  end
end