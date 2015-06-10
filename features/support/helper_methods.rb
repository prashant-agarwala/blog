class Helper_methods
  def self.create_user(arg1,arg2)
    @user = User.new(:email => arg1, :password => arg2, :password_confirmation => arg2)
    @user.save
  end
  def self.create_profile(arg1,arg2,arg3)
    @profile = Profile.new(:email => arg1, :first_name => arg2, :last_name => arg3)
    @profile.save
  end
  def self.update_profile(email,fname,lname)
    @profile = Profile.find_by(email: email)
    @profile.first_name = fname
    @profile.last_name = lname
    @profile.save
  end
end
