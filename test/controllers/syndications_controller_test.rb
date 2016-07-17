require 'test_helper'

class SyndicationsControllerTest < ActionController::TestCase
    
    def setup
        @syndication = syndications(:tour)
    end
    
    test 'routing works' do
        assert_routing 'syndications/banana', controller: 'syndications', action: 'show', name: 'banana'
    end
    
    # Stripping out '.txt' to make test mimic format assumptions of file extensions in URL
    test "should get show" do
        get :show, name: @syndication.name.gsub(".txt", "")
        assert_response :success
    end
    
    # Ensure 404 error for invalid request
    test "should get 404 with invalid request" do
       get :show, name: 'syndications/invalid'
       assert_response :not_found
    end
end
