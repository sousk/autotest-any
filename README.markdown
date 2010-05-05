autotest any
========================
files to help ussing ZenTest's autotest command on none-ruby projects & languages


Setup
------------------------

add directories at your project root
  |-- autotest
       |-- discover.rb
       |-- your_style.rb

discover.rb is just defining which rspec style should be used
  Autotest.add_discovery do
    ['style', 'your']
  end

your_style.rb is a little complecated, 
combine libraries, settings to work correctly on your project and language.



