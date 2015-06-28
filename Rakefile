require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'spec'
  t.pattern = 'spec/**/*_spec.rb'
  t.file_list << FileList['spec/**/*_spec.rb', 'spec/spec_helper.rb']
  t.verbose =  true
end

task default: :test
