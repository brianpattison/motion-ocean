# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard "motion" do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$}) {|m| puts "spec/#{m[1]}_spec.rb"; "spec/#{m[1]}_spec.rb" }
end
