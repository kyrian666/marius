module Test

def test_list 
     [
      {
       	:api_name => "matthew",
	:api_uri => "/matthew-api/",
	:api_port_back => "10190",
	:api_hosts_back => [ "microservices.qa.workshare.com","qa-microservice-eu02.workshare.net" ]
      },
       {
        :api_name => "teams",
	:api_uri => "/teams-api/",
	:api_port_back => "10255",
	:api_hosts_back => [ "microservices.qa.workshare.com","qa-microservice-eu02.workshare.net" ]
      },
       {
       	:api_name => "zippy",
	:api_uri => "/zippy-api/",
	:api_port_back => "10089",
	:api_hosts_back => [ "microservices.qa.workshare.com","qa-microservice-eu02.workshare.net" ]
       }
      ]
   end
end
