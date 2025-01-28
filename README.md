# README

# Race Manager

This README documents the steps necessary to get the Race Manager application up and running.

## Versions

- **Ruby**: 3.3.5
- **Rails**: 8.0.1

## System Dependencies

- PostgreSQL

## Configuration

1. Clone the repository:
   ```sh
   git clone https://github.com/your-username/race_manager.git
   cd race_manager
   ```

2. Install dependencies:
   ```sh
   bundle install
   ```

3. Create and migrate the database:
   ```sh
   rails db:create
   rails db:migrate
   ```

4. Seed the database:
   ```sh
   rails db:seed
   ```

5. Start the server:
   ```sh
   rails server
   ```

   ## Important
For best experience, you should run this project in parallel to the front end that I developed using React and Typescript. Link -> https://github.com/Luisfelipedev27/RaceManagerFrontEnd.git


  ### How to run the tests suite
  ```sh
  bundle exec rspec
  ```

  ### API Endpoints
  #### GET /
  Returns all races -> api/v1/races

  Response:
  ```json
  [
    {
        "id": 7,
        "name": "Race",
        "created_at": "2025-01-28T06:57:44.504Z",
        "updated_at": "2025-01-28T06:57:44.504Z"
    }
  ]
  ```

  #### POST /
  Creates a race -> api/v1/races
  Request body:
  ```json
  {
    "race": {
      "name": "Race 1",
      "lanes_attributes": [
        { "student_id": 1 },
        { "student_id": 2 }
      ]
    }
  }
  ```

  #### GET /:id
  Returns a race -> api/v1/races/:id
  Response:
  ```json
  {
    "id": 1,
    "name": "Race 1",
    "results": [
      {
        "student": "John Doe",
        "position": 1
      },
      {
        "student": "Jane Smith",
        "position": 2
      }
    ]
  }
  ```

  #### POST /:id/results
  Updates positions of the results of a race -> api/v1/races/:id/results
  Request body:
  ```json
  {
    "results": [
      { "student_id": 1, "position": 1 },
      { "student_id": 2, "position": 2 },
      { "student_id": 3, "position": 3 }
    ]
  }
  ```

