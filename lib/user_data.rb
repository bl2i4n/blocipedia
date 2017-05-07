module UserData

$names = ["Yondu", "Gamora", "Athena", "Mercy", "Tracer", "Nebula", "Quill", "Thanos", "Peter", "Chris", "Quentin"]
$current_name = ""

  def self.user_name
    $current_name = $names.sample
  end

  def self.user_email
    email = []
    domains = ["@email.com", "@gmail.com", "@hotmail.com", "@usa.com", "@google.com", "@microsoft.com", "@example.com", "@bloc.com"]
    email << $current_name
    email << domains.sample
    puts email
    email.join("")
  end

end
