# Step helpers, confusingly named after something awesome
module AnotherWorld
  def last_sent_email
    ActionMailer::Base.deliveries.last.body.to_s
  end

  def backdoor_login(user)
    visit "/backdoor-login?email=#{CGI.escape(user.email)}"
    @current_user = user
  end

  def current_user
    @current_user
  end

  def file_fixture(file_name)
    Rails.root.join('spec/fixtures/files', file_name)
  end

  def fill_in_fields(table)
    table.rows_hash.each do |key, value|
      fill_in key, with: value
    end
  end

  def current_path
    URI.parse(current_url).path
  end
end

World(AnotherWorld)
