class UserMailer < ApplicationMailer
  default from: "katharina.gottwald@gmx.de"

  def contact_form(email, name, message)
  @message = message
    mail(from: email,
         to: 'katharina.gottwald@gmx.de',
         subject: "A new contact form message from #{name}")
  end

  def welcome(user)
    @appname = "Bike Shop"
    mail(to: user.email,
         subject: "Welcome to #{@appname}!")
  end

  def order_placed(user, product)
    @user = user
    @product = product
    mail(to: user.email,
      subject: "Thank you for purchasing!",
      from: 'kathy@bestberlinbikes.com')
  end
end
