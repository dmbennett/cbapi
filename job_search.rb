require 'cb'
require 'iconv'
require 'pry'



Cb.configure do |config|
  config.dev_key    = 'WDHM2SQ6YLLT361PRNZF'
  config.time_out   = 5
  puts config
end


results = Cb.job.search({location: 'duluth, ga'} && {pay: !"N/A"})
response = results.response
response_job_search = response["ResponseJobSearch"]
errors =response_job_search["Errors"]
total_count =response_job_search["TotalCount"]
result_data =response_job_search["Results"]
real_result_data = result_data["JobSearchResult"]

puts JSON.pretty_generate(real_result_data)
real_result_data.each do |job_info|
binding.pry
  if job_info["Pay"] == "N/A" || nil
  else
  puts "Title: #{job_info["JobTitle"]}"
  puts "  Company: #{job_info["Company"]}"
  puts "  Location: #{job_info["Location"]}"
  puts "  Salary: #{job_info["Pay"]}"
  end
end