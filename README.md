QA Grad Project
===============

This uses [watir](http://watir.com/) (pronounced *water*) and Ruby to run test cases against a PHP application. Note that watir actually uses selenium!

This project uses the [rspec](http://rspec.info/) framework to do testing.

## Prerequisites
Before you begin, make sure you have Ruby 1.9 or higher installed. It's **strongly** suggested you use OSX (Mac) or Linux. You also need to have firefox installed.

## Usage
The first time you use the application, `cd` into the project and install any required dependencies:

	cd /path/to/project
	gem install bundler
	bundle
	
Afterwards, you can use the command line to run tests:

	bundle exec rake
	
An HTML report will be generated in the `tmp` directory.

