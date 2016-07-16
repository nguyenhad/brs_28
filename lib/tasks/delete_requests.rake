namespace :delete do
  task old_accepted_requests: :environment do
    puts "delete old accepted requests"
    requests = BookRequest.accepted
    requests.destroy_all
  end
end
