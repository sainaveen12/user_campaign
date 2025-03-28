# User Campaign API

This Ruby on Rails application allows users to be managed with their associated campaigns. It supports the following functionalities:
- Create users.
- List all users.
- Filter users by campaign name.
- Paginate results for large datasets.

## Installation Steps

1. **Clone the repository**:

   git clone https://github.com/sainaveen12/user_campaign
   cd user_campaign

2. **Install dependencies**:

   bundle install

3. **Set up the database**:

   rails db:create
   rails db:migrate
   rails db:seed

4. **Start the Rails server**:

   rails s -b 0.0.0.0

   This will start the server on `http://0.0.0.0:3000`, allowing access from all IPs.


## Example `curl` Requests

### 1. **Create a User**

Use the following `curl` request to create a new user:

curl -X POST http://51.20.41.61:3000/users \
-H "Content-Type: application/json" \
-d '{"user": {"name": "Alice", "email": "alice@gmail.com", "campaigns_list": [{"campaign_name": "cam1", "campaign_id": "id4"}]}}'

This will create a new user with the name "Alice", email "alice@gmail.com", and a campaign list with one campaign.

### 2. **Get All Users**

Use the following `curl` request to retrieve all users:

curl -X GET "http://51.20.41.61:3000/users?page=1"

This will return all users, with pagination. You can change the `page` parameter to get different pages of results. By default, the API will return 10 users per page.

### 3. **Filter Users by Campaign Names**

Use the following `curl` request to filter users by campaign names:

curl -X GET "http://51.20.41.61:3000/users/filter?campaign_names=cam1,cam4&page=1" \
-H "Content-Type: application/json"

This will filter users whose campaigns contain either "cam1" or "cam4" and return the first page of results.


## Note on Pagination

For large datasets of users, pagination is used to improve performance. The `page` parameter is used to specify the page number. By default, the API returns 10 users per page.

### Example:

To get the second page of users:

curl -X GET "http://51.20.41.61:3000/users?page=2"

## API Endpoints

- **GET `/users`**: List all users.
- **POST `/users`**: Create a new user.
  - Example request body:
    {
      "name": "Alice",
      "email": "alice@gmail.com",
      "campaigns_list": [{"campaign_name": "cam4", "campaign_id": "id4"}]
    }
- **GET `/users/filter`**: Filter users by campaign name(s).
  - Example query: `/users/filter?campaign_names=cam1,cam4&page=1`


## Note: For testing in EC2 given access for all ips
Ensure that the security group allows inbound traffic on **ports 80 (HTTP)** and **3000 (Rails)**.


