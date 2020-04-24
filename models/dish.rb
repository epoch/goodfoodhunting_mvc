def run_sql(sql)
  conn = PG.connect(dbname: 'goodfoodhunting')
  records = conn.exec(sql)
  conn.close
  records
end

def all_dishes()
  run_sql("SELECT * FROM dishes ORDER BY name;")
end

def find_one_dish_by_id(id)
  run_sql("SELECT * FROM dishes WHERE id = #{ id };")[0]
end

def create_dish(name, image_url)
  run_sql("INSERT INTO dishes (name, image_url) VALUES ('#{ name }', '#{ image_url }');")
end

def update_dish(id, name, image_url)
  run_sql("UPDATE dishes SET name = '#{name}', image_url = '#{image_url}' WHERE id = #{id};")
end

def delete_dish(id)
  run_sql("DELETE FROM dishes WHERE id = #{ id };")
end

# 2:15