# Image-specific settings
IMAGE_NAME = "freistil/base-trusty"
RUN_OPTS = "-i -t"

# Determine current Git commit
GIT_SHA = `git rev-parse HEAD`.chomp

task default: :build

desc "Build the image"
task :build do
  sh "docker build -t #{IMAGE_NAME}:#{GIT_SHA} ."
  sh "docker tag #{IMAGE_NAME}:#{GIT_SHA} #{IMAGE_NAME}:latest"
end

desc "Start a container from the image"
task run: [:build] do
  sh "docker run #{RUN_OPTS} #{IMAGE_NAME}:#{GIT_SHA}"
end

desc "Push image to Docker Hub"
task push: [:build] do
  sh "docker push #{IMAGE_NAME}:latest"
end
