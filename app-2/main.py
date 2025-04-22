from fastapi import FastAPI, File, UploadFile, Request
from fastapi.responses import HTMLResponse, FileResponse
from fastapi.staticfiles import StaticFiles
from manga_ocr import MangaOcr
from PIL import Image
import io
import os

app = FastAPI()

# Serve static files from the current directory
app.mount("/static", StaticFiles(directory=os.getcwd()), name="static")

mocr = MangaOcr()

@app.post("/ocr")
async def ocr(image: UploadFile = File(...)):
    contents = await image.read()
    image = Image.open(io.BytesIO(contents))
    text = mocr(image)
    return {"text": text}

@app.get("/")
async def index():
    return FileResponse("index.html")
