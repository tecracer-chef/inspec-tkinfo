# inspec-tkinfo

InSpec plugin to retrieve Test Kitchen data as inputs.

## Use Case

In some cases you want to get info about the Test Kitchen environment that
your InSpec verifier is running in. This plugin offers some insight into
instance name, platform name and suite name.

## Installation

Simply execute `inspec plugin install inspec-tkinfo`, which will get
the plugin from RubyGems and install/register it with InSpec.

You can verify successful installation via `inspec plugin list`

## Usage

You have three input names available:
- KITCHEN_INSTANCE_NAME ('default-amazon2')
- KITCHEN_SUITE_NAME ('default')
- KITCHEN_PLATFORM_NAME ('amazon2')

Use them in your InSpec tests like this:

```ruby
instance_name = input('KITCHEN_INSTANCE_NAME')

describe file("/etc/#{instance_name}") do
  it { should exist }
end
```
