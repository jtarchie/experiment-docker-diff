task :default => [:build]

task :build do
  require 'tmpdir'

  Dir.mktmpdir do |dir|
    sh('docker build -t test-app .')
    sh('docker commit test-app test-app')
    sh("docker save test-app | tar xf - -C #{dir}")

    children = {}
    Dir[File.join(dir, '**', 'json')].each do |json_file|
      manifest = JSON.parse(File.read(json_file))
      children[manifest['id']] = manifest['parent']
    end
  end
end
