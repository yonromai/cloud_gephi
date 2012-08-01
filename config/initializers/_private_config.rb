CloudGephi::Application.configure do
  {
    ################################
    # Put here your private config #
    ################################

    # SMTP Configuration
    SMTP_EMAIL: "Put here your smtp email",
    SMTP_PASSWORD: "Put here your smtp password",
    SMTP_PORT: "Put here your smtp password",
    SMTP_ADDRESS: "Put here your smtp address",

    # Amazon WS Configuration
    AWS_ACCESS_KEY: "Put here your AWS access key",
    AWS_SECRET_KEY: "Put here your AWS secret key"

    ################################
  }.each do |var, value|
    ENV[var.to_s] ||= value 
  end
end