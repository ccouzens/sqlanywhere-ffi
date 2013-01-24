Gem::Specification.new do |s|
  s.name = "sqlanywhere-ffi"
  s.summary = "A low-lever driver that allows Ruby code to interface with SQL Anywhere databases"
  s.description = <<-DESCRIPTION
    This library is meant to be compatible with the sqlanywhere gem.
    The only difference should be that sqlanywhere-ffi doesn't return magic numbers, but instead uses symbols.
    This library wraps the functionality provided by the SQL Anywhere DBCAPI library.
    This driver is intended to be a base-level library to be used by interface libraries such as Ruby-DBI and ActiveRecord.
    This driver can be used with SQL Anywhere 10 and later versions.
    DESCRIPTION
  s.version = "1.0.3"
  s.author = "Chris Couzens"
  s.email = "ccouzens@gmail.com"
  s.files = %w{
    README.md
    sqlanywhere-ffi.gemspec
    lib/bind_param.rb
    lib/sql_anywhere_interface.rb
    lib/data_value.rb
    lib/sqlanywhere.rb
    lib/api.rb
    lib/data_info.rb
    lib/column_info.rb
    lib/bind_param_info.rb
    lib/bool.rb
    test/test_iq.sql
    test/test.sql
    test/sqlanywhere_test.rb
    LICENSE
  }
  s.executables = []
  s.test_files = Dir["test/sqlanywhere_test.rb"]
  s.has_rdoc = false
  s.add_dependency 'ffi', '>= 1.3.1'
  s.homepage = 'https://github.com/ccouzens/sqlanywhere-ffi'
  s.requirements = <<-REQUIREMENTS
    DBCAPI should be installed.
    http://www.sybase.co.uk/detail?id=1087327
    It should also be in your library path.
    On Linux, this can be done by running: source /opt/sqlanywhere12/bin64/sa_config.sh
  REQUIREMENTS
end

