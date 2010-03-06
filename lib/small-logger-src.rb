
# Ensure this FILE NAME is the name you want for your library
# This is the primary criteria by which your library will be
# found by users of rubygems and sprouts
name = File.basename(__FILE__).split('.').shift

gem_wrap name do |t|
  # version is a dot-delimited, 3 digit version string
  t.version       = '0.0.0'
  # Short summary of your library or project
  t.summary       = "The smallish Logger"
  # Your name
  t.author        = 'Francis Varga'
  # Your email or - better yet - the address of your project email list
  t.email         = 'fv@varga-multimedia.com'
  # The homepage of your library
  t.homepage      = 'http://github.com/FrancisVarga/smallLogger'
  t.sprout_spec   =<<EOF
- !ruby/object:Sprout::RemoteFileTarget 
  platform: universal
  filename: small-logger-src.zip
  archive_type: zip
  url: http://github.com/FrancisVarga/smallLogger/zipball/sprout-0.0.0
  archive_path: FrancisVarga-smallLogger-b1451a8/src 
EOF
end

task :package => name
