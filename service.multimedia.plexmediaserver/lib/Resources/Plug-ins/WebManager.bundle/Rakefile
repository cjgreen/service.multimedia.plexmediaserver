task :default => :build

desc "Clean & build a new zipfile for release"
task :release => [:clean, :build]

desc "Build a new zipfile if necessary"
task :build => 'Build/WebManager.bundle.zip'

desc "Clean all build products"
task :clean do
  rm_rf 'Build'
end

file 'Build/WebManager.bundle.zip' => 'Build/WebManager.bundle' do |t|
  puts t.prerequisites.inspect
  system 'zip', '-r', t.name, *t.prerequisites
  puts "** Built #{t.name}"
end

file 'Build/WebManager.bundle' do |t|
  mkdir_p(t.name)
  system "git archive --format tar HEAD | tar xv -C #{t.name}"
  rm_f "#{t.name}/#{File.basename(__FILE__)}"
  puts "** Built #{t.name}"
end
