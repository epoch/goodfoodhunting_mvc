require 'bcrypt'

def find_one_user_by_id(id)
  sql = "SELECT * FROM users WHERE id = $1;"
  run_sql(sql, [id])[0]
end

def find_one_user_by_email(email)
  records = run_sql("SELECT * FROM users WHERE email = $1;", [email])
  if records.count == 0
    return nil
  else
    return records[0]
  end
end

def create_user(email, password)
  password_digest = BCrypt::Password.create(password)
  sql = "INSERT INTO users (email, password_digest) VALUES ($1, $2);"
  run_sql(sql, [email, password_digest])
end