namespace :dev do

  DEFAULT_PASSWORD = 123456

  desc "Sets up the development environment"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Deleting the database...") { %x(rails db:drop) }
      show_spinner("Creating the database...") {  %x(rails db:create) }
      show_spinner("Migrating the tables...") { %x(rails db:migrate) }
      show_spinner("Registering the default administrator...") { %x(rails dev:add_default_admin) }
      show_spinner("Registering the default user...") { %x(rails dev:add_default_user) }
    else
      puts "You are not in a development environment."
    end
  end

  desc "Add the default Administrator"
  task add_default_admin: :environment do 
    Admin.create!(
      email: 'admin@admin.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end

  desc "Add the default user"
  task add_default_user: :environment do 
    User.create!(
      email: 'user@user.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end

  private

  def show_spinner(start_msg, end_msg = "successfully!")
    spinner = TTY::Spinner.new("[:spinner] #{start_msg}")
    spinner.auto_spin
    yield
    spinner.success("(#{end_msg})")
  end

end