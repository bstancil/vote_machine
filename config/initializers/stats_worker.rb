#require 'thread'

#WorkerThread = Thread.new {
#  loop do
#
#    begin
#      if (active_hack = Hack.where(:active_hack => true).first)
#        hack_score = active_hack.adj_score(active_hack)
#        VoteLog.create(:hack => active_hack, :hack_score => hack_score)
#        puts 1
#      end
#      
#    rescue StandardError => err
#      puts err.message
#    end
##    
#    sleep 5
#  end
#}