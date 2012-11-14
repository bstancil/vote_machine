namespace :vizjs do
  desc "Update Vizjs from the git repo."
  task :update do
    FileUtils.rm_rf("#{Rails.root}/vendor/javascripts/viz.js")
    FileUtils.rm_rf("#{Rails.root}/app/assets/javascripts/visualizie")
    
    FileUtils.mkdir_p("#{Rails.root}/vendor/javascripts/viz.js")
    
    sh "git clone git@github.com:yammer/viz.js.git #{Rails.root}/vendor/javascripts/viz.js"
    
    FileUtils.ln_s("../../../vendor/javascripts/viz.js", 'app/assets/javascripts/visualizie')
  end
end
