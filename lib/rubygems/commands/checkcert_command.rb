# -*- ruby -*-

require "rubygems/command"
require "rubygems/version_option"
require "rubygems/local_remote_options"
require "rubygems/package"

##
# Gem command to display the certificate of a gem, if any.

class Gem::Commands::CheckcertCommand < Gem::Command
  VERSION = "1.0.2"

  include Gem::VersionOption
  include Gem::LocalRemoteOptions

  def initialize
    super("checkcert", "Display the certificate of a gem's signature, if any.",
          :domain => :local, :version => Gem::Requirement.default)

    add_version_option
    add_local_remote_options
  end

  def arguments # :nodoc:
    'GEMNAME       name of an installed gem to check'
  end

  def defaults_str # :nodoc:
    "--local --version='>= 0'"
  end

  def usage # :nodoc:
    "#{program_name} GEMNAME [options]"
  end

  def check_certificate
    gem, specs = get_one_gem_name, []

    dep = Gem::Dependency.new gem, options[:version]

    if local? then
      if File.exist? gem then
        specs << Gem::Package.new(gem).spec # rescue nil
      else
        specs.push(*dep.matching_specs)
      end
    end

    if remote? then
      abort "rubygems sucks and doesn't include the cert info..."
    end

    if specs.empty? then
      alert_error "Unknown gem '#{gem}'"
      terminate_interaction 1
    end

    spec = specs.last
    cert = spec.cert_chain.join

    unless cert.empty? then
      IO.popen("openssl x509 -noout -text", "w+") do |io|
        io.puts cert
        puts io.read
      end
    else
      alert_error "Gem '#{gem}' is not signed"
      terminate_interaction 1
    end
  end

  alias :execute :check_certificate
end
