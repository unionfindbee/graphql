## GraphQL Demo 

This demonstration showcases a Mayhem For API scan against a GraphQL server and gateway set up using FastAPI and Strawberry, running inside a Docker container. 

### Run the demo

#### 1. Create a secrets file

Create a file called `.env` and inside it, add the following:

```
MAPI_TOKEN=<Your Mayhem API Token>
```

#### 2. Build the demo

Simply run:

```
make build
```

#### 3. Run the demo!

To run the demo, execute:

```
make demo
```

This will start both the GraphQL server and gateway inside the Docker container and execute the Mayhem API tests.

### Manual Setup Requirements

#### 1. Required Software Installations
- Ensure Python 3.11 is installed: https://www.python.org/downloads/
- Ensure Docker is installed: https://docs.docker.com/get-docker/

#### 2. Installing Necessary Python Libraries

If running outside Docker, you can install the required libraries by executing:

```
pip install -r requirements.txt
```

### Running the GraphQL Demo

After setting up the environment and installing necessary software, you can build and run the demo as described above. The demo includes the following key components:

- **GraphQL Server**: A server application running on port 5000.
- **GraphQL Gateway**: A gateway application running on port 5001.

### Testing the GraphQL API with Mayhem

The demo integrates with the Mayhem API for testing GraphQL endpoints. When the demo is run, the Mayhem API will automatically execute tests against the GraphQL gateway using the OpenAPI specification.

---

### Additional Notes

- The OpenAPI specification is automatically generated and can be accessed at `http://localhost:5001/openapi.json`.
- You can test the GraphQL API manually using tools like Insomnia or Postman by sending queries to `http://localhost:5001/`.

Ensure your `.env` file is correctly set up with your Mayhem API token before running the demo.
