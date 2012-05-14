envie
=====

Feature toggles made easy.

Non rails usage
---------------

Creating two enviroments:

```ruby
production = Envie.production.with(:oauth)
development = production.derive.with(:openid)
```

And now making available code for specific features

```ruby
if Envie.has?(:oauth)
  # code that will run only if oauth is available
end
```

```ruby
if Envie.has?(:openid)
  # code that will run only if openid is available
end
```

There's a shorthand as well

```ruby
if Envie.oauth?
  # code that will run only if oauth is available
end
```

Caveat: this won't work with some names as the following methods are already defined:

:has?, :include?, :const_defined?, :class_variable_defined?, :method_defined?,
:public_method_defined?, :private_method_defined?, :protected_method_defined?,
:autoload?, :anonymous?, :reachable?, :qualified_const_defined?, :duplicable?,
:traced?, :trace_disabled?, :any_unrecognized_keys?, :newrelic_method_exists?,
:traced_method_exists?, :in?, :blank?, :present?, :acts_like?, :html_safe?,
:is_haml?, :method_exists?, :nil?, :eql?, :tainted?, :untrusted?, :frozen?,
:instance_variable_defined?, :instance_of?, :kind_of?, :is_a?, :respond_to?,
:respond_to_missing?, :equal?

Code is attached to features, not enviroments, so one can easily move the feature from one place
to another without having to "grep" and find all its usage.

Rails usage
-----------

Set up your enviroment at enviroment.rb

your definitions must go between application and initilization, e.g.:

```ruby
require File.expand_path('../application', __FILE__)


# setup feature toggles
Envie.production

Envie.development.with(:geewiz)

#pick a default
Envie.use :development

# Initialize the rails application
Solmarket::Application.initialize!
```

then in environments/production.rb

```ruby
Envie.use(:production)
```

now just use the features everywhere: in your routes, controllers and erb (or haml) templates.

Contributing with Rails usage?

We are expecting contributions that automatically define enviroments by reading an active record table.

Installing
----------

	gem install envie
	
Contributing to envie
---------------------
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

Copyright
---------

Copyright (c) 2011 Guilherme Silveira. See LICENSE.txt for
further details.

