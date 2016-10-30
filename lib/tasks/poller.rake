namespace :poller do
  desc "Mail Participation URLs containing the hashes to participants"
  task mail: :environment do
    URLMailer.new.mail
  end
end
$MAIL = "Please take part in my poll! - use this link to participate: \n"
TESTRUN = false
class URLMailer
  def mail
    return nil unless check_settings
    emails = File.open("tmp/emails.txt", "rb").read.split
    urls = File.open("tmp/participation_urls.txt","rb").read.split
    do_mail("Please participate in my poll!",urls, emails)

  end

  def check_settings
    @user_name = user_name = ENV['MAIL_USERNAME']
    @mail_from = mail_from = ENV['MAIL_FROM']
    @passwd = passwd = ENV['MAIL_PASSWD']
    @smtp_server = smtp_server = ENV['MAIL_SMTP']
    ok = user_name && passwd && smtp_server && mail_from
    puts usage unless ok
    ok
  end

  def usage
    usage = <<USAGE
    URLMailer needs the following environment variables to be set for configuration:

    export set MAIL_USERNAME=<your mail user name>
    export set MAIL_FROM=<your mail user name>
    export set MAIL_SMTP=<your outgoing mail server>
    export set MAIL_PASSWD=<your mail password>

USAGE
  end

  def do_mail(subject,urls,email_adresses)
    require 'pony'
    Pony.options = {:from => @mail_from,
      :subject => subject,
     :via => :smtp,
     :via_options => {
       :address        => @smtp_server,
       :port           => '25',
       :user_name      => @user_name,
       :password       => @passwd,
       :authentication => :plain, # :plain, :login, :cram_md5, no auth by default
       :domain         => "localhost.localdomain" # the HELO domain provided by the client to the server
     }}

    count = 0
    email_adresses.each do | email|
      body = ""
      if TESTRUN
        body +="Diese Mail geht an: #{email}"
        puts "Diese Mail geht an: #{email}"
        body +="\n"
        email = @mail_from
      end
      count = count +1
      body += $MAIL
      body += urls.shift

      Pony.mail(:to => email,  :charset => 'utf-8',:body => body)
    end
    puts "#{count} emails verschickt"
  end
end
