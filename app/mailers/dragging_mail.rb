class DraggingMail < ActionMailer::Base
  default from: "joseph.borremans@gmail.com"
  
    def welcome_email(user)
      @user = user
      @url = "http://gmail.com/login"
      mail(:to => user.email, :subject => "Welome to Dragging-up's Awesome Tool site")
  
  end
end

