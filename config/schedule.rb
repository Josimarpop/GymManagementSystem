

# run this task only on servers with the :app role in Capistrano
# see Capistrano roles section below
every :day, :at => '00:00am', :roles => [:app] do
  UserMembershipCheckJob.perform_later
end

every :day, :at => '12:00am', :roles => [:app] do
  MembershipNoticeMailsenderJob.perform_later
end