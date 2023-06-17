# frozen_string_literal: true

guard :rspec, cmd: 'rspec' do
  require 'guard/rspec/dsl'
  dsl = Guard::RSpec::Dsl.new(self)

  # RSpec files
  dsl.rspec.tap do |rspec|
    watch(rspec.spec_helper) { rspec.spec_dir }
    watch(rspec.spec_files)
  end

  # Ruby files
  lib_dir_capturing_filename = %r{^lib/.+/(?<file>.+).rb$}
  watch(lib_dir_capturing_filename) { |m| "spec/#{m[:file]}_spec.rb" }
end
