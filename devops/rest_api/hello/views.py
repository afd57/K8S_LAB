import os

from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework import status

@api_view(["GET",])
def hello_world(request):
    returning_data = {"message": "Hello, world!"}
    returning_data["type"] = os.environ.get("type")
    return Response(returning_data, status.HTTP_200_OK)