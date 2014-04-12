require 'capistrano'
require 'capistrano/scm'
require 'tempfile'

class Capistrano::IntermediateHost < Capistrano::SCM
  module GitStrategy
    def test
      test! "[ -f #{repo_path}/HEAD ]"
    end

    def check
    end

    def generate_archive
      now = Time.now
      format = fetch( :archive_format, "tar.gz" )
      prefix = release_timestamp 
      output_file = fetch( :archive_output, Tempfile.new( "archive" ).path )
      branch = fetch( :branch )
      run_locally do
        execute :git, "archive --format=#{format} --prefix=#{prefix}/ --output=#{output_file} #{branch}" 
      end
      output_file
    end

  end
end

import File.join( File.dirname( __FILE__ ), 'tasks', 'intermediate_host.cap' )
import File.join( File.dirname( __FILE__ ), 'tasks', 'deploy.cap' )
