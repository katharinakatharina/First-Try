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

  def oder_placed(user, product)
    @user = user
    @product = product
    mail(from: 'katharina.gottwald@gmx.de',
        to: 'user.email',
        subject: 'Your order of the #{product.name} has been placed.'
    )

end
