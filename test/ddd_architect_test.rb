require 'test_helper'

class DddArchitectTest < DddArchitect::TestCase
  test "ddd_architect skeleton" do
    run_ddd_architect do
      # Root
      assert_file "Rakefile"
      assert_file "Gemfile", /gem "rails"/, /gem "capybara"/, /gem "rdoc"/
      assert_file ".gitignore", /\.bundle/
      assert_file "Rakefile", /require 'rdoc\/task'/

      # Lib
      assert_file "lib/demo_engine.rb", /module DemoEngine\nend/

      # Vendored Rails
      assert_file "test/delivery/config/boot.rb"
      assert_file "test/delivery/config/application.rb"
    end
  end

  test "ddd_architect skeleton with dashes in name" do
    @project_name = "demo-engine"
    run_ddd_architect do
      assert_file "lib/demo_engine.rb", /module DemoEngine\nend/
    end
  end


  test "ddd_architect skeleton with test_unit" do
    run_ddd_architect do
      assert_file "test/test_helper.rb"
      assert_directory "test/support/"
      assert_directory "test/integration/"

      assert_file "test/demo_engine_test.rb", /assert_kind_of Module, DemoEngine/
      assert_file "test/integration/navigation_test.rb", /assert_kind_of Delivery::Application, Rails.application/
      assert_file "test/support/integration_case.rb", /class ActiveSupport::IntegrationCase/

      assert_file ".gitignore", /test\/delivery\/db\/\*\.sqlite3/
    end
  end

  test "ddd_architect skeleton with rspec" do
    run_ddd_architect(:rspec) do
      assert_file "spec/spec_helper.rb"
      assert_directory "spec/support/"
      assert_directory "spec/integration/"

      assert_file "spec/demo_engine_spec.rb", /DemoEngine.should be_a\(Module\)/
      assert_file "spec/integration/navigation_spec.rb", /Rails.application.should be_a\(Delivery::Application\)/

      assert_file ".gitignore", /spec\/delivery\/db\/\*\.sqlite3/
    end
  end

  test "ddd_architect rakefile can create a gem" do
    run_ddd_architect do
      execute("gem build demo_engine.gemspec")
      assert_file "demo_engine-0.0.1.gem"
    end
  end

  test "ddd_architect can run tests" do
    run_ddd_architect do
      assert_match /2 tests, 2 assertions, 0 failures, 0 errors/, execute("rake test")
    end
  end
  
  test "ddd_architect can run specs" do
    run_ddd_architect(:rspec) do
      assert_match /2 examples, 0 failures/, execute("rake spec")
    end
  end
end
