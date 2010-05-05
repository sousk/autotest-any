$:<< File.dirname(__FILE__) +'/../lib'

require "rubygems"
require "autotest/phpdoctest/base"
require "autotest/phpdoctest/growl_notify"
require "autotest/phpdoctest_symfony"


def result_of(type=:pass)
  case type
  when :fail
    "lib/model/om/BaseAuthorPeer                                              3%
    apps/frontend/config/config                                            100%
    lib/model/map/AuthorMapBuilder                                          88%
    lib/model/Book                                                         100%
    lib/model/map/BookMapBuilder                                            92%
    lib/model/Author                                                       100%
    lib/model/om/BaseBook                                                    0%
    lib/model/BookPeer                                                     100%
    lib/model/AuthorPeer                                                   100%
    lib/model/om/BaseAuthor                                                  0%
    lib/model/om/BaseBookPeer                                                2%
    apps/frontend/lib/myUser.class                                         100%
    TOTAL COVERAGE:   4%
    # file: lib/model/om/BaseAuthorPeer.php
     Looks like everything went fine.                                      
    # file: apps/frontend/config/config.php
     Looks like everything went fine.                                      
    # file: lib/model/map/AuthorMapBuilder.php
     Looks like everything went fine.                                      
    # file: lib/model/Book.php
    # test: through
    not ok 1 - test
    #     Failed test (./cache/frontend/test/sfDocTestPlugin/tests/lib/model/Book.php at line 27)
    1..1
     Looks like you failed 1 tests of 1.                                   
    # file: lib/model/map/BookMapBuilder.php
     Looks like everything went fine.                                      
    # file: lib/model/Author.php
     Looks like everything went fine.                                      
    # file: lib/model/om/BaseBook.php
     Looks like everything went fine.                                      
    # file: lib/model/BookPeer.php
     Looks like everything went fine.                                      
    # file: lib/model/AuthorPeer.php
     Looks like everything went fine.                                      
    # file: lib/model/om/BaseAuthor.php
     Looks like everything went fine.                                      
    # file: lib/model/om/BaseBookPeer.php
     Looks like everything went fine.                                      
    # file: apps/frontend/lib/myUser.class.php
     Looks like everything went fine."
  when :syntax_error
    "apps/frontend/config/config                                            100%
    apps/frontend/lib/myUser.class                                           0%
    TOTAL COVERAGE:  67%
    # file: apps/frontend/config/config.php
     Looks like everything went fine.                                      
    Parse error: syntax error, unexpected '}' in /path_to/project/apps/frontend/lib/myUser.class.php on line 14
    Call Stack:
        0.0006     103088   1. {main}() /path_to/project/cache/frontend/test/sfDocTestPlugin/tests/apps/frontend/lib/myUser.class.php:0
    "
  # success
  else
    "apps/frontend/config/config                                            100%
    apps/frontend/lib/myUser.class                                         100%
    TOTAL COVERAGE: 100%
    # file: apps/frontend/config/config.php
     Looks like everything went fine.                                      
    # file: apps/frontend/lib/myUser.class.php
     Looks like everything went fine."
  end
end
