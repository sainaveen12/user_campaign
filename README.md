
curl request for creating user
curl -X POST http://127.0.0.1:3000/users -H "Content-Type: application/json" -d '{"user": {"name": "Alice", "email": "alice@gmail.com", "campaigns_list": [{"campaign_name": "cam1", "campaign_id": "id4"}]}}'


curl request for getting all user
curl -X GET http://127.0.0.1:3000/users

curl request for filtering users
curl -X GET "http://127.0.0.1:3000/users/filter?campaign_names=cam1,cam4" \ -H "Content-Type: application/json"
