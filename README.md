SQL Anywhere Ruby Driver
------------------------
This is a native SQL Anywhere driver for Ruby. This library wraps the 
functionality provided by the SQL Anywhere DBCAPI library. This driver
is intended to be a base-level library to be used by interface libraries
such as Ruby-DBI and ActiveRecord.

This driver can be used with SQL Anywhere 10 and later versions.

This driver is licensed under the Apache License, Version 2.

The official code repository is located on GitHub. The repository can be cloned with:

    git clone git://github.com/ccouzens/sqlanywhere-ffi.git

Running Unit Tests
==================

1. Change to the the <tt>test</tt> directory
`cd test`
2. Create a testing database:
`dbinit test`
3. Start the testing database:
`dbeng12 test.db`
4. Create the test schema:
`dbisql -c "eng=test;uid=dba;pwd=sql" test.sql`
5. Run the unit tests:
`ruby sqlanywhere_test.rb`

<b>If the tests fail to run, make sure you have set up the SQL Anywhere environment variables correctly.</b> For more information,
review the online documentation [here](http://dcx.sybase.com/index.html#1200/en/dbadmin/da-envvar-b-5846792.html).
I run `source /opt/sqlanywhere12/bin64/sa_config.sh` in my shell before running the tests.

Sample
------

This script makes a connection, prints <tt>Successful Ruby Connection</tt> to the SQL
Anywhere console, then disconnects.

    # load the SQLAnywhere gem
    require 'sqlanywhere-ffi'
    # create an interface
    api = SQLAnywhere::SQLAnywhereInterface.new()
    # initialize the interface (doesn't actually do anything, but kept for compatibility)
    SQLAnywhere::API.sqlany_initialize_interface( api )
    # initialize our api object
    api.sqlany_init()
    # create a connection
    conn = api.sqlany_new_connection()
    # establish a connection
    api.sqlany_connect(conn, "uid=dba;pwd=sql")
    # execute a query without a result set
    api.sqlany_execute_immediate(conn, "MESSAGE 'Successful Ruby Connection'")
    # disconnect from the database
    api.sqlany_disconnect(conn)
    # free the connection resources
    api.sqlany_free_connection(conn)
    # free resources the api object uses
    api.sqlany_fini()
    # close the interface (doesn't actually do anything, but kept for compatibility)
    SQLAnywhere::API.sqlany_finalize_interface( api )
