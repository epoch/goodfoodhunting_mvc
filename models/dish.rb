def run_sql(sql, params = [])
  conn = PG.connect(dbname: 'goodfoodhunting')
  records = conn.exec_params(sql, params)
  conn.close
  records
end

def all_dishes()
  run_sql("SELECT * FROM dishes ORDER BY name;")
end

def find_one_dish_by_id(id)
  sql = "SELECT * FROM dishes WHERE id = $1;"
  run_sql(sql, [id])[0]
end

def create_dish(name, image_url, user_id)
  sql = <<~SQL
    INSERT INTO dishes 
    (name, image_url, user_id) 
    VALUES 
    ($1, $2, $3);
  SQL

  run_sql(sql, [name, image_url, user_id])
end

def update_dish(id, name, image_url)
  sql = "UPDATE dishes SET name = $1, image_url = $2 WHERE id = $3;"
  run_sql(sql, [name, image_url, id])
end

def delete_dish(id)
  sql = "DELETE FROM dishes WHERE id = $1;"
  run_sql(sql, [id])
end

# 2:15