require 'mysql2'
def config
  @config ||= {
    db: {
      host: ENV['ISUCONP_DB_HOST'] || 'localhost',
      port: ENV['ISUCONP_DB_PORT'] && ENV['ISUCONP_DB_PORT'].to_i,
      username: ENV['ISUCONP_DB_USER'] || 'root',
      password: ENV['ISUCONP_DB_PASSWORD'],
      database: ENV['ISUCONP_DB_NAME'] || 'isuconp',
    },
  }
end
def db
  client = Mysql2::Client.new(
    host: config[:db][:host],
    port: config[:db][:port],
    username: config[:db][:username],
    password: config[:db][:password],
    database: config[:db][:database],
    encoding: 'utf8mb4',
    reconnect: true,
  )
  client.query_options.merge!(symbolize_keys: true, database_timezone: :local, application_timezone: :local)

  client
end

ext = {
  'image/jpeg' => '.jpg',
  'image/png' => '.png',
  'image/gif' => '.gif',
}.freeze


0.upto(100) do |i|
  limit = 100
  offset = i * limit
  db.prepare("SELECT * FROM posts ORDER BY `id` LIMIT #{offset}, #{limit}").execute.each do |post|
    p pid = post[:id]
    blob =  post[:imgdata]

    fname = pid.to_s + ext[post[:mime]]
    open(File.expand_path('../public/image/' + fname, __dir__), 'wb') do |f|
      f.write blob
    end

  end
end

# .each do |post|
#   p post
# end
exit;

fname = pid.to_s + @@ext[mime]
open(File.expand_path('../public/image/' + fname, __dir__), 'wb') do |f|
  f.write params["file"][:tempfile].read
end
