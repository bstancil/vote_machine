namespace :vizjs do
  desc "Update Vizjs from the git repo."
  task :update do
    FileUtils.rm_rf("#{Rails.root}/vendor/javascripts/viz")
    FileUtils.rm_rf("#{Rails.root}/app/assets/javascripts/visualizie")
    
    FileUtils.mkdir_p("#{Rails.root}/vendor/javascripts/viz")
    
    sh "git clone git@github.com:yammer/viz.git #{Rails.root}/vendor/javascripts/viz"
    
    FileUtils.ln_s("../../../vendor/javascripts/viz", 'app/assets/javascripts/visualizie')
  end
end
