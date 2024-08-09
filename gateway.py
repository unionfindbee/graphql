from fastapi import FastAPI, HTTPException, Request
from pydantic import BaseModel
import requests

app = FastAPI()

class GraphQLQuery(BaseModel):
    query: str

class GraphQLResponse(BaseModel):
    data: dict = None
    errors: list = None

@app.post("/api/graphql", response_model=GraphQLResponse)
async def graphql_gateway(query: GraphQLQuery):
    # Send the query to the GraphQL server
    response = requests.post('http://localhost:5000/graphql', json=query.dict())
    data = response.json()

    # Handle any errors returned by the GraphQL server
    if "errors" in data:
        raise HTTPException(status_code=400, detail=data["errors"])

    # Return the GraphQL data as the response
    return data

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=5001)
